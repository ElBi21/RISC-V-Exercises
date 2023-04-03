.data
albero:	.word n01
n01:	.word 8, n02, n03
n02:	.word 5, n04, n05
n03:	.word 3, n06, 0
n04:	.word 7, 0, 0
n05:	.word -2, 0, 0
n06:	.word 10, 0, 0

.text 

conta:	bne a0, zero, ric
	jalr zero, ra, 0
	addi sp, sp, -12
	sw ra, 0(sp)
	sw a0, 4(sp)
	lw a0, 4(a0)
	jal ra, conta
	sw a0, 8(sp)
	lw a0, 4(sp)
	lw 