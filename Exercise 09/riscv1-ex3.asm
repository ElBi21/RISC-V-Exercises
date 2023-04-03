# We assume that the matrix is a square matrix

.data
n:	.word 3			# n: rows
m: 	.word 3			# m: columns
a:	.word 4, -1, 0, 1, 4, 6, 5, 2, 8

.text
	lw x11, n		# load the number of rows (it's the same of m)
	lw x15, m
	
	lui x8, 0x10010		# standard address
	ori x7, x0, 4		# load a 4 into x7
	addi x8, x8, 8		# beginning address of a
	
diagonalLoop: 
	beq x12, x11, printAndExit
	lw x13, 0(x8)		# load number
	add x10, x10, x13	# add in x10
	mul x14, x11, x7	# |
	addi x14, x14, 4	# |
	add x8, x8, x14		# |update address
	addi x12, x12, 1	# update counter
	beq x0, x0, diagonalLoop
	
printAndExit:
	ori x17, x0, 1
	ecall
	addi x17, x0, 9
	ecall