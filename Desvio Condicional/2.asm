.data
        num: 	.asciiz "Informe um numero: "								
        par: 	.asciiz " É Par."
        impar: 	.asciiz " É Impar."
.text

.globl Principal
Principal:
    	li  $v0, 4           			 
   	la  $a0, num        		
    	syscall             			

    	li  $v0, 5           			
   	syscall             			
   	move $s0, $v0     				

   	jal Par			
   	li $v0, 10	
    	syscall 			

Par:
	li $t2, 2 			
	div $s0, $t2 				
	mfhi $t1 				
		
	bne $t1, 0, Impar 			
	
	li $v0, 1
	move $a0, $s0				
	syscall 				
		
	li $v0, 4
	la $a0, par	
	syscall 				
	
	jr $ra 					
	
Impar:
	li $v0, 1
	move $a0, $s0				
	syscall 					
	
	li $v0, 4
	la $a0, impar	
	syscall 					
	
	jr $ra 				