# Reverse an array recursively. Either print it or store it into the memory (not by replacing
# the already existing array)

.data
	.word 8						# array length
	.word 34, 5, 7, 233, 182, 99, 52, 489		# array
	
.text
	lui x5, 0x10010		# standard address
	lw x8, 0(x5)		# load array length
	addi x5, x5, 4		# shift default address
	ori x17, x0, 1		# prepare to print
	
	jal x1, inTheStack	# execute the function
	
	addi x17, x17, 9	# prepare to terminate
	ecall			# terminate
	
	# x1: function address, x9: array element
	
inTheStack:
	bne x8, x0, recursive	# if the array's length == 0 then don't jump
				
	# in x5 we'll already have the address for placing the reversed array
				
	jalr x0, x1, 0
recursive:
	lw x9, 0(x5)		# load array element
	addi x2, x2, -8		# prepare the stack address
	
	sw x1, 0(x2)		# store first the address of x1
	sw x9, 4(x2)		# store then the element of the array
	
	addi x5, x5, 4		# update the address of the next array element
	addi x8, x8, -1		# set the len - 1
	
	jal inTheStack		# call the function again
	
	# at this point, we have into the stack all the numbers of the array. We can
	# proceed to reverse it and print it
	
	lw x10, 4(x2)		# load the value
	ecall			# print the value
	sw x10, 0(x5)		# save the value into the memory
	addi x5, x5, 4		# update the standard address
	
	lw x1, 0(x2)		# load in x1 the address of the function call
	addi x2, x2, 8		# go to the next element of the stack
	jalr x0, x1, 0		# and repeat until we finish
	
