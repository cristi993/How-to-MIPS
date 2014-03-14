#Same thing as signum.s but returns the value using the stack.


.data
x: .word -11
s: .byte 0
.text

sign:
sub $sp,4
sw $fp,0($sp)
addi $fp,$sp,4
lw $t1,0($fp)
bnez $t1,et3      #if not zero
add $t2,$0,$0
j et
et3:
bltz $t1,et2      #if > 0
addi $t2,$0,1
j et
et2:
addi $t2,$0,-1    #is < 0
et:
sw $t2,0($fp)
lw $fp,0($sp)
addi $sp,$sp,4
jr $ra

main:
lw $t1,x
sub $sp,4
sw $t1,0($sp)
jal sign
lw $t2,0($sp)
sb $t2,s
addi $sp,$sp,4
li $v0,10
syscall
