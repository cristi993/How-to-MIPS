#Program that computes the factorial of a natural number. The number is 
#   given a variable n declared in the data words initialization in the program; 
#   factorial would be finally stored in a s variable of type word.



.data
n: .word 1
s: .word 0
.text
main: 
lw $t0,n
addi $t2,$zero,1       #initialise t2 with 1 (t1 is the final result)
blt $t0,$zero,sfarsit  #if n<0
addi $t1,$zero,1       #initialise t1 with 1 (multiplier)

loop:
mul $t2,$t2,$t1        #multiply
addi $t1,$t1,1         #next number to multiply
ble $t1,$t0,loop

sfarsit:
sw $t2,s
li $v0,10
syscall
