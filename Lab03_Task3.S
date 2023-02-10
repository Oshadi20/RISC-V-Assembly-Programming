# Swap the content of two memory variables A and B
.data                   
    A: .word 0x1A2A3A4A
    B: .word 0x1B2B3B4B
.text
                        # Store string variables here.
.globl main             # make the main symbol globally visible. 
main:
    # Write the instructions to swap the content of A and B
    la a0, A  # load address of A to a0 register
    la a1, B  # laod address of B to a1 register

    lw t0,0(a0) # load word in a0 to t0 register
    lw t1,0(a1) # load word in a1 to t1 register

    sw t1,0(a0) # store word in t1 to a0
    sw t0,0(a1) # store word in t0 to a1
    ret
.end

