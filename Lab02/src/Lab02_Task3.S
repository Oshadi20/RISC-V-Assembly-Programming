/*
.globl main 

main:
 
    # Write a sequence of instructions to detect overflow/underflow on signed variables 

    li t1, 0x7FFFFFFF   # These are called Pseudo instructions.
                        # li just allow us to write a single instruction to set 
                        #    32bit large number to a register. How? we will talk later. 
    li t2, 0x7FFFFFFF
    

    add t0, t1, t2        # This is the instruction we want to check for overflow/underflow.
    # Write your instruction sequence to detect overflow/underflow here.

    # Your code here 
    slt t4, t1, zero    # whether t1<0, stored in t4
    slt t5, t2, zero    # whether t2<0, stored in t5
    slt t6, t0, zero    # whether t0<0, stroed in t6
    and t4, t4, t5      # t4 AND t5, stroed in t4
    xor t3, t4, t6      # t4 XOR t6, stored
    # If there is an overflow, the t3 value should be 1
    ret
.end
*/
