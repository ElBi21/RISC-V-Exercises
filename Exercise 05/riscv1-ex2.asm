.data
	.word 54, 6, 57, 87, 57, 5, 435, 43, 3, 4

.text
	lui x8, 0x10010
	
	lw x10, 0(x8)		# load first num
	addi x8, x8, 4		# augment address by 4
	
goForth:lw x11, 0(x8)		# load num
	beq x11, x0, stop	# if num = 0 then stop
	bgt x11, x10, replace	# if the number is bigger than replace it
goOn:	addi x8, x8, 4		# augment the address
	beq x0, x0, goForth	# then repeat
	
replace:add x10, x0, x11	# store the max into x10
	beq x0, x0, goOn	# then continue
	
stop:	ori x17, x0, 1		# put 1 into x17
	ecall			# print
	
	ori x17, x0, 10		# put 10 into x17
	ecall			# terminate