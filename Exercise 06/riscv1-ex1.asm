# We can do functions in Assembly, by using the jal instruction ("jump and link"). We can't do functions
# with the beq operation because we wouldn't know, once we call the function, where we should return
# our value. With the jal instruction we follow this syntax:
#
#	jal reg, label
#
# where: 
#  - reg is the register where we are gonna store the address of where the code should go after the
#    execution of the function (so the address of the PC + 4);
#  - label is the address where the PC has to jump.
#
# In a function, we can pass arguments by storing them into the registers. The arguments are traditionally
# stored into a0, a1, a2, ... (so x10, x11, x12, ...) and the result in x10. The arguments will scale
# accordingly.
#
# There is also the jalr instruction, which has the follow syntax:
#
#	jalr reg1, reg2, immediate
#
# where:
#  - reg1 is the register where we store the address of the PC;
#  - reg2 holds the address of the new instruction;
#  - immediate is a number that gets added to the value stored in reg2. The instruction will store thus
#    in the PC the sum of reg2 + immediate
#
# The jal instruction uses the J-Type, while the jals uses the I-Type.
# We can store the address in any register we want, but for tradition we should use x1.
# Let us make an example

.data
	.word 5
	.word 29
	
.text				# we remember that instructions start at 0x00400010

	lui x8, 0x10010		# so this instruction is at 0x00400010		[address: 0x00400010]
	jal x1, myFunc		# we store into x1 the PC + 0x14  		[address: 0x00400014]
	
	ori x17, x17, 1		# prepare for print 				[address: 0x00400018]
	ecall			# print 					[address: 0x0040001C]
	ori x17, x0, 10		# prepare for terminating 			[address: 0x00400020]
	ecall			# terminate 					[address: 0x00400024]
	
myFunc:	lw x11, 0(x8)		# we load the words 				[address: 0x00400028]
	lw x12, 4(x8)		# 						[address: 0x0040002C]
	add x10, x11, x12	# we add the numbers 				[address: 0x00400030]
	jalr zero, x1, 0	# and we return to where we called the function [address: 0x00400034]
	