.data
x:	.word 6
y: 	.word 11

.text	
	lw x10, x
	lw x11, y
	bgt x10, x11, fine
	mv x10, x11
fine:	li x17, 1
	ecall
	li x17, 10
	ecall
	
# This is the same version of ex 1 but with labels. In this case we would lose at least one clock
# cycle because the two lw get transalted into two instructions each