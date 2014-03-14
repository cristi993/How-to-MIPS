#MIPS function that implements the C function "strlen" (with return in $v0) 
#
#        size_t strlen (const char * s);
#
#    which returns the length of the string pointed to by "s", not counting 
#    null terminator (we consider "s" a common address and return value 
#    an int/word).


.data
x: .word 1
s: .asciiz "qwerty"

.text
main:
 la $t1,s      #array
 subu $sp,4
 sw $t1,0($sp)
 jal Strlen
 add $sp,4
 sw $v0,x
 li $v0,10
 syscall
Strlen:
 subu $sp,4
 sw $fp,0($sp)
 addiu $fp,$sp,0   #fp points to sp
 lw $t2,4($fp)     #array adress
 #li $v0,0
 #li $t0,0
 loop:
  lb $t1, 0($t2)   #read character
  beqz $t1,exit    #if NULL -> exit
  addi $t2,$t2,1   #go to next adress
  #addi $v0,$v0,1  #count characters
  j loop
  exit:
   lw $t3,4($fp)
   sub $v0,$t2,$t3
   lw $fp,0($fp)
   addu $sp,4
   jr $ra
