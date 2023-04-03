.data
n:	.word 8
v:	.word 5, 8, -3, 0, 1, 1, 7, 2
x:	.word 1
y: 	.word 8

.text 
	lui x8, 0x10010
	lui x9, 0x10010
	ori x17, x0, 1
	
	lw x12, x
	jal x1, count
	
	lw x12, y
	jal x1, count
	
	ecall
	addi x17, x17, 9
	ecall
	
	# ---------------------------------------------------
	# x11: counter, x12: item to search, x13: actual item

count:	lw x11, 0(x8)			# n
repeat:	beq x11, x0, endIt		# if n = 0 end
	addi x9, x9, 4			# update address
	lw x13, 0(x9)			# load number
	bne x13, x12, nextOne		# if I find it
	addi x10, x10, 1		# x10 + 1
nextOne:addi x11, x11, -1		# n - 1
	beq x0, x0, repeat		# go to the next one
endIt:	jalr x0, x1, 0