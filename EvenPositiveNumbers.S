# Given an N-element vector, A, generate another vector, B,
# such that B only contains those elements of A that are even numbers greater than 0.
.globl main

.equ N, 12

.data
A: .word 0,1,2,7,-8,4,5,12,11,-2,6,3
countB: .word 0

.bss
B: .space 4*N

.text
main:
    # TO DO: Write the code for copying even positive numbers in A to B, and count them in countB.
    la a0, A        # load address of vector A to a0 register
    la a1, B        # load address of vector B to a1 register
    la a2, countB   # load address of countB to a2 register
    addi t0, zero, N    # t0 register contains the number of elements of A
    addi t1, zero, 0    # t1 register for iterate through the vector A (i)
    addi t3, zero, 0    # countB is 0

    repeat:
        beq t1, t0, store  # if t1, t0 equal(at the end), store the total count
        add t1, t1, 1   # increment the iterator
        lw t2, 0(a0)    # t2 refers to A[i]
        addi a0, a0, 4  # move a0 to next position
        bge zero, t2, repeat    # check for positive 
        andi t4, t2, 1  # check for even numbers
        bne t4, zero, repeat    # t4 is 1, if element is odd   
        sw t2, 0(a1)    # store in B
        addi a1, a1, 4  # move a1 to next position
        addi t3, t3, 1  # increment the counter
        bne t1, t0, repeat  # repeat while t0 and t1 are not equal

    store:
        sw t3, 0(a2) # total count
    ret  
.end
