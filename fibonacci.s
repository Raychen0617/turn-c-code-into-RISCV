.data
argument: .word 10
str1:   .string "th number in the Fibonacci sequence is "


.text
main:
	lw       a0, argument   
    jal      ra, Fibonacci
	
	# Print the result to console
    mv       a1, a0
    lw       a0, argument
    jal      ra, printResult

    # Exit program
    li       a0, 10
    ecall

Fibonacci:
        addi     sp, sp, -24
        sw       ra, 16(sp)
        sw       a0, 8(sp)
        sw       a1, 0(sp)
        
        
        beq      a0, zero, ELSE0
        addi     t1, zero, 1
        beq      a0, t1, ELSE1

        addi     a0, a0, -1
        jal      ra,Fibonacci
        mv       a1, a0

        lw       a0, 8(sp)
        addi     a0, a0, -2
        jal      ra,Fibonacci
        add      a0, a0, a1
        j        THEN  
    ELSE0:
        li       a0, 0
        j        THEN

    ELSE1:
        li       a0, 1
        j        THEN

    THEN:

        lw      a1, 0(sp)
        lw      ra, 16(sp)
        addi    sp, sp, 24
        ret  


	
	
printResult:
    mv       t0, a0
    mv       t1, a1


    mv       a1, t0
    li       a0, 1
    ecall

    la       a1, str1
    li       a0, 4
    ecall

    mv       a1, t1
    li       a0, 1
    ecall

    ret
	
