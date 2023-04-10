# Sum the values of all the nodes in the tree

.data
albero:	.word n01
n01:	.word 8, n02, n03
n02:	.word 5, n04, n05
n03:	.word 3, n06, 0
n04:	.word 7, 0, 0
n05:	.word -2, 0, 0
n06:	.word 10, 0, 0

.text 
	lui x8, 0x10010		# put the standard address into x8
	lw x11, albero		# store into x11 the next tree's node address
	ori x17, x0, 1		# prepare to print
	
	jal x1, conta		# call the function
	
	ecall			# print
	addi x17, x17, 9	# prepare to terminate
	ecall			# terminate

conta:	bne x11, x0, ricorsivo	# base case: the tree's node is empty
	jalr x0, x1, 0		# we just return
	
ricorsivo:
	addi x2, x2, -12	# prepare to store into the stack
	
	sw x1, 0(x2)		# store first the function address
	sw x11, 4(x2)		# store into the stack the address of the node. This comes in handy
				# when we have to go back to the upper node
	lw x13, 0(x11)		# get the value of the node
	sw x13, 8(x2)		# store a 1 for each left node
	lw x11, 4(x11)		# load into x11 the left child
	
	jal conta		# call again the function
	
	lw x11, 4(x2)		# into x11 we load the previous node
	lw x11, 8(x11)		# since in x11 there is the previous node, we proceed to load the
				# right child of the main node
				
	jal conta		# we call the function again
	
	lw x12, 8(x2)		# load the 1 into x12
	add x10, x10, x12	# sum the 1 into x10
	lw x1, 0(x2)		# put into x1 the function address
	addi x2, x2, 12		# scale the stack's address
	jalr x0, x1, 0		# return