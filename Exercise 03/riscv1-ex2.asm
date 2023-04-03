.data
	.word 4
	.word 6
	.word 3, 5, 11, 12, 21, 27

.text
	ori x17, x0, 1		# prepare the ecall to print it

	lui x8, 0x10010		# initialise address
	lw x6, 0(x8)		# load the index
	lw x7, 4(x8)		# load the len of the array
	addi x8, x8, 8		# load the address of the beginning array
	
	slli x6, x6, 2		# multiply the beginning address by len * 4
	add x8, x8, x6		# add the multiplier bias to the beginning address
	
	lw x10, 0(x8)		# load the number in x10
	
	ecall			# print it
	
	addi x17, x17, 9	# load 10 into the register x17
	ecall			# terminate the process