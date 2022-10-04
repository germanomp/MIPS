.data 
	Num: .asciiz "\nDigite um número inteiro: "
	Pos: .asciiz "Número positivo.\n" 
	Neg: .asciiz "Número negativo.\n"
	Zer: .asciiz "Número é zero.\n"
.text
.globl Principal
Principal:
	li $v0, 4
	la $a0, Num
	syscall	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	beq $t0, 0, Sair
	bgt $t0, 0, Positivo
	blt $t0, 0, Negativo
	j Principal
	
Positivo:
	li $v0, 4
	la $a0, Pos
	syscall
	j Principal
	
Negativo: 
	li $v0, 4
	la $a0, Neg
	syscall
	j Principal
	
Sair: 
	li $v0, 4
	la $a0, Zer
	syscall
	li $v0, 10
	syscall