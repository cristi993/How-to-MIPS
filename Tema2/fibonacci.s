#Program for the calculation of the nth term of the Fibonacci sequence 
#   (t1 = 1 t2 = 1 tn = t (n-1) + t (n-2), for all n >= 3). The number n is given 
#   through a variable declared in the initialization program. In addition, the 
#   calculation of terms will use up to three other variables x, y, z 
#   declared in the program and it will not use the stack. Finally, the required value 
#   will be stored in z. All variables will be one word.


.data
 n: .word 10
 z: .space 4
.text
main:
 lw $t0,n
 blt $t0, $zero, iesire  #<0
 li $t1,3
 li $t4,1
 blt $t0,$t1,sf       #== 0 or 1
 li $t2,1             #first terms
 li $t3,1
 add $t4,$t2,$t3
 fib:
  beq $t1,$t0,sf      #i==n
  add $t2,$t3,$0      #previous previous
  add $t3,$t4,$0      #previous
  add $t4,$t2,$t3     #current
  addi $t1,$t1,1      #index
  j fib
 sf:
  sw $t4,z            #final result
  j iesire

#et1:
# li $t1,1             #memorise in z fact(0 or 1)=1
# sw $t1,z

iesire:
 li $v0, 10
 syscall
