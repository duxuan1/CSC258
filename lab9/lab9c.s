.data 
promptN: .asciiz "Enter an int N: "
promptInt: .asciiz "Enter an int: "
result: .asciiz "Product is: "
newline: .asciiz "\n"

.globl main
.text

main: 
    	# prompt N
	li $v0, 4		      
	la $a0, promptN
	syscall    

	li $v0, 5
	syscall 
	move $t0, $v0
	
	# product
	li $t3, 1
	# call prompt N times
	LOOPINIT:
	li $t1, 1
	WHILE:
		bgt $t1, $t0, DONE
		# prompt N
		li $v0, 4		      
		la $a0, promptInt
		syscall   
		
		li $v0, 5
		syscall 
		move $t2, $v0
		
		# mult
		mult $t3, $t2
		mflo $t4
		move $t3, $t4
		# i++
		addi $t1, $t1, 1
		j WHILE
	DONE:
	
	# print product
	li $v0, 4
	la $a0, result
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
	
	