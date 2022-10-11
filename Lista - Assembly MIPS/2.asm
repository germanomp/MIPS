.data
	Ano:	.asciiz "Informe o ano atual: "
	Nasc:	.asciiz "Ano de nascimento: "
	Idade:  .asciiz "Sua idade é: "
	Fut: 	.asciiz "\nEm 2035 terá: "
.text
	li $v0, 4
	la $a0, Nasc
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $v0, 4
	la $a0, Ano
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	sub $t2, $t1, $t0
	
	li $v0, 4
	la $a0, Idade
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $t3, 2035
	
	sub $t4, $t3, $t0
	
	li $v0, 4
	la $a0, Fut
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall