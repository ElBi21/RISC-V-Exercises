.data
	.word 6				# len of array
	.word 3, 5, 11, 12, 21, 27	# array

.text
	lui x8, 0x10010			# load the smallest address
	lw x6, 0(x8)			# load the len
	ori x17, x0, 1			# set the ecall as "print int"

loop:	lw x7, 4(x8)			# num of array
	add x10, x10, x7		# sum of num
	addi x8, x8, 4			# update the address
	addi x6, x6, -1			# len - 1
	bgt x6, x0, loop		# loop if the len is bigger than 0
	
	ecall
	addi x17, x17, 9
	ecall