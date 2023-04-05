# We have previously seen some examples of trees, but mainly binary trees. How do we represent non-binary
# trees (so n-ary trees)? We proceed by declaring the concept of forest: a forest is a group of nodes, which all have in
# common the same root. In each node the structure is:
#
#	labelOfNode:	.word value, child, siblings
#
#
#			 n01
#			/ | \
#		       /  |  \
#		      /   |   \
#	   	    n02  n03  n04
#		    	/| |\
#		       / | | \
#		      /  | |  \
#		     /   | |   \
#		   n05 n06 n07 n08
#
# Count the number of nodes recursively

.data
albero: .word n01
n01:	.word 6, n02, 0
n02:	.word -2, 0, n03
n03:	.word 1, n05, n04
n04:	.word 1, 0, 0
n05:	.word 5, 0, n06
n06:	.word 8, 0, n07
n07:	.word 11, 0, n08
n08:	.word -1, 0, 0
	
.text
conta:	bne x10, x0, ric
	jalr x0, x1, 0
	
ric:	addi x2, x2, -12
	sw x1, 0(x2)
	sw x10, 4(x2)
	lw x10, 4(x10)
	jal x1, conta
	
	sw x10, 8(x2)
	lw x10, 4(x2)
	lw x10, 8(x10)
	jal x1, conta
	
	lw x5, 8(x2)
	add x10, x10, x5
	addi x10, x10, 1
	lw x1, 0(x2)
	addi x2, x2, 12
	jalr x0, x1, 0
