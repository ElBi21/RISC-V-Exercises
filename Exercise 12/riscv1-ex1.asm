# Given a value N, search efficiently in the tree if N is present

.data
tree:	.word n01
n01:	.word 7, n02, n03
n02:	.word 4, n04, n05
n03:	.word 11, n06, n07
n04:	.word 1, 0, 0
n05:	.word 6, 0, 0
n06:	.word 8, 0, 0
n07:	.word 26, 0, 0
N:	.word 6

.text
	lw x10, tree
	lw x11, N
	ori x17, x0, 1
	
	jal x1, cerca
	
	ecall
	ori x17, x0, 10
	ecall
	
cerca:	
	lw x12, 0(x10)
	bne x10, x0, lookIfZero		# if node != 0
	jalr x0, x1, 0
	
lookIfZero:
	bne x12, x11, goOn		# if node == x11 (so our value)
	ori x10, x10, 1
	jalr x0, x1, 0
	
goOn:
	addi x2, x2, -4			# prepare the stack pointer
	sw x1, 0(x2)

	blt x12, x11, goToRight		# if rootVal > N then go to the right node
	lw x10, 4(x10)			# load the LEFT node
	jal cerca
	# beq x0, x0, ric
goToRight:
	lw x10, 8(x10)			# load the RIGHT node
	jal cerca
	
	lw x1, 0(x2)
	addi x2, x2, 4
	jalr x0, x1, 0
	
	