.data 
lista:	.word n1
n1: 	.word 1, n2
n2:	.word 2, n3
n3:	.word 1, n4
n4:	.word 3, n5
n5:	.word 1, n6
n6:	.word 1, 0
x:	.word 1

.text
	lw x7, x
	lui x8, 0x10010
	lw x11, 0(x8)
	
ciclo:	bne x11, x7, goOn
	addi x10, x10, 1
goOn:	addi x8, x8, 4
	lw x11, 0(x8)
	bne x11, x0, ciclo
	
	ori x17, x0, 1
	ecall
	addi x17, x17, 9
	ecall