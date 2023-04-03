# Print the sum of each element of the list. We assume that the list is not empty

.data
lista:	.word nodo1
nodo1:	.word 8, nodo2
nodo2:	.word -5, nodo3
nodo3:	.word 6, nodo4
nodo5:	.word 12, 0
nodo4:	.word 1, nodo5

.text
	lui x8, 0x10010
	
	lw x12, 0(x8)
	mv x8, x12
	
	jal x1, sumTheNumbers
	
	li x17, 1
	ecall
	li x17, 10
	ecall
	
sumTheNumbers:
	lw x11, 0(x8)			# load the val
	add x10, x10, x11		# add the counter with x11 (x10 + x11 ==> x10)
	lw x12, 4(x8)			# load the node
	mv x8, x12
	bne x12, x0, sumTheNumbers	# if the node is != 0 then repeat the function
					# else
	jalr x0, x1, 0			# end the function
	