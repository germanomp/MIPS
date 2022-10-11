.macro inicio
.data
	num:	.asciiz "Informe o saldo inicial: "
.text
	li $v0, 4
	la $a0, num
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
.end_macro

.macro outra
.data
	outra: 	.asciiz "\nDeseja fazer outra operação(1 Sim, 0 Não)? "
.text
	li $v0, 4
	la $a0, outra
	syscall
	
	li $v0, 5
	syscall
	
	move $t8, $v0
	
	beq $t8, 1, Main
	beq $t8, 0, Sair
.end_macro

.data
	op: 	.asciiz "O que deseja fazer(1 Saldo, 2 Depósito, 3 Saque)? "
	val:	.asciiz "\nInforme o valor: "
	sal:	.asciiz "\nSeu saldo é: "
	exit:	.asciiz "Finalizando o programa.\n"
.text
.globl Main
Inicio:
	inicio
Main:	
	li $v0, 4
	la $a0, op
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	beq $t0, 1, Saldo
	beq $t0, 2, Deposito
	beq $t0, 3, Saque
	
	j Main

Saldo:
	li $v0, 4
	la $a0, sal
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	outra
	
	j Main
	
Deposito: 
	li $v0, 4
	la $a0, val
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	
	add $t1, $t2, $t1
	
	outra
	
	j Main
	
Saque:
	li $v0, 4
	la $a0, val
	syscall
	
	li $v0, 5
	syscall
	
	move $t3, $v0
	
	sub $t1, $t1, $t3
	
	outra
	
	j Main
Sair: 
	li $v0, 4
	la $a0, exit
	syscall
	li $v0, 10
	syscall