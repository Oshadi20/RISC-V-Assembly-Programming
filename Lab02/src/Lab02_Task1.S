/*
.globl main 

main:
 
    # Using only register and immediate type instructions,
    # Insert the value 0xF0F0F0F0 into t0 (x5 register) 

    # Note all the registers in RV32I processors are 32 bit.

    # addi t0, zero, 0xF0F0F0F0
    # addi t0, zero, 0xFFF
    # addi t0, zero, 0x7FF
    addi t0, zero, 0xf0
    slli t0, t0, 0x8
    addi t0, t0, 0xf0
    slli t0, t0, 0x8
    addi t0, t0, 0xf0
    slli t0, t0, 0x8
    addi t0, t0, 0xf0

    
    # Your code here
    
    ret
.end
 
*/