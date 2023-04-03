# Recursively reverse a list

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
	
	jal x1, reverseRecursive
	
	returnVal:
	
	li x17, 10
	ecall

	reverseRecursive:
	beq x12, x0, returnVal		# base case: if node = 0 then exit
	addi x15, x15, 1		# counter for the final part of the function
	sw x1, 
	sw x12, 0(x2)			# store the address of where the function was called
	lw x11, 0(x12)			# load number in x12
	sw x11, -4(x2)			# store the number into the stack
	addi x2, x2, -8			# update stack position
	lw x13, 4(x12)			# load next address
	mv x12, x13			# store next address into x12
	jal x1, reverseRecursive	# recall the function with the data
	
	