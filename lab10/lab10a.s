.data
array1: .word 5, 8, 3, 4, 7, 2
len:	.word 24
result: .asciiz "Product is: "
newline: .asciiz "\n"

.globl main
.text
main: 	
	add $t0, $zero, $zero	# i
	add $t1, $zero, 1	# product
	lw $t2, len		# len of array1
	la $t3, array1		# address of array
	loop:
		add $t4, $t0, $t3	# t4 = addr(array1) + i
		lw $s1, 0($t4)		# s1 = array1[i] 
		mult $t1, $s1		# mult
		mflo $t5		# result of mult
		move $t1, $t5		# store result to product
		addi $t0, $t0, 4	# i++
		bne $t0, $t2, loop
	end:
	# print product
	li $v0, 4
	la $a0, result
	syscall  
	
	move $a0, $t1
	li $v0, 1
	syscall 

	li $v0, 4
	la $a0, newline
	syscall
	
	# exit
	li $v0, 10
	syscall