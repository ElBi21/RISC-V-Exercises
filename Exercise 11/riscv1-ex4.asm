# Sort the array such that all the values smaller than y are on the left of y and the bigger ones
# are on the right. They don't have to be sorted internally they just have to be well-placed into the
# array

.data
n:	.word 5
x:	.word 543, 65, 3, 43, 7
y:	.word 43

.text
	#x16: counter positive, x13: counter negative
	lw x8, n		# load length of the array
	lw x9, y		# load the special value
	lui x11, 0x10010	# load the standard address
	addi x11, x11, 4
	
	or x15, x0, x8		# prepare the new sp address
	slli x15, x15, 2	# multiply the len by 4 to find how much we have to shift into the sp
	sub x2, x2, x15		# we shifted by n positions in the array
	
	jal x1, halfSort	# jump to the function
	
	ori x17, x0, 10		# prepare to terminate
	ecall
	
halfSort:
	beq x8, x0, arrayEnded	# if n = 0 then we go to the next part
	
	lw x10, 0(x11)		# load first value
	
	bge x10, x9, biggerVal	# if the value is bigger than y
	addi x16, x16, 1	# increment negative counter by 1
	or x14, x0, x16		# bring the neg counter into x14
	slli x14, x14, 2	# this is the shift of the sp
	addi x14, x14, -4	# adjust the shift
	add x2, x2, x14		# prepare the sp
	sw x10, 0(x2)		# store into the sp
	sub x2, x2, x14		# restore the sp address
	sub x14, x14, x14	# clear x14
	beq x0, x0, goToNext
	
biggerVal:
	addi x13, x13, 1	# increment positive counter by 1
	or x14, x0, x16		# bring the positive counter into x14
	slli x14, x14, 2	# this is the shift of the sp
	sub x2, x2, x14		# prepare the sp
	sw x10, 0(x2)		# store into the sp
	add x2, x2, x14		# restore the sp address
	sub x14, x14, x14	# clear x14
	
goToNext:
	addi x11, x11, 4	# update address
	addi x8, x8, -1		# update length
	beq x0, x0, halfSort	# repeat the process
	
arrayEnded:
	