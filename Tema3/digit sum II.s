#Recursive function that returns in $v0 sum of digits in base 10 of an word given as a parameter.
#    The ideea of recursion: s(0) = 0, else s(n) = n % 10 + s(n / 10).
#    Respect convention of MIPS.


.data
  s: .word 0
  n: .word 1234
.text
main:
  subu $sp,4
  lw $t0,n
  sw $t0,0($sp)
  li $v0,55
  jal sum
  addi $sp,$sp,4
  sw $v0,s  
 li $v0,10
 syscall
sum:
  addi $sp,$sp,-8
  sw $fp,4($sp)
  addi $fp,$sp,4
  sw $ra,-4($fp)
  lw $t0,4($fp)
  add $t4,$v0,$0
  beqz $t0,sfarsit
   addi $t1,$0,10
   div $t0,$t1
   mfhi $t2
   mflo $t0
   add $t3,$t3,$t2
   addi $sp,$sp,-4
   sw $t0,-8($fp)
   sw $ra,-4($fp)
   jal sum
   lw $fp,4($sp)
   lw $ra,-4($fp)
   addi $sp,$sp,4
   jr $ra
  sfarsit:
   lw $ra,-4($fp)
   lw $fp,4($sp)
   add $v0,$t3,$0
   bne $v0,$t4,et
   add $v0,$0,$0
   et:
   jr $ra
