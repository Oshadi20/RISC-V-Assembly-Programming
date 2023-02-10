# Given two N-element vectors (i.e., arrays), A and B, 
# create another vector, C, defined as: 
# C(i) = |A[i] + B[N-i-1]|, i = 0,..,N-1.
# Write a program in RISC-V assembly that computes the new vector. 
# Use 12-element arrays in your program. 
.globl main

.equ N, 10

.data
A: .word 0,1,2,7,-8,4,5,-12,11,-2
B: .word 0,1,2,7,-8,4,5,12,-11,-2

.bss
C: .space 4*N

.text
main:
    # TO DO : Write the code to add two vectors A and b, and store the answer in C
    la a0, A    # load address of vector A to a0 register
    la a1, B    # load address of vector B to a1 register
    la a2, C    # load address of C to a2 register
    addi t0, zero, N    # t0 register contains the number of elements
    addi t1, zero, 0    # t1 register for iterate through the vector A and B
    addi a1, a1, 4*(N-1)    # coressponding element address of B
repeat:
    add t1, t1, 1   # increment the iterator
    lw t2, 0(a0)    # A[i]
    lw t3, 0(a1)    
    add t2, t2, t3 
    
    # get the absolute value
    srai t4, t2, 0x1f
    xor t5, t4, t2 
    sub t2, t5, t4 
    sw t2, 0(a2)    # store the result

    # change pointers
    addi a0, a0,4
    addi a1, a1, -1
    addi a2, a2, 4
    bne t0, t1 ,repeat 

    ret 
    
.end
