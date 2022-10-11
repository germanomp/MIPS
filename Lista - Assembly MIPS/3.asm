.data
	num1:	.asciiz "\nInforme um número inteiro: "
	num2:	.asciiz "Informe outro número inteiro: "
	op: 	.asciiz "Informe a operação(1 Soma, 2 Subtração, 3 Multiplicação, 4 Divisão): "
	outra: 	.asciiz "\nDeseja fazer outra operação(1 Sim, 0 Não)? "
	som:	.asciiz "Resultado da soma: "
	subt: 	.asciiz "Resultado da subtração: "
	multi:	.asciiz "Resultado da multiplicação: "
	divi: 	.asciiz "Resultado da divisão: "
	exit:	.asciiz "Finalizando o programa.\n"
.text
.globl Main
Main: 
	li $v0, 4
	la $a0, num1
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	blt $t1, 0, exit
	
	li $v0, 4
	la $a0, num2
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	
	blt $t2, 0, exit
	
	li $v0, 4
	la $a0, op
	syscall
	
	li $v0, 5
	syscall
	
	move $t3, $v0
	
	beq $t3, 1, Soma
	beq $t3, 2, Subtração
	beq $t3, 3, Multiplicação
	beq $t3, 4, Divisão

	j Main
Soma:
	add $t4, $t2, $t1
	
	li $v0, 4
	la $a0, som
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 4
	la $a0, outra
	syscall
	
	li $v0, 5
	syscall
	
	move $t8, $v0
	
	beq $t8, 1, Main
	beq $t8, 0, Sair
	
	j Main
	
Subtração:
	sub $t5, $t2, $t1
	
	li $v0, 4
	la $a0, subt
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	
	li $v0, 4
	la $a0, outra
	syscall
	
	li $v0, 5
	syscall
	
	move $t8, $v0
	
	beq $t8, 1, Main
	beq $t8, 0, Sair
	
	j Main
	
Multiplicação:
	mul $t6, $t2, $t1
	
	li $v0, 4
	la $a0, multi
	syscall
	
	li $v0, 1
	move $a0, $t6
	syscall
	
	li $v0, 4
	la $a0, outra
	syscall
	
	li $v0, 5
	syscall
	
	move $t8, $v0
	
	beq $t8, 1, Main
	beq $t8, 0, Sair
	
	j Main
	
Divisão:
	div $t7, $t2, $t1
	
	li $v0, 4
	la $a0, divi
	syscall
	
	li $v0, 1
	move $a0, $t7
	syscall
	
	li $v0, 4
	la $a0, outra
	syscall
	
	li $v0, 5
	syscall
	
	move $t8, $v0
	
	beq $t8, 1, Main
	beq $t8, 0, Sair
	
	j Main
	
Sair: 
	li $v0, 4
	la $a0, exit
	syscall
	li $v0, 10
	syscall