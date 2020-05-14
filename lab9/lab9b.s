.data 
# TODO: What are the following 5 lines doing?
prompt: .asciiz "Enter an int : "
resultOdd: .asciiz "THIS IS ODD"
resultEven: .asciiz "THIS IS EVEN"
tooMany: .asciiz "TOO MANY TIMES"
newline: .asciiz "\n"
N: .word 5

.globl main
.text

main: 
    # TODO: Set a breakpoint here and step through. 
    # What does this block of 3 lines do?
	
	LOOPINIT:
		lw $t4, N
		li $t3, 0
	
	WHILE:
		li $v0, 4		      
		la $a0, prompt
		syscall	
	
		li $v0, 5
		syscall 
		move $t0, $v0
	
		li $t2, 2
		div $t0, $t2
		mfhi $t1
		
		addi $t3, $t3, 1
		
		beq $t1, $zero, END
		beq $t4, $t3, ELSE
		
		li $v0, 4
		la $a0, resultOdd
		syscall
		
		li $v0, 4
		la $a0, newline
		syscall
		
		j WHILE
	
	ELSE:
		li $v0, 4
		la $a0, tooMany
		syscall
		
		li $v0, 4
		la $a0, newline
		syscall
		
		j DONE
	
	END:
		li $v0, 4
		la $a0, resultEven
		syscall
		
		li $v0, 4
		la $a0, newline
		syscall 

	DONE: 
	
