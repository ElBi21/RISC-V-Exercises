# When we have for example to call a lot of functions, we can't store always all the addresses of the
# jal(s) on the registers, eventually we could run out of registers, and that's why we use a stack. Every
# program has a stack in memory, and we can add values to the stack and then pick them up again. The
# address that points to the stack in the memory is saved into x2, or sp (stands for Stack Point). The
# stack's memory must be somehow canceled when we don't need anymore a piece of data from it. We can
# simply overwrite the stack when we don't need its data anymore. It is good practise to properly handle
# our data, since the memory is finite and is useful for any kind of operation (the stack's size is
# only 1028kb).

# We'll now proceed to explain recursive functions, which can be useful when using the stack at its
# "full potential". We'll try now to do a recursive function to calculate the factorial of a given
# number

.data
	.word 5
	
.text
	lui x8, 0x10010		# Base address
	lw x10, 0(x8)		# Laod the number
	ori x17, x0, 1		# Load 1 and prepare to print
	
	jal ra, fattoriale	# Call the factorial function
	
	ecall			# Print the number
	
	ori x17, x0, 10		# Prepare to terminate
	ecall			# Terminate
	
fattoriale:
	bne x10, x0, recursive	# If x10 != x17 then continue, else return the value
	ori x10, x0, 1
	jalr x0, x1, 0		# Return to the code
	
recursive:
	addi x2, x2, -8		# We can proceed, so first we point to a blank space into the stack.
				# Why don't we put to sp - 4? Because we want to store the number
				# of n - 1 into the memory, so that we don't occupy some registers.
	sw x1, 0(x2)		# We store the first address into the stack (the one of the previous call)
	sw x10, 4(x2)		# Then we store the number into the stack
	
	addi x10, x10, -1	# Now we can get n - 1 into x10
	
	jal fattoriale		# Now we call the function again
				
				# Now that we got to this point, we have to multiply all the numbers
				# that we obtained
				
	lw x5, 4(x2)		# We take the number of the previous call and we store it into x5
	mul x10, x10, x5	# We multiply n by (n - 1)
	lw x1, 0(x2)		# We load now the address of the previous call into x1
	addi x2, x2, 8		# We go to the next couple address-number in the stack
	jalr x0, x1, 0		# And now we repeat until we empty the stack
	