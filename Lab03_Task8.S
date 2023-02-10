 

# Calculate the first 12 numbers of Fibonacci sequence and store it in an array

.equ N, 12

.data       
    V:.word 0, 1
    # store fib(0) = 0(V[0]) and fib(1) = 1(V[1]) in vector
.text
            
.globl main
main:
    la a0, V    # laod the address of vector V to a0 register

    addi t0,zero,N      # store the value to be calculated the finonacci
    addi t1,zero,1      # t1 is an iterator
    addi a1,a0,8        # a1 points to the current array index

    repeat:
        addi t1,t1,1    # increment the iterator
        lw t2, -4(a1)   # t2 refers to V[i-1] 
        lw t3, -8(a1)   # t3 refers to V[i-2]

        add t2, t2, t3  # sum up the values in t2 and t3 registers
                        # store the result in t2 register
        sw t2,0(a1)     # store the calculated value in the current position

        addi a1, a1, 4  # move a1 to the next position

        bne t0, t1, repeat  # repeat while t0 and t1 are not equal

    ret
.end
 
