# Sort the array from the smallest to the greatest item

.data
n:	.word 5
x:	.word 43, 65, 32, 76, 3

.text
	lui x8, 0x10010
	lw x9, n
	addi x9, x9, -1
	sw x9, 0(x8)
	jal x1, reverseArray
	
	ori x17, x0, 10
	ecall

reverseArray:
	lw x9, n			# store the array length
	lui x8, 0x10010
	addi x8, x8, 4
nextOne:
	bne x9, x0, continue		# continue if the len is bigger than 0
	jalr x0, x1, 0
continue:
	lw x10, 0(x8)			# store in x10 the first number
	lw x11, 4(x8)			# store in x11 the second number
	bge x11, x10, theyAreSorted	# branch if x10 < x11
	sw x10, 4(x8)			# invert the two numbers
	sw x11, 0(x8)
	beq x0, x0, reverseArray	# restart the function
theyAreSorted:
	addi x8, x8, 4			# update the address
	addi x9, x9, -1			# update the len
	beq x0, x0, nextOne
	
	
	
	
	