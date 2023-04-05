# Print the numbers in the even positions of the array
.data
	.word 6
	.word 5
	.word 7, -2, 0, 1, 1
	
.text
	lui x8, 0x10010		
	lw x11, 4(x8)			# laod length
	lw x12, 8(x8)			# load element 0 of array
	addi x8, x8, 8			# update address

andAnotherOne:
	add x10, x10, x12		# sum content of x12 and x10
	addi x8, x8, 8			# update address
	lw x12, 0(x8)			# load next element
	addi x11, x11, -2		# set len - 2
	bge x11, x0, andAnotherOne	# if len > 0 then go on
	
	li x17, 1
	ecall
	li x17, 10
	ecall
