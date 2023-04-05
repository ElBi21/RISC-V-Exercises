# Print the sum of the positive numbers in x

.data
n:	.word 6
x:	.word 5, 8, 6, -2, -1, 8

.text
	lui x5, 0x10010		# stardard address
	lw x6, 0(x5)		# load n
	addi x5, x5, 4		# update address
	
nextNum:
	beq x6, x0, goPrint	# if n = 0 then print
	lw x11, 0(x5)		# number
	addi x6, x6, -1		# n - 1
	addi x5, x5, 4		# address + 4
	blt x11, x0, nextNum	# if x < 0 repeat
	add x10, x10, x11	# add the number to the sum in x10
	beq x0, x0, nextNum	# repeat
	
goPrint:
	ori x17, x0, 1		# prepare to print
	ecall			# print
	addi x17, x17, 9	# prepare to terminate
	ecall			# terminate