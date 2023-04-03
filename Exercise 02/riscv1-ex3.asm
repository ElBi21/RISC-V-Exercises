# Given two integers stored in the memory (in the data segment), print the smaller.

.data
	.word 0x31877323
	.word 0x75894379

.text
	lui x11, 0x10010	# loading numbers
	lw x3, 0(x11)
	lw x4, 4(x11)
	
	ori x17, x0, 34		# for printing
	
	blt x3, x4, oneBig
	
	add x10, x4, x0		# if x4 is smaller
	
oneBig :add x10, x3, x0		# if x3 is smaller

	ecall