.data
	.ascii "Cat"
	.ascii "Snowball"
	
.text
	lui x4, 0x10010			#			[address: 0x00400010]
	
	lw x10, 0(x4)			# 			[address: 0x00400014]
	ori x17, x0, 4			# 			[address: 0x00400018]
	ecall				# 			[address: 0x0040001C]
	jal x1, printACapo		# 			[address: 0x00400020]
	
	lw x10, 4(x4)			# 			[address: 0x00400024]
	ori x17, x0, 4			# 			[address: 0x00400028]
	ecall				# 			[address: 0x0040002C]
	jal x1, printACapo		# 			[address: 0x00400030]
	
	ori x17, x0, 10			# 			[address: 0x00400034]
	ecall				# 			[address: 0x00400038]
	
printACapo:
	ori x10, x0, 10			# 			[address: 0x0040003C]
	ori x17, x0, 11			# 			[address: 0x00400040]
	ecall				# 			[address: 0x00400044]
	jalr x0, x1, 0			# 			[address: 0x00400048]