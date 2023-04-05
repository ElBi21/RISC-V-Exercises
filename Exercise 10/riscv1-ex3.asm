# Print the Maximum Common Divisor (MCD)

.data
x:	.word 54
y:	.word 36

.text
	lui x5, 0x10010
	lw x6, 0(x5)
	lw x7, 4(x5)

checkMCD:
	beq x7, x0, printX	# print if x = 0
	sub x8, x6, x7		# x8 <- x6 - x7 (x - y)
	or x6, x7, x0		# x6 <- x7	(y becomes x)
	or x7, x8, x0		# x7 <- x8	(x-y becomes y)
	ori x8, x0, 0		# x8 = 0	(empty x8)
	beq x0, x0, checkMCD	# repeat
	
printX:
	or x10, x6, x0
	
	ori x17, x0, 1
	ecall
	addi x17, x17, 9
	ecall