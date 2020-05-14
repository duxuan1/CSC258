.data 
promptA: .asciiz "Enter an int A: "
resultEven: .asciiz "A is even"
resultOdd: .asciiz "A is odd"
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
	
	# divide A by 2, and t2 = A % 2
	li $t1, 2
	div $t0, $t1
	mfhi $t2
	
	# if t2 = 0, A is even, go to label else
	beq $t2, $zero, else
	# A is odd
	li $v0, 4
	la $a0, resultOdd
	syscall  
	j end
	
	# A is Even
	else:
	li $v0, 4
	la $a0, resultEven
	syscall  

    	end:
	# exit
	li $v0, 10
	syscall