.data
x: .word 12
y: .word 32
z: .word 11
max: .space 4
.text
main:
lw $t0,x
lw $t1,y
lw $t2,z
bgt $t0,$t1,xmy
bgt $t1,$t2,ymz
sw $t2,max
j sfarsit
ymz:
sw $t1,max
j sfarsit
xmy:
bgt $t0,$t2,xmz
sw $t2,max
j sfarsit
xmz:
sw $t0,max
sfarsit:
li $v0,10
syscall