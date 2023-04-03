# Print the greater integer between the two ones given

.data
	.word 6, 11
	
.text
	lui x8, 0x10010
	lw x10, 0(x8)
	lw x11, 4(x8)
	
	bgt x10, x11, justPrint
	
	or x10, x0, x11

justPrint:	
	li x17, 1
	ecall
	li x17, 10
	ecall
	
