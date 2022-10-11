.data
	Num1:	.asciiz "\nInforme um número inteiro: "
	Num2:	.asciiz "Informe outro número inteiro: "
	Soma:	.asciiz "Resultado da soma: "
	Mult:	.asciiz "\nResultado da multiplicação: "
	Neg:	.asciiz "Finalizando o programa.\n"
.text
.globl Main
Main: 
	li $v0, 4
	la $a0, Num1
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	blt $t1, 0, Sair
	
	li $v0, 4
	la $a0, Num2
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	
	blt $t2, 0, Sair
	
	add $t3, $t2, $t1
	
	li $v0, 4
	la $a0, Soma
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	mul $t3, $t2, $t1
	
	li $v0, 4
	la $a0, Mult
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	j Main

Sair: 
	li $v0, 4
	la $a0, Neg
	syscall
	li $v0, 10
	syscall