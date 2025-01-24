.text

main:
#addi $s1,$zero,0  #y
#addi $s3,$zero,1  #h
#addi $s2,$zero,2  #n
lw $t0,0($a1)
lw $t1,4($a1)
lw $t2,8($a1)
lb $s1,0($t0)
lb $s3,0($t1)
lb $s2,0($t2)
addi $s1,$s1,-48
addi $s3,$s3,-48
addi $s2,$s2,-48

add $s0,$zero,$zero
add $s7,$zero,$zero

euler_fn:
slt $at,$s7,$s2
beq $at,$zero,exit
add $a0,$s0,$zero
add $a1,$s1,$zero
jal derivative
add $s6,$v0,$zero
#mul $s5,$s3,$s6
add $a0,$s3,$zero
add $a1,$s6,$zero
jal multipy
add $s5,$v0,$zero

add $s5,$s5,$s1
add $s1,$s5,$zero
add $s0,$s0,$s3
addi $s7,$s7,1
j euler_fn
exit:
j end

derivative:
addi $sp, $sp, -4
sw $ra,0($sp)
add $t8,$a0,$zero
add $t9,$a1,$zero
#mul $t0,$a0,$a0
add $a1,$t8,$zero
jal multipy
add $t0,$v0,$zero

#mul $t0,$t0,$a0
add $a0,$t8,$zero
add $a1,$t0,$zero
jal multipy
add $t0,$v0,$zero

#mul $t0,$t0,-283
addi $a0,$zero,-283
add $a1,$t0,$zero
jal multipy
add $t0,$v0,$zero

#mul $t1,$a0,$a0
add $a0,$t8,$zero
add $a1,$t8,$zero
jal multipy
add $t1,$v0,$zero

#mul $t1,$t1,22
addi $a0,$zero,22
add $a1,$t1,$zero
jal multipy
add $t1,$v0,$zero

#mul $t2,$a0,12
addi $a0,$zero,12
add $a1,$t8,$zero
jal multipy
add $t2,$v0,$zero

#mul $t3,$a1,$a1
add $a0,$t9,$zero
add $a1,$t9,$zero
jal multipy
add $t3,$v0,$zero

#mul $t3,$t3,$a1
add $a0,$t9,$zero
add $a1,$t3,$zero
jal multipy
add $t3,$v0,$zero

#mul $t3,$t3,279
addi $a0,$zero,279
add $a1,$t3,$zero
jal multipy
add $t3,$v0,$zero

#mul $t4,$a1,$a1
add $a0,$t9,$zero
add $a1,$t9,$zero
jal multipy
add $t4,$v0,$zero

#mul $t4,$t4,20
addi $a0,$zero,20
add $a1,$t4,$zero
jal multipy
add $t4,$v0,$zero

#mul $t5,$a1,30
addi $a0,$zero,30
add $a1,$t9,$zero
jal multipy
add $t5,$v0,$zero

add $v0,$t0,$t1
add $v0,$v0,$t2
add $v0,$v0,$t3
sub $v0,$v0,$t4
sub $v0,$v0,$t5
addi $v0,$v0,-7
lw $ra,0($sp)
addi $sp, $sp, 4
jr $ra

multipy:
addi $sp, $sp, -4
sw $t8,0($sp)
add $v0,$zero,$zero
add $t8,$zero,$zero
beq $a1,$zero,return
slt $at,$a0,$zero
bne $at,$zero,negative
positive:
slt $at,$t8,$a0
beq $at,$zero,return
add $v0,$v0,$a1
addi $t8,$t8,1
j positive
negative:
slt $at,$a0,$t8
beq $at,$zero,return
sub $v0,$v0,$a1
addi $t8,$t8,-1
j negative
return:
lw $t8,0($sp)
addi $sp, $sp, 4
jr $ra

end:
add $v0,$s5,$zero
lui $t0,0x1001
sw $v0,0($t0)
