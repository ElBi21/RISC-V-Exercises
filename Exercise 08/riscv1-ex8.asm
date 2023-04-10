# Recursively reverse a list and print it using a separator

.data
	.ascii " - "
lista:	.word nodo1
nodo1:	.word 8, nodo2
nodo2:	.word -5, nodo3
nodo3:	.word 6, nodo4
nodo5:	.word 12, 0
nodo4:	.word 1, nodo5

.text
	lui x8, 0x10010		# standard address
	lw x18, 0(x8)		# load the separator in x18
	ori x17, x0, 1		# prepare to print integers
	lw x11, lista		# put into x11 the address of the next list
	addi x8, x8, 8		# prepare the next address
	
	jal x1, giraLista	# call the function
	
	ori x17, x0, 10
	ecall
	
	
	# x11: list address, x12: list value
	
giraLista:
	bne x11, x0, recursionTime
	jalr x0, x1, 0
	
recursionTime:
	addi x2, x2, -12	# prepare the stack's address
	lw x12, 0(x11)		# put the value of the list into x12
	lw x11, 4(x11)		# put the list next address into x13
	
	sw x1, 0(x2)		# store first the return address of the func
	sw x11, 4(x2)		# store the next address into the stack
	sw x12, 8(x2)		# store the value into the stack
	addi x8, x8, 8		# update the address
	
	jal giraLista		# call the function again
	
	lw x1, 0(x2)		# put into x1 the address from the stack
	lw x11, 4(x2)		# put into x11 the address of the next list item
	lw x10, 8(x2)		# put into x12 the value of the list item
	
	ecall
	beq x0, x0, printSep

returnToFunc:	
	sw x10, 0(x8)		# save into the memory the next address
	addi x9, x8, 8		# make the address for the next number
	sw x9, 4(x8)		# store the address of the next number
	
	addi x8, x8, 8		# update the next address
	addi x2, x2, 12		# shift the stack address
	
	jalr x0, x1, 0
	
printSep:
	addi x17, x17, 10	# prepare to print string
	or x19, x0, x10		# save temporarily the content of x10
	or x10, x0, x18		# put the string into x10
	ecall			# print the separator
	addi x17, x17, -10	# prepare to print integers
	or x10, x0, x19		# put back the content of x10
	beq x0, x0, returnToFunc
