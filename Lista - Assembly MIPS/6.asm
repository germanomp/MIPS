.macro soma
.data

.text
	add $t0, $t1, $t2
.end_macro 

.data
	res:	.asciiz "Resultado: "
	num1:	.asciiz "Entre com o valor 1: "	
	num2: 	.asciiz "Entre com o valor 2: "
.text
.globl Main
Main:
	li $v0, 4
	la $a0, num1
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	li $v0, 4
	la $a0, num2
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	soma
	
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 10
	syscall