.data
 suma: .word 0
 v: .word 1,2,3,4,5
 i: .word 0
.text
main:
 lw $t0,suma
 lw $t1,v
 lw $t2,i
 beq $t1,$zero,sfarsit
intrare:
 add $t0,$t0,$t1
 addi $t2,$t2,4
 lw $t1,v($t2)
 beq $t1,$zero,sfarsit   # if v[i]==0 then exit
j intrare
sfarsit:
sw $t0,suma
li $v0,10
syscall
