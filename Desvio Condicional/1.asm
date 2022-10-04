.data 
	Num: .asciiz "\nDigite a idade: "
	Mai: .asciiz "Maior de idade.\n" 
	Men: .asciiz "Menor de idade.\n"
.text
.globl Principal
Principal:
	li $v0, 4
	la $a0, Num
	syscall	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	bgt $t0, 17, Maior
	blt $t0, 18, Menor
	
Maior:
	li $v0, 4
	la $a0, Mai
	syscall
	
	li $v0, 10
	syscall
	
Menor: 
	li $v0, 4
	la $a0, Men
	syscall
	
	li $v0, 10
	syscall