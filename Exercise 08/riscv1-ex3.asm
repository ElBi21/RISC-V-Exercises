.data
x:	.word 6
y:	.word 11
	.ascii ","

.text
	li x17, 1
	lui x8, 0x10010
	lw x10, 0(x8)
	lw x11, 4(x8)
	lw x12, 8(x8)
	
stampa:	ecall
	jal x1, space
	add x10, x10, x17
	blt x10, x11, stampa
	
	li x17, 10
	ecall
	
space:  li x17, 11		# prepare to print the string
	mv x13, x10		# save elsewhere the content of x10
	or x10, x0, x12		# move the comma in x10
	ecall			# print it
	mv x10, x13		# move back the content of x13 into x10
	li x17, 1		# load 1 into x17
	jalr x0, x1, 0		# return to where you were