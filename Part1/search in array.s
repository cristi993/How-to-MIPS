#Program seeking a number x in an array of numbers and put in y value 1 or 0 as x appears/does not appear in the array.

.data
 y: .word 0
 v: .word 1,2,3,4,7
 n: .word 5
 i: .word 0
 k: .word 0
 x: .word 5
.text
main:
 lw $t4,y
 lw $t0,x
 lw $t3,n
beq $t3,$zero,sfarsit
 lw $t1,v
 lw $t2,i
 lw $t5,k
intrare:
 beq $t0,$t1,gasit
 addi $t5,$t5,1
 bgt $t5,$t3,sfarsit
 lw $t1,v($t2) 
 addi $t2,$t2,4
 j intrare
gasit:
 addi $t4,$zero,1
 sw $t4,y
sfarsit:
li $v0,10
syscall
