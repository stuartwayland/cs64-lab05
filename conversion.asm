# conversion.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
	li $v0, 0
	li $t0, 0
    	li $t1, 5
	li $t2, 2
	li $t5, 3
	li $t6, 1
loop:
	beq $t0, $t1, finish
	mult $a0, $t2
	mflo $t3
	sub $t4, $t3, $a1
	add $v0, $v0, $t4
	
	blt $a0, $t5, skipy
	sub $a1, $a1, $t6
	
skipy:
	addi $a0, $a0, 1
	addi $t0, $t0, 1
	j loop	
finish:
    jr $ra

main:

	li $a0, 5
	li $a1, 7
	jal conv
	move $a0, $v0

	li $v0,1
	syscall

exit:
	li $v0, 10
	syscall

