.data
argument1: .word 512
argument2: .word 480
str1: .string "GCD value of "
str2: .string " and "
str3: .string " is "
.text

main:

		lw       a0, argument1  
		lw		 a1, argument2
		jal      ra, gcd

		mv       a2, a0	
		lw       a0, argument1
		jal      ra, printResult

		li       a0, 10
		ecall
	
gcd:                                    # @gcd
		addi    sp, sp, -32
        sw      ra, 24(sp)
        sw      a0, 16(sp)
		sw		a1, 8(sp)
        bne     a1, zero, ngcd
		addi    a0, a0, 0
        addi    sp, sp, 32		
		jalr    ra
ngcd:
		addi	t0, a1, 0
        rem     a1, a0, a1
		addi	a0, t0, 0
		jal     ra, gcd
		addi    s0, a0, 0
		
		lw      a1, 8(sp)
        lw      a0, 16(sp)
        lw		ra, 24(sp)
		addi	sp, sp, 32
		
		addi	a0, s0, 0
		ret



printResult:
        mv       t0, a0
        mv       t1, a1
		mv		 t2, a2
		
		

        la       a1, str1
        li       a0, 4
        ecall

        mv       a1, t0
        li       a0, 1
        ecall

        la       a1, str2
        li       a0, 4
        ecall

        mv       a1, t1
        li       a0, 1
        ecall
		
		la       a1, str3
        li       a0, 4
        ecall
		
		
		mv       a1, t2
        li       a0, 1
        ecall

 				
      

		ret

