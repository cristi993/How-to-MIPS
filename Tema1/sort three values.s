#Program wich orders three numbers x, y, z simulating the method of selection sort using two by two registers (compares / swap (x, y), (x, z), (y, z)). Use as few instructions possible - eg. When loading a value in a reg. use it a much.

.data
x: .word 9
y: .word 11
z: .word 20
.text
main:
lw $t0,x
lw $t1,y
lw $t2,z
bgt $t0,$t1,xmy
et2:
bgt $t0,$t2,xmz
j et1
j sfarsit
xmz:
move $t3,$t0
move $t0,$t2
move $t2,$t3
et1:
bgt $t1,$t2,ymz
j sfarsit
xmy:
move $t3,$t1
move $t1,$t0
move $t0,$t3
j et2
ymz:
move $t3,$t2
move $t2,$t1
move $t1,$t3
sfarsit:
li $v0,10
syscall
