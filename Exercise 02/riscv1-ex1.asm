.data	# starts from address 0x10010000
	.word 2 		# at 0x10010000
	.asciz "zero"		# at 0x10010004
	.asciz "non zero"	# at 0x10010009
	.asciz "ciao"		# at 0x10010012
	.asciz "Hello World"	# at 0x10010017

.text
	lui s0, 0x10010		# s0 is the traditional name of x8
	ori a0, s0, 0x04	# We could've also used addi here, it's the same.
				# a0 is the traditional name of x10. We are getting
				# ready to print a string in the console. In a0 we
				# have the memory address of the first string, aka "zero"
				
	addi a7, zero, 4	# Here we are putting into x17 the number 4
	
	lw t0, 0(s0)		# In t0 (aka x5) we are loading the first word, so
				# the number 2 that is in memory
	beq, t0, zero, salta	# Now, if the content into t0 is equal to zero, we
				# make the code continue from where the code finds
				# a *, which is our label. If we didn't use a label,
				# we would've had to calculate the address of the
				# instruction that we want to execute. The right offset
				# of the beq is 8
	
	ori a0, s0, 0x17	# If the code doesn't jump to the ecall, it means that
				# t0 and zero are not equal, thus it will print the next
				# string
	
salta : ecall
