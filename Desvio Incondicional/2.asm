.data 
	Num: .asciiz "\nDigite a idade: "
	Mai: .asciiz "Maior de idade.\n" 
	Men: .asciiz "Menor de idade.\n"
	Zer: .asciiz "Finalizando o programa.\n"
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
	bgt $t0, 17, Maior
	blt $t0, 18, Menor
	j Principal
	
Maior:
	li $v0, 4
	la $a0, Mai
	syscall
	j Principal
	
Menor: 
	li $v0, 4
	la $a0, Men
	syscall
	j Principal
	
Sair: 
	li $v0, 4
	la $a0, Zer
	syscall
	li $v0, 10
	syscall