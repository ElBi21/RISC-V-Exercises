# Linked lists are composed by two elements:
#  - a value;
#  - a "link" to the next element, called "pointer";
#
# It's different from a standard Python list, since linked lists are a variation of the concept of arrays.
# When the link to the next element is equal to 0 then this means that the list ended.
# In this example we are trying to print the length of the given linked list

.data
n01:	.word 7, n02 	#0x10010010	# for example we can have a linked list where the first element is 7
n04:	.word 8, 0	#0		# for example the tail of the list is here
n02:	.word 11, n03	#0x10010018	# here we may have the second element
n03:	.word -2, n04	#0x10010008	# and here we could have the third element

lista:  .word n01	#0x10010004

.text
	lw x11, lista			# this way we can load the first link to the list.
					# The assembler will find the address for us
	ori x17, x0, 1			# prepare to print
	
check:	beq x11, x0, stop		# if address = 0 then stop
	addi x10, x10, 1		# add 1
	lw x11, 4(x11)			# load the loaded address
	beq x0, x0, check		# repeat from check
	
stop: 	ecall				# print
	ori x17, x0, 10			# prepare to terminate
	ecall				# terminate