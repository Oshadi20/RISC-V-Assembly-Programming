/*
.globl main 

main:
 
    # Write a sequence of instructions to detect overflow on unsigned variables 

    addi t1, zero, 0xFFFFFFFF           # How is this possible without error?
    addi t2, zero, 0xFFFFFFFF
    
    
    # Test case 1
    addi t1, zero, 0x7FF     # 2^12 -1   = 4096-1   = 4095
    addi t2, zero, 0x1       # Not overflow, unsigned, and has all the space
    

    /*
    # Test case 2
    addi t1, zero, 0x7FF     # 2^11 -1   = 2048-1   = 2047
    slli t1, t1, 20
    add t2,  t1, zero       # copy value Not an overflow
    */
                            # addi t1, zero, 2048 This gives error 0xFFF = 2^12-1   = 4095 
                            # addi will perform binary addition
    
    /*
    # Test case 3
    addi t1, zero, 2047      
    slli t1, t1, 21         # MSB will be 1 , so ready to overflow
    add t2, t1, zero        # Copy value
                             # This should generate an overflow when t1 + t2
    */

    /*
    # Test case 4
    addi t1, zero, 1 
    slli t1, t1, 31
    add t2, zero, t1        # Copy, This should overflow
    */

    # add t0, t1, t2        # This is the instruction we want to check for overflow.
    # Write your instruction sequence to detect overflow here.
    /*
    sltu t4,t0,t1
    sltu t5,t0,t2
    or t3,t4,t5
    
    # Your code here

    
    # If there is an overflow, the t3 value should be 1
    ret
.end

*/