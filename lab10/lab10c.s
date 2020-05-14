.data 
prompt: .asciiz "Enter an number: "
result: .asciiz "The result is: "
newline: .asciiz "\n"
two:	.word 2

.text
main:
	li $v0, 4		      
	la $a0, prompt		# prompt 
	syscall    

	li $v0, 5
	syscall 		
	move $t0, $v0 		# t0 is the number
	
	lw $t9, two
	
	addi $sp, $sp, -4 	# put argument in stack
	sw $t0, 0($sp)
	
	jal mystery 		# function call
	
	lw $t4, 0($sp)		# get return value
	addi $sp, $sp, 4
	
	li $v0, 4 	# system call code for print_string
	la $a0, result  # address of string to print
	syscall 	# print the string
	
	move $a0, $t4
	li $v0, 1
	syscall 
	
	li $v0, 4 	# system call code for print_string
	la $a0, newline # address of string to print
	syscall 	# print the string	
									
	# End of main, make a syscall to "exit"
	li $v0, 10 	# system call code for exit
	syscall 	# terminate program	
	
mystery:
	lw $t0, 0($sp)		# get argument
	addi $sp, $sp, 4
	bne $t0, $zero, notbase
base:
	addi $t0, $zero, 0
	addi $sp, $sp, -4 	# put return value in stack
	sw $t0, 0($sp)	
	jr $ra
notbase:
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $t1, $t0, -1
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	jal mystery
	lw $t2, 0($sp)		
	addi $sp, $sp, 4
	lw $ra, 0($sp)		
	addi $sp, $sp, 4
	lw $t0, 0($sp)		
	addi $sp, $sp, 4 
	mult $t0, $t9       # 2n
	mflo $t3            
	addi $t3, $t3, -1   # 2n - 1
	add $t4, $t2, $t3   # mystery(n-1) + 2n - 1
	
	addi $sp, $sp, -4
	sw $t4, 0($sp)
	jr $ra