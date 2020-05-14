.data 
promptA: .asciiz "Enter an int A: "
promptB: .asciiz "Enter an int B: "
promptC: .asciiz "Enter an int C: "
resultAdd: .asciiz "A + B + C = "
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

    # prompt C
	li $v0, 4
	la $a0, promptC
	syscall

	li $v0, 5
	syscall 
	move $t2, $v0

    # add operation
	add $t3, $t0, $t1
	add $t4, $t2, $t3

    # print result
	li $v0, 4
	la $a0, resultAdd
	syscall

	li $v0, 1
	move $a0, $t4	
	syscall 

	li $v0, 4
	la $a0, newline
	syscall 

    # exit
	li $v0, 10
	syscall
