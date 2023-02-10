
.globl main

.equ N, 15

.data
input: .word 7

.bss
fact: .space 4

.text
main:
    # TO DO : Calculate the factorial of the number given in 'input' and put the answer in 'fact'
    la a0, input    # load address of input number to a0 register
    lw t0, 0(a0)    # store the word of a0 in t0 register

    la a1, fact     # load address of output number to a1 register

    li t1, 1        # load 1 to t1 register to start the multiplication
    add t2, t0, zero    # store the number which is to calculate the factorial,
                        # to get the terminating condition of the loop
    # factorial calculation
    # 7*1 > 7*1*2 > 7*1*2*3 > 7*1*2*3*4 > 7*1*2*3*4*5 > 7*1*2*3*4*5*6

    repeat:
        mul t0, t0, t1  # multiply t0 with current value of t1
        addi t1, t1, 1  # incremant t1
        bne t1, t2, repeat  # repeat until t1 is not equal to t2(7)
    
    sw t0, 0(a1)    # store the final result 
    ret 

.end
