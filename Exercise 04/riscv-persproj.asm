.data 
    .ascii "I"	# 1
    .ascii "V"	# 5
    .ascii "X"	# 10
    .ascii "L"	# 50
    .ascii "C"	# 100
    .ascii "D"	# 500
    .ascii "M"	# 1000
    .ascii "MMXIV"	# <--- HERE GOES THE NUMBER
	
.text
    lui x1, 0x10010	# create standard address
    lb x11, 0(x1)	# store the I
    lb x12, 1(x1)	# store the V
    lb x13, 2(x1)	# store the X
    lb x14, 3(x1)	# store the L
    lb x15, 4(x1)	# store the C
    lb x16, 5(x1)	# store the D
    lb x18, 6(x1)	# store the M
	
    addi x1, x1, 6	# update the address
    addi x7, x0, 2  # store a 2 for the subtraction
	
toNext:
    addi x1, x1, 1	# loop for checking the next number: add 1 to the address
	
	  lb x19, 0(x1)	# store the first cypher
	
	  beq x19, x0, stop   # stop if the number is equal to 0
			
			# now the program adds a given value depending
			# on the letter that we have. Remember that:
			# - x6 is a temp register to make the number negative
			# - the new numbers are stored on x8;
			# - the numbers get moved on x9 to check if the
			#   program has to do any subtraction;
			# - the numbers get summed on x10 in order to get
			#   printed
			
    beq x19, x18, itsM
    beq x19, x16, itsD
    beq x19, x15, itsC
    beq x19, x14, itsL
    beq x19, x13, itsX
    beq x19, x12, itsV
    beq x19, x11, itsI
	

itsM:
    addi x8, x0, 1000
	  beq x0, x0, ifSub
	
itsD:
    addi x8, x0, 500
	  beq x0, x0, ifSub
	
itsC:
    addi x8, x0, 100
	  beq x0, x0, ifSub
	
itsL:
    addi x8, x0, 50
	  beq x0, x0, ifSub
	
itsX:
    addi x8, x0, 10
	  beq x0, x0, ifSub
	
itsV:
    addi x8, x0, 5
	  beq x0, x0, ifSub
	
itsI:
    addi x8, x0, 1
	  beq x0, x0, ifSub	
	
ifSub:
    blt x8, x9, dontSub	# if the number is lower than don't subtract and jump
    beq x8, x9, dontSub
    beq x9, x0, dontSub	# if x9 is empty then don't subtract and jump
				
    mul x6, x9, x7		# subtraction consists of making the number negative
    sub x9, x9, x6		# now I do x9 - x6 and store it into x9
    lui x6, 0		# I then proceed to clear the register x6

dontSub:
    add x10, x10, x9	# move the content of x9 -> x10
    or x9, x0, x8		# move the content of x8 -> x9
    lui x8, 0		# clear x8
    beq x0, x0, toNext	# we proceed then to the next cypher
	
stop:
    add x10, x9, x10	# the content of x9 gets summed to x10. x8 will be empty
    ori x17, x0, 1		# I prepare for the ecall, storing 1 into x17
    ecall			# I print the number
    addi x17, x17, 9	# I prepare for the ecall, storing 10 into x17
    ecall			# the program terminated (hopefully with code 0)
