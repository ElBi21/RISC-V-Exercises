.data
		.word 7

.text
		lui x11, 0x10010	# set the address
		ori x17, x0, 1		# set to print an integer in x17
	
		lw x10, 0(x11)		# store the number
	
        ori x12, x10, 0		# temp store the number
loop:	addi x12, x12, -1	# reduce the num of 1
		mul x10, x10, x12	# multiply the numbers
		bgt x12, x17, loop	# repeat if bigger than 1
	
		ecall
	
		ori x17, x0, 10
		ecall