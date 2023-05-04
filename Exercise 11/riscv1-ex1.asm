# Remove all the negative items from the list

.data
lista:	.word n01
n01:	.word 8, n02
n02:	.word 5, n03
n03:	.word -2, n04
n04:	.word 5, 0

.text
	lw x10, lista
	
	jal x1, removeNeg
	
	ori x17, x0, 10
	ecall
	
	# x10: address, x11: value, x12: temp address, x13: temp value
	
removeNeg:
	bne x10, x0, goOn
	jalr x0, x1, 0
goOn:
	lw x11, 0(x10)
	blt x11, x0, isNeg
	addi x10, x10, 4
	beq x0, x0, removeNeg
isNeg:	
	or x12, x10, x0
repeatNeg:
	addi x12, x12, 4
	lw x13, 0(x12)
	blt x13, x0, repeatNeg
	or x10, x0, x12
	beq x0, x0, removeNeg
