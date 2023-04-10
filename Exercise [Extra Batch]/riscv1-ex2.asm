# Print the length of the list recursively using the stack

.data
n01:	.word 7, n02
n04:	.word 8, 0
n02:	.word 11, n03
n03:	.word -2, n04

lista:  .word n01

.text
	lw x11, lista		# load the beginning of the list
	li x10, 0		# initialize the register x10
	ori x17, x0, 1		# prepare to print
	
	jal x1, lunghezza	# call the function lunghezza
	
	ecall			# print
	ori x17, x0, 10		# prepare to terminate
	ecall			# terminate
	
	# x11: beginning address (and all the addresses)
	
lunghezza:
	bne x11, x0, recursive	# if the address is 0 then stop
	jalr x0, x1, 0		# return nothing
recursive:
	addi x2, x2, -8		# prepare the stack
	sw x1, 0(x2)		# first store the address
	sw x17, 4(x2)		# then store a 1 for each node
	lw x11, 4(x11)		# load the next tail
	
	jal lunghezza
	
	lw x1, 0(x2)		# put the next address in x1
	lw x12, 4(x2)		# put the value in x12
	add x10, x10, x12	# sum the 1s into x10
	addi x2, x2, 8		# go to the next part of the stack
	
	jalr x0, x1, 0