#Program that calculates the sum of the digits in base 10 of an integer. 
#   The number is given in a variable n declared in the data initialization words 
#   in the program, the final amount will be stored in a word type variable s.



.data
n: .word 245
s: .word 0
.text
main:
lw $t0,n
#lw $t4,s
#blt $t0,$zero,sfarsit   #if n<=0 => end
addi $t1,$zero,10
add $t4,$zero,$zero     #the result

imparte:
div $t0,$t1             #n/10 and n%10
mflo $t0                #n=n/10
mfhi $t3                #digit=n%10
add $t4,$t4,$t3         #s=s+digit
bne $t0,$zero,imparte   #if n!=0

sfarsit:
sw $t4,s
li $v0,10
syscall
