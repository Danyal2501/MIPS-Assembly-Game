######################################################################
# CSCB58 Winter2021Assembly Final Project
# University of Toronto, Scarborough
#
# Student: Danyal Rana, 1006329206, ranadany
#
# Bitmap Display Configuration:
# -Unit width in pixels: 8 (update this as needed)
# -Unit height in pixels: 8 (update this as needed)
# -Display width in pixels: 256 (update this as needed)
# -Display height in pixels: 256 (update this as needed)
# -Base Address for Display: 0x10008000 ($gp)
#
# Which milestoneshave beenreached in this submission?
# (See the assignment handout for descriptions of the milestones)
# -Milestone 4 (choose the one the applies)
#
# Which approved features have been implementedfor milestone 4?
# (See the assignment handout for the list of additional features)
# 1. Pickups (health pickup, 'easy' pickup[spawns after 15 waves])
# 2. After 15 waves, new level where an extra pickup spawns and objects are slightly larger and different colour
# 3. Smooth graphics
#
# Link to video demonstration for final submission:
#  https://www.awesomescreenshot.com/video/3355840?key=5334a7b5ad6d4038fb6eadb06d09c7e7
#
#Are you OKwith us sharing the video with people outside course staff?
# -yes
#
# Any additional information that the TA needs to know:# -(write here, if any)
######################################################################
.data
	num1:    .word   124
	red:    .word  16711680
	blue:      .word 0x0000ff
	black:      .word 0x000000
	white:     .word 0xffffff
	green:      .word  0x00ff00
	orange:      .word 0xffa500
	A:    .byte    0,0,0
	B:      .byte     0,0,0

	
.eqv BASE_ADDRESS 0x10008000


.text


.globl main

main:

	#initializing
	la $s2, A

	li $t0, BASE_ADDRESS# $t0 stores the base address for display
	lw $t1, red# $t1 stores the red colour code
	li $t4, 0
	li $s3, 128
	li $s4, 4092
	li $s5, 0
	li $t5, 0
	
	li $v0, 42
	li $a0, 0
	li $a1, 28
	
	#generate initial random numbers
	
	syscall
	
	mult $a0, $s3
	mflo $t3
	addi $t3, $t3, 256
	sw $t3, 0($s2)

	syscall
	mult $a0, $s3
	mflo $t3
	addi $t3, $t3, 256
	sw $t3, 4($s2)
	
	syscall
	mult $a0, $s3
	mflo $t3
	addi $t3, $t3, 256
	sw $t3, 8($s2)
	
	syscall
	mult $a0, $s3
	mflo $s6
	addi $t3, $t3, 256
	
	syscall
	mult $a0, $s3
	mflo $s7
	addi $t3, $t3, 256
	
	li $s4, 3968
	
	
#prints healh bar	
startHealth:

	bgt $s4, 4092, loop
	lw $t1, green
	sw $t1, 0x10008000($s4)
	addi $s4, $s4, 4
	b startHealth

#gameover screen
gameOver:

	li $t5,  1024
	add $t5, $t5, $t0 

	sw $t1, ($t5)

	sw $t1, -112($t5)
	sw $t1, -116($t5)
	sw $t1, -120($t5)
	sw $t1, -124($t5)
	sw $t1, 128($t5)
	sw $t1, 256($t5)
	sw $t1, 384($t5)
	sw $t1, 512($t5)
	sw $t1, 644($t5)
	sw $t1, 648($t5)
	sw $t1, 652($t5)
	sw $t1, 528($t5)
	sw $t1, 400($t5)
	sw $t1, 396($t5)
	sw $t1, 392($t5)

	addi $t5, $t5, 24
	
	#pint A
	sw $t1, ($t5)
	sw $t1, -128($t5)
	sw $t1, 128($t5)
	sw $t1, 256($t5)
	sw $t1, 384($t5)
	sw $t1, 512($t5)
	sw $t1, 640($t5)
	sw $t1, -124($t5)
	sw $t1, -120($t5)
	sw $t1, -116($t5)
	sw $t1, -112($t5)
	sw $t1, 16($t5)
	sw $t1, 144($t5)
	sw $t1, 272($t5)
	sw $t1, 268($t5)
	sw $t1, 264($t5)
	sw $t1, 260($t5)
	sw $t1, 400($t5)
	sw $t1, 528($t5)
	sw $t1, 656($t5)
	
	#print M
	addi $t5, $t5, 24
	
	sw $t1, ($t5)
	sw $t1, 132($t5)
	sw $t1, 264($t5)
	sw $t1, 140($t5)
	
	sw $t1, -128($t5)
	sw $t1, 128($t5)
	sw $t1, 256($t5)
	sw $t1, 384($t5)
	sw $t1, 512($t5)
	sw $t1, 640($t5)
	
	addi $t5, $t5, 16
	
	sw $t1, ($t5)
	sw $t1, -128($t5)
	sw $t1, 128($t5)
	sw $t1, 256($t5)
	sw $t1, 384($t5)
	sw $t1, 512($t5)
	sw $t1, 640($t5)
	
	#print E
	addi $t5, $t5, 8
	sw $t1, ($t5)
	sw $t1, -128($t5)
	sw $t1, -124($t5)
	sw $t1, -120($t5)
	sw $t1, -116($t5)
	sw $t1, 128($t5)
	sw $t1, 256($t5)
	sw $t1, 260($t5)
	sw $t1, 264($t5)
	sw $t1, 268($t5)
	sw $t1, 384($t5)
	sw $t1, 512($t5)
	sw $t1, 640($t5)
	sw $t1, 644($t5)
	sw $t1, 648($t5)
	sw $t1, 652($t5)
	
	#print O
	li $t5,  2304
	add $t5, $t5, $t0 
	sw $t1, ($t5)
	sw $t1, -124($t5)
	sw $t1, -120($t5)
	sw $t1, -116($t5)
	sw $t1, 16($t5)	
	sw $t1, 144($t5)	
	sw $t1, 272($t5)
	sw $t1, 400($t5)
	sw $t1, 528($t5)
	sw $t1, 652($t5)
	sw $t1, 648($t5)
	
	sw $t1, 128($t5)
	sw $t1, 256($t5)
	sw $t1, 384($t5)
	sw $t1, 512($t5)
	sw $t1, 644($t5)
	
	#print V
	addi $t5, $t5, 24
	sw $t1, -128($t5)
	sw $t1, -112($t5)
	sw $t1, 4($t5)
	sw $t1, 12($t5)
	sw $t1, 132($t5)
	sw $t1, 140($t5)
	sw $t1, 260($t5)
	sw $t1, 268($t5)
	sw $t1, 392($t5)
	sw $t1, 520($t5)
	sw $t1, 648($t5)
	
	#print E
	addi $t5, $t5, 24
	sw $t1, ($t5)
	sw $t1, -128($t5)
	sw $t1, -124($t5)
	sw $t1, -120($t5)
	sw $t1, -116($t5)
	sw $t1, 128($t5)
	sw $t1, 256($t5)
	sw $t1, 260($t5)
	sw $t1, 264($t5)
	sw $t1, 268($t5)
	sw $t1, 384($t5)
	sw $t1, 512($t5)
	sw $t1, 640($t5)
	sw $t1, 644($t5)
	sw $t1, 648($t5)
	sw $t1, 652($t5)
	
	#pint R
	addi $t5, $t5, 24
	sw $t1, ($t5)
	sw $t1, -128($t5)
	sw $t1, 128($t5)
	sw $t1, 256($t5)
	sw $t1, 384($t5)
	sw $t1, 512($t5)
	sw $t1, 640($t5)
	sw $t1, -124($t5)
	sw $t1, -120($t5)
	sw $t1, -116($t5)
	sw $t1, -112($t5)
	sw $t1, 16($t5)
	sw $t1, 144($t5)
	sw $t1, 272($t5)
	sw $t1, 268($t5)
	sw $t1, 264($t5)
	sw $t1, 392($t5)
	sw $t1, 524($t5)
	sw $t1, 656($t5)
	sw $t1, 260($t5)

	lw $t1, black
	li $t5, 0
	
	b tempLoop
	
	
#loops end screen until user enters P	
tempLoop:
	li $t9, 0xffff0000 
	lw $t8, 0($t9)
	
	li $v0, 32
	li $a0, 35 # Wait
	syscall
	
	lw $t2, 4($t9) # this assumes $t9 is set to 0xfff0000from before

	beq $t2, 112, clean # ASCII code of 'p'
	
	b tempLoop

#cleans screen
clean: 
	beq $t5, 4096, main
	
	sw $t1, 0x10008000($t5)
	addi $t5, $t5, 4
	b clean

#resets obstacles to random position
genRan:
	addi $s5, $s5, 1
	
	lw $t5,  4($s2)
	add $t7, $t5, $t0 

	sw $t1, -128($t7) 
	sw $t1, ($t7)  
	sw $t1, 128($t7)  
	sw $t1, 124($t7)  
	
	lw $t5,  8($s2)
	add $t7, $t5, $t0 
	
	sw $t1, -128($t7) 
	sw $t1, ($t7)  
	sw $t1, 128($t7)  
	sw $t1, 124($t7)  

	li $v0, 42
	li $a0, 0
	li $a1, 28
	
	syscall

	mult $a0, $s3
	mflo $t3
	addi $t3, $t3, 256
	sw $t3, 0($s2)

	syscall
	mult $a0, $s3
	mflo $t3
	addi $t3, $t3, 256
	sw $t3, 4($s2)
	
	syscall
	mult $a0, $s3
	mflo $t3
	addi $t3, $t3, 256
	sw $t3, 8($s2)
	
	b buildPickupHealth
	
#main loop of program
loop:
	addi $sp, $sp, -4
	sw $t4, 0($sp)
	

	
	jal buildShip
	li $t9, 0xffff0000 
	lw $t8, 0($t9)

	beq $t8, 1, keypress_happened   #check for input from keyboard
	
	
#0--------------------------------------- Print 3 obstacles		
	addi $sp, $sp, -4
	lw $t3, 0($s2)
	sw $t3, 0($sp)	
	jal buildObstacle
	
	lw $t3, 0($sp)
	sw $t3, 0($s2)
	addi $sp, $sp, 4
#0---------------------------------------			
	addi $sp, $sp, -4
	lw $t3, 4($s2)
	sw $t3, 0($sp)	
	jal buildObstacle
	
	lw $t3, 0($sp)
	sw $t3, 4($s2)
	addi $sp, $sp, 4
#0---------------------------------------	
	addi $sp, $sp, -4
	lw $t3, 8($s2)
	sw $t3, 0($sp)	
	jal buildObstacle

	lw $t3, 0($sp)
	sw $t3, 8($s2)
	addi $sp, $sp, 4
#0---------------------------------------
	li $v0, 32
	li $a0, 35 #wait
	syscall
	
	#spawn pickups
	
	bge $s5, 15, buildPickupEasy
	b buildPickupHealth
	b loop	

#handle keyboard inputs
keypress_happened:

	lw $t2, 4($t9) # this assumes $t9 is set to 0xfff0000from before
	
	add $s0, $t4, $zero
	

	
	beq $t2, 119, respond_to_w  # ASCII code of ''w 	
	beq $t2, 97, respond_to_a  # ASCII code of 'a' 
	beq $t2, 115, respond_to_s  # ASCII code of 's' 	
	beq $t2, 100, respond_to_d  # ASCII code of 'd'	
	beq $t2, 112, respond_to_p  # ASCII code of 'p'
	b loop
respond_to_p:
	lw $t1, black
	li $t5, 0
	b clean
	
respond_to_w:

	blt $t4, -1664, loop
	
	li $t5,  2052
	add $t5, $t5, $t0 
	add $t5, $t5, $s0
	lw $t1, black
	sw $t1, ($t5)  
			
	li $t5,  1932
	add $t5, $t5, $t0 
	add $t5, $t5, $s0
	sw $t1, ($t5)  
	
	li $t5,  1928
	add $t5, $t5, $t0 
	add $t5, $t5, $s0
	sw $t1, ($t5)  
		
	li $t5,  1920
	add $t5, $t5, $t0 
	add $t5, $t5, $s0
	sw $t1, ($t5)  
	
	addi $t4, $t4, -128
	b loop
	
respond_to_a:
	li $t6, 128
	divu $t4, $t6

	mfhi $t6
	beq $t6, 0, loop
	

	li $t5,  2052
	add $t5, $t5, $t0 
	add $t5, $t5, $s0
	lw $t1, black
	sw $t1, ($t5)  
			
	li $t5,  1932
	add $t5, $t5, $t0 
	add $t5, $t5, $s0
	sw $t1, ($t5)  
			
	li $t5,  1796
	add $t5, $t5, $t0 
	add $t5, $t5, $s0
	sw $t1, ($t5)  

	addi $t4, $t4, -4
	b loop
	
respond_to_s:

	bgt $t4, 1784, loop	
				
	li $t5,  1932
	add $t5, $t5, $t0 
	add $t5, $t5, $s0
	lw $t1, black
	sw $t1, ($t5)  
	
	li $t5,  1928
	add $t5, $t5, $t0 
	add $t5, $t5, $s0
	sw $t1, ($t5)  
	
		
	li $t5,  1920
	add $t5, $t5, $t0 
	add $t5, $t5, $s0
	sw $t1, ($t5)  
	
		
	li $t5,  1796
	add $t5, $t5, $t0 
	add $t5, $t5, $s0
	sw $t1, ($t5)  
	
	addi $t4, $t4, 128
	b loop
	
respond_to_d:
	li $t6, 128
	divu $t4, $t6

	mfhi $t6
	beq $t6, 112, loop
	
	li $t5,  2052
	add $t5, $t5, $t0 
	add $t5, $t5, $s0
	lw $t1, black
	sw $t1, ($t5)  
	
		
	li $t5,  1920
	add $t5, $t5, $t0 
	add $t5, $t5, $s0
	sw $t1, ($t5)  
	
		
	li $t5,  1796
	add $t5, $t5, $t0 
	add $t5, $t5, $s0
	sw $t1, ($t5)  
	
	addi $t4, $t4, 4
	b loop

	
	
#builds obstacles
buildObstacle:
	
	lw $t5, 0($sp)
	
	addi $sp, $sp, 4
	
	add $t7, $t5, $t0 
	
	lw $t1, black
	sw $t1, -128($t7)  
	sw $t1, ($t7)  
	sw $t1, 128($t7)  
	sw $t1, 124($t7)  

	
	
	li $t6, 128
	divu $t5, $t6

	mfhi $t6
	beq $t6, 4, genRan
	
	addi $t5, $t5, -4
	addi $t7, $t7, -4

	lw $a2, ($t7)
	
	beq $a2, 16711680, collision
	lw $a2, 124($t7)
	beq $a2, 16711680, collision
	lw $a2, 128($t7)
	beq $a2, 16711680, collision
	
	bgt $s5, 14, bigObj
	b endLoop

#sub-label, spawns different object based on "level"	
bigObj:
	lw $a2, -128($t7)
	beq $a2, 16711680, collision		
		
	lw $t1, orange
	sw $t1, -128($t7)
	b buildObstacle1
	
endLoop:		
	lw $t1, blue
	b buildObstacle1
	

 #handles collisions with ship
collision:
	lw $t1, black

	addi $s4,$s4, -12
	
	sw $t1, 0x10008000($s4) 
	sw $t1, 0x10008004($s4)  
	sw $t1, 0x10008008($s4) 
	 
	lw $t1, white
	 
	blt $s4, 3968, gameOver

#end half of the buildObstacle call
buildObstacle1:		


	sw $t1, ($t7)  
	sw $t1, 128($t7)  
	sw $t1, 124($t7)  
	
	addi $sp, $sp, -4
	sw $t5, 0($sp)
	jr $ra


#builds health pickup
buildPickupHealth:
	add $t7, $s6, $t0
	lw $t1, black
	lw $a2, 4($t7)
	sw $t1, 4($t7) 

	lw $t1, green
	

	beq $a2, 16711680, addHealth
	beq $t7, 16711680, addHealth
	
	li $t6, 128
	divu $s6, $t6

	mfhi $t6
	beq $t6, 0, genNum
			
	b buildPickupHealth2
	
#adds health if collision woith ship
addHealth:

	bge $s4, 4092, genNum
	sw $t1, 0x10008000($s4) 
	sw $t1, 0x10008004($s4) 
	addi $s4, $s4, 8

	
#generates random position if picked up or if reach end of screen
genNum:	
	li $v0, 42
	li $a0, 0
	li $a1, 28
	
	syscall
	mult $a0, $s3
	mflo $s6
	addi $s6, $s6, 256
	
	addi $s6, $s6, -4
	b loop
#end half of pickup health
buildPickupHealth2:
	
	sw $t1, ($t7) 
	
	addi $s6, $s6, -4
	b loop
	
	
#spawn 'easy' pickup
buildPickupEasy:
	add $t7, $s7, $t0
	lw $t1, black
	lw $a2, 4($t7)
	sw $t1, 4($t7) 

	lw $t1, blue
	

	beq $a2, 16711680, addEasy
	beq $t7, 16711680, addEasy
	
	li $t6, 128
	divu $s7, $t6

	mfhi $t6
	beq $t6, 0, genNumEasy
			
	b buildPickupEasy2
#temporarily turn obstacles to 'easy' when pickup
addEasy:
	li $s5, 13
#generates random number for 'easy' pickup
genNumEasy:	

	li $v0, 42
	li $a0, 0
	li $a1, 28
	
	syscall
	mult $a0, $s3
	mflo $s7
	addi $s7, $s7, 256
	
	addi $s7, $s7, -4
	b buildPickupHealth

#end half of build easy pickup
buildPickupEasy2:
	
	sw $t1, ($t7) 
	
	addi $s7, $s7, -4
	b buildPickupHealth

#builds ship			
buildShip:
	lw $t4, 0($sp)
	addi $sp, $sp, 4


	#---------------------------------------------------------------------
	lw $t1, red
	li $t5,  2052
	add $t5, $t5, $t0 
	add $t5, $t4, $t5
	sw $t1, ($t5)  
	

	
	li $t5,  1932
	add $t5, $t5, $t0
	add $t5, $t4, $t5
	lw $t1, blue
	sw $t1, ($t5)  
	
	
	lw $t1, red
	li $t5,  1928
	add $t5, $t5, $t0
	add $t5, $t4, $t5
	sw $t1, ($t5)  
	

	
	li $t5,  1924
	add $t5, $t5, $t0 
	add $t5, $t4, $t5
	sw $t1, ($t5)  
	

	
	li $t5,  1920
	add $t5, $t5, $t0 
	add $t5, $t4, $t5
	sw $t1, ($t5)  
	

	
	li $t5,  1796
	add $t5, $t5, $t0
	add $t5, $t4, $t5
	sw $t1, ($t5)  
	
	jr $ra
