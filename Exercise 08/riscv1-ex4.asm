.data
	.word 6
	.word 5
	.word 7, -2, 0, 1, 1
	
.text 
	lui x8, 0x10010
	lw x11, 0(x8)
	lw x12, 4(x8)
	lw x13, 8(x8)
	
	addi x8, x8, 8			# update standard address
	li x17, 1			# load 1 into x17

checkAgain:
	beq x12, x0, stopHere		# if len = 0 stop
	bne x11, x13, nextOne		# if x11 != x12 then load next element
	ori x10, x0, 1			# if here it means that the element is in the array: we print and
					# stop the process
	ecall				# print
	li x17, 10			# prepare to termiante
	ecall				# terminate
	
nextOne:lw x13, 4(x8)			# load the next word
	addi x8, x8, 4			# update address
	addi x12, x12, -1		# reduce len
	beq x0, x0, checkAgain		# go back and check
	
stopHere:
	ori x10, x0, 0
	ecall
	li x17, 10
	ecall
	