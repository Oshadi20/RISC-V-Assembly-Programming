// RISC-V assembly program that shows a block of four lit LEDs 
// that repeatedly moves from one side of the 16 LEDs available on the board 
// to the other. Also include two switches that control the speed 
// and direction.
#define GPIO_SWs 0x80001400
#define GPIO_LEDs 0x80001404
#define GPIO_INOUT 0x80001408
#define SLOW_DELAY 0x1000000
#define FAST_DELAY 0x1000

.global main
main:
	# 0000 0000 0000 0000 0000 0000 0000 0000
	# switches 31:16
	# LEDs 15:0
	
	# set up I/O configuration
	li t2, 0x0000ffff	# enable all 16 LEDs
	li t3, GPIO_INOUT
	sw t2, 0(t3)

	li a2, 0xf000	# a0 stores the left most 4 LEDs
	li a3, FAST_DELAY	# a1 stores delay
	j turn_on_led

turn_on_led:
	// set LEDs on
	li t4, GPIO_LEDs
	sw a2, 0(t4)
	j delay

delay:
	add t5, zero, a3
	count:
		addi t5, t5, -1
		bne t5, zero, count
		j get_input

get_input:
	li t3, GPIO_SWs
	lw t2, 0(t3)	
	srl t2, t2, 16	# shift right by 16 to get switches to the right most

check_s0:
	# changes the speed (slow, fast)
	andi s2, t2, 1	# Check whether switch[0] is on or off. 
					# If switch[0] is off s0 is 0. Therefore move slowly
	beq s2, zero, slow
	li a3, FAST_DELAY # otherwise moves fast
	j check_s1

slow:
	li a3, SLOW_DELAY
	j check_s1

check_s1:
	# changes the direction (left to right, right to left)
	andi s3, t3, 2	# Check whether switch[1] is on or off. 	
					# If switch[1] is off s1 is 0. Therefore move from left to right
	beq s3, zero, left_to_right	# move from left to right
	j right_to_left	# otherwise move from right to left

left_to_right:
	# shift right by 1 and at right edge start again from left edge
	addi t6, zero, 0xf	# right most LED set
	bne a3, t6, move_to_right	# not reached the right most LED set
							# therefore still we can move to right
	# otherwise start again from left
	li a3, 0xf000 # set a0 to left most edge
	j turn_on_led

move_to_right:
	srl a2, a2, 1	# shift right by 1
	j turn_on_led

right_to_left:
	# shift left by 1 and at left edge start again from right 
	li t6, 0xf000	# left most LED set
	bne a2, t6, move_to_left	# not reached the left most LED set
							# therefore still we can move to left
	# otherwise start again from right
	li a2, 0xf
	j turn_on_led

move_to_left:
	sll a2, a2, 1	# shift left by 1
	j turn_on_led
