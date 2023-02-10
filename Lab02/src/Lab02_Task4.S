/*
.global main
main:
    addi t1, zero, -75  # store -75 to register t1(input)
    srai t2, t1, 0x1f   # right shift the value stored in t1 by 31
                        # store the result in register t2
    xor t3, t2, t1      # xor the values of t2 and t1 registers
                        # store the result in t3
    sub t0, t3, t2      # subtract the values of t3 and t2 registers
                        # store the result in t0




.end
*/