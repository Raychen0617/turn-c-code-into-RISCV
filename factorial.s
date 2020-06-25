# This example shows an implementation of the mathematical
# factorial function (! function).

.data
argument: .word 1 # Number to find the factorial value of
str1: .string "Factorial value of "
str2: .string " is "

.text
main:
        lw       a0, argument   # Load argument from static data
        jal      ra, fact       # Jump-and-link to the 'fact' label

        # Print the result to console
        mv       a1, a0
        lw       a0, argument
        jal      ra, printResult

        # Exit program
        li       a0, 10
        ecall

fact:
        addi     sp, sp, -16
        sw       ra, 8(sp)
        sw       a0, 0(sp)
        addi     t0, a0, -1
        bge      t0, zero, nfact

        addi     a0, zero, 1
		beq      a0, zero, ELSE1
		addi	 t3, zero, 1
		beq		 a0, t0, ELSE2
        addi     sp, sp, 16
        jalr     x0, x1, 0
		
ELSE1:
	addi	a0, zero, 1
	jalr 	ra
	
ELSE2:
	addi	a0, zero, 1
	jalr	ra
	

nfact:
        addi     a0, a0, -1
        jal      ra, fact

        addi     t1, a0, 0
        lw       a0, 0(sp)
        lw       ra, 8(sp)
        addi     sp, sp, 16

        mul      a0, a0, t1
        ret


# expects:
# a0: Value which factorial number was computed from
# a1: Factorial result
printResult:
        mv       t0, a0
        mv       t1, a1

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

        ret
