# Build a function that takes an array and arrange it in such a way that the first item is the minimum
.data
n:	.word 6
x:	.word 43, 65, 44, 62, 9, 12

.text
	lui x7, 0x10010
	addi x7, x7, 4
	lw x8, n
	
	jal x1, placeMin
	
	ori x17, x0, 10
	ecall
	
	# x7: array address, x8: array len, x10: value of array, x11: temp min
	
placeMin:
	bne x8, x0, goOn
	beq x0, x0, whenArrayOver
goOn:
	addi x8, x8, -1			# reduce len by 1
	lw x10, 0(x7)			# load first item
	bne x11, x0, hasAlreadyOne	# if there is already a number
	or x11, x0, x10			# load the first item
	beq x0, x0, placeMin
hasAlreadyOne:
	blt x10, x11, newMin		# check if x10 < x11: if not then
	addi x2, x2, -4			# update the stack's address
	sw x10, 0(x2)			# save the higher number in the stack
	beq x0, x0, placeMin		# repeat the process
newMin:
	addi x2, x2, -4			# update the stack's address
	sw x11, 0(x2)			# save the old min in the stack
	or x11, x0, x10			# move the new min
	
whenArrayOver:
	lw x8, n			# get again the len
	addi x8, x8, -1			# we need len - 1
	
	sw x11, 0(x7)			# the first item of the array will be the min
	addi x7, x7, 4			# prepare the next address
maybeTheEnd:	
	bne x8, x0, emptyTheStack	# if we finish to empty the stack
	jalr x0, x1, 0			# we end the function
emptyTheStack:
	bne x13, x0, toRepeat		# if x13 then we can skip the next 3 instructions
	slli x13, x8, 2			# multiply len by 4
	addi x13, x13, -4		# reduce 4 to adapt to the lowest stack's element
	add x2, x2, x13			# add the number to the sp

toRepeat:
	lw x12, 0(x2)			# load the last element of the stack
	sw x12, 0(x7)			# store the element into the address given by x7
	addi x7, x7, 4
	addi x2, x2, -4
	addi x8, x8, -1
	beq x0, x0, maybeTheEnd
	