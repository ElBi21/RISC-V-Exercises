# SOLUTION FOR EXERCISE 8

.data
lista:	.word nodo1
nodo1:	.word 8, nodo2
nodo2:	.word -5, nodo3
nodo3:	.word 6, nodo4
nodo5:	.word 12, 0
nodo4:	.word 1, nodo5

.text
	lw x10, lista
	jal x1, inverti
	li x17, 10
	ecall
	
inverti:bne x10, x0, base2
	jalr x0, x1, 0
base2:  lw x5, 4(x10)
	bne x5, x0, ric
	jalr x0, x1, 0
ric:	addi x2, x2, -8
	sw x1, 0(x2)
	sw x10, 4(x2)
	lw x10, 4(x10)
	jal x1, inverti
	lw x5, 4(x2)
	lw x6, 4(x5)
	sw x5, 4(x6)
	sw x0, 4(x5)
	lw x1, 0(x2)
	addi x2, x2, 8
	jalr x0, x1, 0