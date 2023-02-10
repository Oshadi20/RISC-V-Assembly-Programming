# a recursive function to calculate the factorial of a number 
# and store it in the memory variable
.globl main

.bss
val: .space 4

.text  
fact:       #  n in a0,  n! in a1
    addi  sp, sp, -8    # space is reserved in the stack for storing the preserved registers
    sw ra, 0(sp)    # save the return address in the stack
    
    li t0, 2
    blt a0, t0, fact_zero_and_one # 0! = 1, 1! = 1
    sw a0, 4(sp)    # store n in stack
    addi a0, a0, -1 # decrement n by 1
    jal fact        #  fact function is invoked for fact(n-1)
                   
    lw t0, 4(sp)    # register that was saved in the stack during prologue, is now restored 
    mul a1, t0, a1  # a1 <- n * fact(n-1)
    j finish

fact_zero_and_one:
    li a1, 1    # return 1 as the factorial
finish:
    lw ra, 0(sp)    # register that was saved in the stack at the prologue is now restored
    addi sp, sp, 8  # stack pointer is also restored to its initial position
    ret          

main:
add sp,sp,-16   # space is reserved in the stack 
sw ra,0(sp)
la a2,val   # final answer is placed in register a2
li a0,6
jal fact    # fact function is invoked
sw a1,0(a2) # answer store in a2 register
lw ra,0(sp) # register that was saved in the stack at the prologue is now restored
add sp,sp,16    # stack pointer is also restored to its initial position
ret
.end
