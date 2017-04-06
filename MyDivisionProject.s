.globl main
.globl loop
.globl Rgreater0
.globl Rless0
.globl shiftDivisor
.data

Dividend:	.asciiz "Enter your Dividend: " #0-21
Divisor:	.asciiz "Enter your Divisor: "
Quotient:	.asciiz "Quotient is: "
Remainder:	.asciiz "\n\nRemainder is: "
#varible specification:a0= Dividend,a1= Divisor,v0= Quotient,v1= Remainder,t1= temp_use_to_swap _value t2= condition bool,t3= counter

.text		

main:
	addi $v0, $0, 4
	lui $a0, 0x1000        # Address of Dividend
	syscall                # Display Dividend Prompt
	addi $v0, $0, 5
	syscall                # Get Dividend
	add $t1, $0, $v0       # Temp. Store my Dividend into $t1
	addi $v0, $0, 4
	lui $a0, 0x1000
	addi $a0, $a0, 22	#address of Divisor
	syscall                # Display Disvior Prompt
	addi $v0, $0, 5
	syscall			# Get Divisor
	add $a1, $0, $v0        # Store my Divisor into $a1
	add $a0, $0, $t1	# move dividend into $a0	
	addi $v0, $0, 0  	#initialize Quotient
	add $v1, $0, $t1	#initialize Remainder = Dividend
	addi $t3, $0, 0		#initialize counter value 
	sll $a1, $a1, 16	#shift divisor left 16 bits
	
loop:	
	add $0, $0, $0
	sub $v1, $v1, $a1	# substract divisor from remainder
	slt $t2, $v1, $0	
	bne $t2, $0, Rless0	# Remainder $t4<0-->Rless0
	add $0, $0, $0	

Rgreater0:

	sll $v0, $v0, 1		#shift Quoteint left 1 bit
	addi $v0, $v0, 1	# set rightmost bit to 1
	j shiftDivisor		#jump to shiftDivisor
	add $0, $0, $0
Rless0:
	add $0, $0, $0
	add $v1, $a1, $v1	#restore remainder
	sll $v0, $v0, 1		#shift Quoteint 1 bit left
	
shiftDivisor:
	add $0, $0, $0
	addi $t3, $t3, 1	# increment 1
	srl $a1, $a1, 1		# shift Divisor right 1 bit 
	slti $t2, $t3, 17	# check if counter is < 17
	beq $t2, 1, loop	# if is go back to loop else continue
	add $0, $0, $0
Result:
	add $t1, $0, $v0	# Temp store v0 in $t1
	addi $v0, $0, 4	
	lui $a0,0x1000		
	addi $a0, $a0, 43	# address of quotient prompt
	syscall			# Display prompt

	addi $v0, $0, 1		# call function which Display a Integer
	add $a0, $0, $t1	# Get quotient ready to display
	syscall			# Display quotient
	
	addi $v0, $0, 4
	lui $a0,0x1000
	addi $a0, $a0, 58	# address of remainder prompt
	syscall			# display remainder prompt

	addi $v0, $0, 1
	add $a0, $0, $v1	# return remainder
	syscall			# display remainder
	
end:
	addi $v0, $0, 10	
	syscall			#exit

	
