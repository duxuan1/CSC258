.data 
promptA: .asciiz "Enter an int A: "
promptB: .asciiz "Enter an int B: "
resultAdd: .asciiz "A + 42 = "
resultSub: .asciiz "B - A = "
newline: .asciiz "\n"


.globl main
.text

main: 
    # prompt A
	li $v0, 4		      
	la $a0, promptA
	syscall    

	li $v0, 5
	syscall 
	move $t0, $v0

    # prompt B
	li $v0, 4
	la $a0, promptB
	syscall

	li $v0, 5
	syscall 
	move $t1, $v0

    # add and sub operation
	add $t2, $t0, 42
	sub $t3, $t1, $t0

    # print add result
	li $v0, 4
	la $a0, resultAdd
	syscall

	li $v0, 1
	move $a0, $t2	
	syscall 

	li $v0, 4
	la $a0, newline
	syscall 

    # print sub result
	li $v0, 4
	la $a0, resultSub
	syscall

	move $a0, $t3	
	li $v0, 1
	syscall 

	li $v0, 4
	la $a0, newline
	syscall 

    # exit
	li $v0, 10
	syscall