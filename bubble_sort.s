.data

argument1: .word  5,3,6,7,31,23,43,12,45,1	
argument2: .word  10
str1: .string "Array: "
str2: .string "Sorted: "
str3: .string " "
str4: .string "\n"

.text
main:
	la		 a2, argument1 

	la		 a1, str1
	li		 a0, 4
	ecall
	la		 a1, str4
	li		 a0, 4
	ecall

	lw 		 a3, argument2
	jal      ra, printArray


	lw 		 a3, argument2   
    jal      ra, bubble_sort
	
	la		 a1, str4
	li		 a0, 4
	ecall
	
	la		 a1, str2
	li		 a0, 4
	ecall
	la		 a1, str4
	li		 a0, 4
	ecall


	lw 		 a3, argument2
    jal      ra, printArray

    li       a0, 10
    ecall

bubble_sort:
	li		t1, 0
	
	FOR_START1:

		bge 	t1, a3, FOR_END1	# t1=i

		addi	t2, t1, -1			# t2=j
		FOR_START2:

			bltz 	t2, FOR_END2
			li		t3, 4			#t3=4		
			mul		t3, t3, t2
			add		t3, t3, a2
			addi	t4, t3, 4		#t4 = t3 + 4
			lw 		t5, 0(t3)
			lw 		t6, 0(t4)
			
			ble  	t5, t6, FOR_END2
			sw		t6, 0(t3)
			sw 		t5, 0(t4)

			addi	t2, t2, -1
			
			
			j 		FOR_START2  # jump to FOR_START2
			

		FOR_END2:

		addi	t1, t1, 1
		
		j		FOR_START1
	
	FOR_END1:
	ret

printArray:

	li	t1, 0		#t1=i
	FOR_START3:

		bge		t1, a3, FOR_END3
		li		t2, 4
		mul		t2, t2, t1
		add		t2, t2, a2
		lw		a1, 0(t2)
		li		a0, 1
		ecall
		

		la       a1, str3
    	li       a0, 4
    	ecall

		addi	t1, t1, 1 
		
		j FOR_START3
		

	FOR_END3:
	ret






