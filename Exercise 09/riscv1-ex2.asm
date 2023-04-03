.data
n:		.word 2			# n: rows
m: 		.word 2			# m: columns
a:		.word 4, -1, 0, 1
	
.text 
		lui x8, 0x10010
		ori x9, x0, 4
		ori x17, x0, 1
		lw x11, n
		lw x12, m
		
		addi x8, x8, 8
	
	
myLoop:	beq x7, x12, printAndClose
		jal x1, countRow
		addi x7, x7, 1
		beq x0, x0, myLoop

printAndClose:	
		ecall
		addi x17, x17, 9
		ecall
	
		# ----------------------------------------------
	
countRow:
		beq x13, x11, endIt
		lw x14, 0(x8)			# load number
		add x10, x10, x14		# add it to x10
		addi x13, x13, 1		# counter of n
		addi x8, x8, 4			# update address
		beq x0, x0, countRow		# repeat
endIt:	add x13, x0, x0			# set x13 = 0
		jalr x0, x1, 0			# return val