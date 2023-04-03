# The program should print in console the length of the string

.data
	.asciz "ACSAI è fighissimo!" # Expected length = 19
.text
	ori x17, x0, 1
	lui x12, 0x10010
	ori x10, x0, 0
	  			# x10: counter ;
				# x11: character ;
				# x12: address
	
loop  :	lb x11, 0(x12)		# load the byte
	beq x11, x0, print	# if the char != 0 then print
	
	addi x10, x10, 1	# counter + 1
	addi x12, x12, 1	# address + 1
	beq x0, x0, loop	# return to loop
	
print : ecall	