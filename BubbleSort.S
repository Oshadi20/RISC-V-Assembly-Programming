
.globl main

.equ N, 15

.data
V: .word 0,1,2,7,9,-8,4,25,7,5,-12,11,-2,11,17

.text
main:
    # TO DO : Write the code for sorting the array V with bubble sort
    # ax - address
    # tx - data
    # sx - loop iterators

    addi s1, zero, 0    # number of sorted elements
    li t2, N-1           # (number of elemnets in V)-1 for count (loop1_count)
    
    loop1_start:
        la a0, V        # load address of vector V to a0 register
        lw t0, 0(a0)    # load 1st element of V to t0 register
        sub s2, t2, s1  # loop2_count = loop1_count - number_of_sorted_elements
                        # set s2 to (N-1-s1) and run to 0

        loop2_start:
            lw t1, 4(a0)    # load next element to t1
            blt t0, t1, noswap     # if t0 < t1, jump to noswap

            # swap t0 and t1 because now t0 > t1
            sw t1, 0(a0)   
            sw t0, 4(a0)   

            noswap:
                slt t3, t0, t1
                beq t3, zero, skip
                add t0, t1, zero    # move t1 to t0
            skip:
                addi a0, a0, 4      # move a0 to next element
                addi s2, s2, -1     # reduce the loop2_count
                bne s2, zero, loop2_start   # run loop2 until s2 is 0
        
        loop2_end:
        addi s1, s1, 1      # increment the no of sorted elements
        blt s1, t2, loop1_start     # run loop1 until all elements are sorted
    loop1_end:


    ret

.end

