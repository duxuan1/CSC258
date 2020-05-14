# func1.s
.data
before: .asciiz "Before function\n"
resAdd: .asciiz "A + B is: "
resSub: .asciiz "A - B is: "
newline: .asciiz "\n"

.text
main:
	li $t0, 5	# hard coded value for A
	li $t1, 3	# hard coded value for B

	li $v0, 4 	# system call code for print_string
	la $a0, before 	# address of string to print
	syscall 	# print the string

	li $v0, 4 	# system call code for print_string
	la $a0, resAdd 	# address of string to print
	syscall 	# print the string

	# TODO: setup the arguments for function call doAdd
	addi $sp, $sp, -8
	sw $t0, 0($sp)	
	sw $t1, 4($sp)				
	jal doAdd 	# Make a function call to doAdd()
	#TODO: what exactly does jal do? Lookup the reference sheet
	move $a0, $v0	
	li $v0, 1
	syscall 
	# TODO: print the return value of doAdd

	
	li $v0, 4 	# system call code for print_string
	la $a0, newline # address of string to print
	syscall 	# print the string	

	li $v0, 4 	# system call code for print_string
	la $a0, resSub 	# address of string to print
	syscall 	# print the string

	# TODO: setup the arguments for function call doSub
	addi $sp, $sp, -8
	sw $t0, 0($sp)	
	sw $t1, 4($sp)	
	jal doSub 	# Make a function call to doSub()
	# TODO: print the return value of doSub
	move $a0, $v0	
	li $v0, 1
	syscall 
	
	li $v0, 4 	# system call code for print_string
	la $a0, newline # address of string to print
	syscall 	# print the string	
									
	# End of main, make a syscall to "exit"
	li $v0, 10 	# system call code for exit
	syscall 	# terminate program	
	
# start of function doAdd()
doAdd:
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	add $v0, $a0, $a1
	# TODO: what need to be done here?
	jr $ra
# start of function doSub()
doSub:
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	sub $v0, $a0, $a1
	# TODO: what need to be done here?
	jr $ra
