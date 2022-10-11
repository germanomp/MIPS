.macro dobro
.data

.text
	li $t0, 2
	mul $t2, $t1, $t0
.end_macro 

.data
	dob:	.asciiz "Dobro: "
	num:	.asciiz "Informe um número inteiro: "	
.text
.globl Main
Main:
	li $v0, 4
	la $a0, num
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	dobro
		
	li $v0, 4
	la $a0, dob
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall