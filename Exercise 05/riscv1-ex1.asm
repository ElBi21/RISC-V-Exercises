.data
	.word 15		# n = how many numbers we have to print
	.ascii " "		# my separator
.text
	lui x3, 0x10010		# default address
	lw x1, 0(x3)		# load n into x1
	lw x11, 4(x3)		# load the space
	ori x2, x0, 1		# put the number 1 into x2
	ori x3, x0, 1		# and also in x3
	ori x17, x0, 1		# put 1 in x17 to print
	addi x1, x1, -1		# reduce n by 1 because we're printing 1
	ori x10, x0, 1
	ecall			# print the 1
	
	ori x17, x0, 11		# print a space
	add x10, x0, x11	# |
	ecall			# |
	ori x17, x0, 1		#_|
	
repeat:	add x3, x2, x3		# x2 + x3 --> x3
	add x10, x0, x3		# load in x10
	ecall			# print
	
	ori x17, x0, 11		# print a space
	add x10, x0, x11	# |
	ecall			# |
	ori x17, x0, 1		#_|
	
	addi x1, x1, -1		# reduce n by 1
	blt x1, x0, stop	# if n < 1 then stop
	
	add, x2, x2, x3		# do the same thing but in another order
	add x10, x0, x2		# store into x10
	ecall			# print
	
	ori x17, x0, 11		# print a space
	add x10, x0, x11	# |
	ecall			# |
	ori x17, x0, 1		#_|
	
	addi x1, x1, -1		# reduce by one
	bgt x1, x0, repeat	# if n > 1 then repeat
	
stop:	addi x17, x17, 9	# put 10 into x17
	ecall			# terminate