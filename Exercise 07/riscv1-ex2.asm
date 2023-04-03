.data
n01:	.word 7, n02
n04:	.word 8, 0
n02:	.word 11, n03
n03:	.word -2, n04

lista:  .word n01

.text
	lw x11, lista		# load the beginning of the list
	li x10, 0		# initialize the register x10
	
	jal x1, lunghezza	# call the function lunghezza
	
	ori x17, x0, 1		# prepare to print
	ecall			# print
	ori x17, x0, 10		# prepare to terminate
	ecall			# terminate
	
lunghezza:
	bne x11, x0, goOn	# if the address is 0 then stop
	jalr x0, x1, 0		# jump back to line 13
goOn:	addi x10, x10, 1	# add 1 to x10
	lw x11, 4(x11)		# load the next address
	beqz x0, lunghezza	# repeat the function
	
# Try to do it with the stack