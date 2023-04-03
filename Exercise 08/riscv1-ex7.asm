# Print the sum of each element of the list. We assume that the list is not empty

.data
lista:	.word nodo1
nodo1:	.word 8, nodo2
nodo2:	.word -5, nodo3
nodo3:	.word 6, nodo4
nodo5:	.word 12, 0
nodo4:	.word 1, nodo5

.text
	lui x8, 0x10010
	
	lw x12, 0(x8)
	
	jal x1, sumTheNumbersRecursive
	
	li x17, 1
	ecall
	li x17, 10
	ecall
	
sumTheNumbersRecursive:
	beq x12, x0, returnVal		# base case: if node = 0 then exit
	addi x15, x15, 1		# counter for the final part of the function
	sw x1, 0(x2)			# store the address of where the function was called
	lw x11, 0(x12)			# load number in x12
	sw x11, -4(x2)			# store the number into the stack
	addi x2, x2, -8			# update stack position
	lw x13, 4(x12)			# load next address
	mv x12, x13			# store next address into x12
	jal x1, sumTheNumbersRecursive	# recall the function with the data
	
returnVal:
	beq x15, x0, endTheFunction
	lw x14, 0(x2)			# put the number into x14
	lw x1, 4(x2)			# put the address into x14
	add x10, x10, x14		# sum the numbers
	addi x2, x2, 8			# update the stack address
	addi x15, x15, -1		# set counter = counter - 1
	beq x0, x0, returnVal		# repeat the loop

endTheFunction:
	jalr x0, x1, 0			# exit the function
	