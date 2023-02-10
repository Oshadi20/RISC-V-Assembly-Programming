# an assembly function that takes three integers as arguments and return the sum
.globl main

.data
A: .word 1
B: .word 2
C: .word 3

.bss
val: .space 4

.text
sum:
 add sp,sp,-32 # space is reserved in the stack for storing the preserved registers
 
 # saved registers are stored in the stack, one by one
 sw s1, 0(sp)
 sw s2, 4(sp) 
 sw s3, 8(sp)
 sw ra, 12(sp)
 
 # input parameters(a0, a1, a2) are moved into preserved registers(s1, s2, s3)
 # so that they can be used after the execution of function
 mv s1,a0
 mv s2,a1
 mv s3,a2

 # use temporary registers
 lw t1,0(s1)
 lw t2,0(s2)
 lw t3,0(s3) 
 # sum up the integers
 add t1,t1,t2
 add t1,t1,t3
 # prepare the return value before returning to the caller
 mv a0,t1

 # registers that were saved in the stack during prologue, are now restored 
 lw s1, 0(sp)
 lw s2, 4(sp)
 lw s3, 8(sp)
 lw ra, 12(sp)
 # stack pointer is also restored to its initial position
 add sp, sp, 32
 ret
 
main:
add sp,sp,-16   # space is reserved in the stack 
sw ra,0(sp)
# 3 input parameters for sum function are placed in registers a0, a1, a2
la a0,A 
la a1,B
la a2,C
# final answer is placed in register a3
la a3,val

jal ra,sum  # sum function is invoked

lw ra,0(sp) # register that was saved in the stack at the prologue is now restored
add sp,sp,16 # stack pointer is also restored to its initial position
sw a0,(a3) # result store in a3 register
ret
.end
