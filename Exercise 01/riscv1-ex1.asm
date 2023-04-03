.data
	.word 17
	.word 25

.text
	lui x5, 0x10010
	lw x3, 0(x5)
	lw x4, 4(x5)
	add x3, x3, x4
	sw x3, 8(x5)