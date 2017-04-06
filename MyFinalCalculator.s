.globl main
.globl done
.globl storeNumber
.globl storeOperator
.globl storeSymbol
.globl loadexpression
.globl storeA
.globl storeB
.globl storeC
.globl storeD
.globl storeE
.globl calculate
.globl convertString
.globl convertSymbol
.globl Rgreater0
.globl Rless0
.globl shiftDivisor
.globl multiplication
.globl handlePlus
.globl handleMinues
.globl division
.globl loop
.globl reverseSign1
.globl reverseSign2
.globl loadNumbers
.globl check
.globl reverse
.globl returnRemainder
.globl returnAnswer
.globl plusM1
.globl muloop
.globl loadSign
.globl loadPlus
.globl lastNumber
.globl load2
.globl tempmul
.globl temploop 
.globl tempplusM1
.globl loadback
.globl displayError
.globl return

.data 
a:		.half 0
b:		.half 0xffff
c:		.half 0xce20
d:		.half 1
e:		.half 102

error:		.asciiz "Syntax Error"
expression:	.asciiz "e:=e   - 43 *     e+   e%17+462    - c   /   4"
 

.text
main:
	add $0,$0,$0
	lui $a0,0x1000
	addi $a0,$a0,23		#address of expression
	add $t1,$0,$0		#comparator registor1
	add $t2,$0,$0		#comparator registor2
	add $a0,$a0,$t3		#t3 is my expression index counter,
				#this mean goes to the next index of expression
	jal loadexpression	#jump to loadexpression
	
storeNumber:
	add $0,$0,$0
	
	lui $a0,0x1000		
	addi $a0,$a0,23		#expression adress 
	add $a0,$a0,$t3		#go to the next index of expression 
	addi $a0,$a0,-1		#go to the previous index
	lb $s0,0($a0)		#load the previous index to $s0
	add $0,$0,$0
	slti $t1,$s0,58		#check is previous index a number
	slti $t2,$s0,48
	bne $t1,$t2,convertString #branch to convertString if it is a number
	add $0,$0,$0		#if the previous index of the expression is not a number do below
	lui $a0,0x1001		# else go to the address where I store Number and symbol
	add $a0,$a0,$t4		# $t4 is my counter of number of item in this address which initially is zero
	addi $s1,$s1,-48	#convert this number to actual 0-9 number
	sh $s1,0($a0)		#store the number we just convert to address
	addi $t4,$t4,2		# increment the counter by 2 since it is a half word
	addi $t3,$t3,1		# increment the expression counter by 1 because it is a byte
	j main
	add $0,$0,$0
convertString:
	add $0,$0,$0		#if the previous index is a number
	lui $a0,0x1001		#go to the address of number 
	add $a0,$a0,$t4		#go to the current index
	addi $a0,$a0,-2		#check the previous index of the number address
	lh $a1,0($a0)		#load number in the previous index to a1
	addi $a2,$0,10		#second argument of the multiplication
	jal tempmul		#multiply two number and put number in $s0
	add $0,$0,$0
	addi $s1,$s1,-48	#convert number in current index to 0-9	
	add $s1,$s1,$s0		#add current number to previous number which had been multiply by ten
	sh $s1,0($a0)		#store the sum into the previous memory address where we store the previous index of number
	addi $t3,$t3,1		#increment the expression counter
	j main			
	add $0,$0,$0
tempmul:			#multiplication start
	add $0,$0,$0
	sll $a1,$a1,16		#shift multiplicant 16 bit to the left
temploop:			#multiplication loop
	add $0,$0,$0
	andi $t1,$a2,1		#get the rightmost bit of the product
	beq $t1,1,tempplusM1	#if it equal to 1, go tempplusM1
	add $0,$0,$0
	srl $a2,$a2,1		#else shift product 1 bit to the right
	addi $t0,$t0,1		#increment counter of multiplication
	slti $t1,$t0,16		#check if it loop 16 times
	beq $t1,1,temploop	#if not go back to loop
	
	add $0,$0,$0
	add $t0,$0,$0		#when loop complete set multiplication register to 0 in order to ready for next multiplation or division
	add $s0,$0,$a2		#put the product into $s0
	jr $ra			#jump back to where we jump from
	add $0,$0,$0
tempplusM1:
	add $0,$0,$0		#if the rightmost bit equal to 1
	add $a2,$a1,$a2		#add the product with multiplicant
	srl $a2,$a2,1		#shift product to the right 1 bit
	addi $t0,$t0,1		#increment the multiplication counter
	slti $t1,$t0,16		# check if it loop 16 times
	beq $t1,1,temploop	#if  not go back to loop
	add $0,$0,$0
	add $t0,$0,$0		#reset $t0
	add $s0,$0,$a2		#put the outcome into $s0
	jr $ra			#jump back to where we jump from
	add $0,$0,$0
storeOperator:
	add $0,$0,$0
	lui $a0,0x1001
	ori $a0,$a0,0x2000	#go to the address store operator
	add $a0,$a0,$t5		#t5 is operator counter 
	addi $t5,$t5,1		#increment the operator counter since we are going to add something to this address
	sb $s1,0($a0)		#store the operator to the address
	addi $t3,$t3,1		#increment the expression counter
	j main
	add $0,$0,$0
storeSymbol:
	add $0,$0,$0
	lui $a0,0x1001		#go the the address where we store number and symbol
	add $a0,$a0,$t4		#go to the next avaiable index
	beq $s1,97, storeA	# if a go to storeA which convert the symbol a to value of a
	add $0,$0,$0
	beq $s1,98, storeB	# if b go to storeB which convert the symbol b to value of b
	add $0,$0,$0
	beq $s1,99, storeC	# if c go to storeC which convert the symbol c to value of c
	add $0,$0,$0
	beq $s1,100,storeD	# if d go to storeD which convert the symbol d to value of d
	add $0,$0,$0
	beq $s1,101,storeE	# if e go to storeE which convert the symbol e to value of e
	add $0,$0,$0
	j main
	add $0,$0,$0		
	
storeA:
	add $0,$0,$0
	lui $a0,0x1000		#go to the address where it hold the value of a
	lh $s1,0($a0)		#load the number from the address
	add $0,$0,$0		
	lui $a0,0x1001		#go to address of symbol and number
	add $a0,$a0,$t4		#go to the specific index that has symbol a
	addi $t4,$t4,2		#increment the index counter of number/symbol address
	addi $t3,$t3,1		#increment the expression counter 
	sh $s1,0($a0)		#recover the symbol a with value of a
	j main
	add $0,$0,$0
storeB:
	add $0,$0,$0
	lui $a0,0x1000		#go to the address where it hold the value of b
	lh $s1,2($a0)		#load the number from the address
	add $0,$0,$0
	lui $a0,0x1001		#go to address of symbol and number
	add $a0,$a0,$t4		#go to the specific index that has symbol b
	addi $t4,$t4,2		#increment the index counter of number/symbol address
	addi $t3,$t3,1		#increment the expression counter 
	sh $s1,0($a0)		#recover the symbol b with value of b
	j main
	add $0,$0,$0
storeC:
	add $0,$0,$0		
	lui $a0,0x1000		#go to the address where it hold the value of c
	lh $s1,4($a0)		#load the number from the address
	add $0,$0,$0
	lui $a0,0x1001		#go to address of symbol and number
	add $a0,$a0,$t4		#go to the specific index that has symbol c
	addi $t4,$t4,2		#increment the index counter of number/symbol address
	addi $t3,$t3,1		#increment the expression counter 
	sh $s1,0($a0)		#recover the symbol c with value of c
	j main
	add $0,$0,$0
storeD:
	add $0,$0,$0
	lui $a0,0x1000		#go to the address where it hold the value of d
	lh $s1,6($a0)		#load the number from the address
	add $0,$0,$0
	lui $a0,0x1001		#go to address of symbol and number
	add $a0,$a0,$t4		#go to the specific index that has symbol d
	addi $t4,$t4,2		#increment the index counter of number/symbol address
	addi $t3,$t3,1		#increment the expression counter 
	sh $s1,0($a0)		#recover the symbol d with value of d
	j main
	add $0,$0,$0
	
storeE:
	add $0,$0,$0
	lui $a0,0x1000		#go to the address where it hold the value of e
	lh $s1,8($a0)		#load the number from the address
	add $0,$0,$0
	lui $a0,0x1001		#go to address of symbol and number
	add $a0,$a0,$t4		#go to the specific index that has symbol e
	addi $t4,$t4,2		#increment the index counter of number/symbol address
	addi $t3,$t3,1		#increment the expression counter 
	sh $s1,0($a0)		#recover the symbol e with value of e
	j main
	add $0,$0,$0
loadexpression:
	add $0,$0,$0
	lb $s1, 0($a0)		#load the current index of expression into $s1
	add $0,$0,$0
	slti $t1,$s1,58		#check it is a number of not
	slti $t2,$s1,48
	bne $t1,$t2,storeNumber	#go to store number if it is a number
	add $0,$0,$0		#else
	slti $t1,$s1,33		#check it is in the range of operator or not

	bne $t2,$t1,storeOperator	#if it is in the range of operator go to store operator
	add $0,$0,$0
	slti $t1,$s1,97		#check if the number we load is in the range of symbol(a-z)
	slti $t2,$s1,123
	bne $t1,$t2,storeSymbol	# if in the range go to storeSymbol
	add $0,$0,$0
	addi $t3,$t3,1		#else increment the expression counter
	bne $s1,0,main		#if the number we load isnt 0 which mean not empty go back to main
	add $0,$0,$0
	add $t3,$0,$0		#else reinitialize my expression counter to zero
	addi $t5,$t5,2		#increase the operator counter by 2 since there should be two more number than operator
	add $t2,$t5,$t5		#double it beacuse number is in half word but operator is in byte
	bne $t4,$t2,displayError	# if number of 2*(operator+2) is not equal to the index number of number address, displayError
	add $t0,$0,$0
	add $t4,$0,$0		#set t4 to 0
	addi $t5,$t5,-2		#decrese the operator counter
loadSign:
	add $0,$0,$0
	lui $a0,0x1001		
	ori $a0,$a0,0x2000	#go to the operator address
	add $a0,$a0,$t3		#go to the current index	
	addi $a0,$a0,-1		#check the previous index
	lb $s1,0($a0)		#load the operator of the previous index out
	add $0,$0,$0
	beq $s1,42,firstArgument	#if equal to *
	add $0,$0,$0
	beq $s1,47,firstArgument	#if equal to /
	add $0,$0,$0			
	beq $s1,37,firstArgument	#if equal to %	
	add $0,$0,$0
	beq $s1,45,firstArgument	#if equal to -
	add $0,$0,$0			# because with this sign in previous the first argument should be in the answer address
	addi $a0,$a0,1			#go back to current index
	lb $s1,0($a0)			#load current sign
	add $0,$0,$0
	beq $s1,0,directEnd		#if there is no sign directly assiged the symbol to the number in the second number address
	add $0,$0,$0
	beq $s1,43,loadPlus		#if sign == +	because we dont need to care about converting negative sign in these two cases
	add $0,$0,$0
	beq $s1,45,loadPlus		#if sign == -	
	add $0,$0,$0

loadNumbers:
	lui $a0,0x1001
	add $a0,$a0,$t6			#go to the current index of number address
	addi $t6,$t6,2			#increment by 2
	lh $a1,2($a0)			#load the second number as first argument
	add $0,$0,$0
	slt $t1,$a1,0			#check it is negative or not
	beq $t1,1,reverseSign1		#if it is a negative number, go to reverseSign1
	add $0,$0,$0
	lh $a2,4($a0)			#load the third number as second argument	
	add $0,$0,$0
	slti $t7,$a2,0			#check it is a negative number or not
	beq $t7,1,reverseSign2		#go to reverse second argument
	add $0,$0,$0
	

calculate:
	add $0,$0,$0
	beq $s1,47,division		#if operator is / to divison
	add $0,$0,$0			
	beq $s1,37,division		#if operator is % also go to divsion
	add $0,$0,$0
	beq $s1,42,multiplication	#if operator is * go multiplication
	add $0,$0,$0
	beq $s1,43,handlePlus		#if operator is + go handlePlus
	add $0,$0,$0
	beq $s1,45,handleMinues		#if operator is - go handleMinues
	add $0,$0,$0
	addi $t4,$t4,4			#increment the answer counter
	addi $t3,$t3,1			#increment the operator counter
	bne $t5,$t3, loadSign		#if operator counter is not reach the end go loadSign again
	add $0,$0,$0
	j lastNumber			#else go to lastNumber to sum up everything in answer address
	add $0,$0,$0
loadPlus:
	add $0,$0,$0			#load the argument for plus and minues sign
	lui $a0,0x1001
	add $a0,$a0,$t6			#go to the current index of number address
	addi $t6,$t6,2			#increment the number address's counter
	lh $a1,2($a0)			#load the second number as first argument
	add $0,$0,$0
	lh $a2,4($a0)			#load the third number as third argument
	add $0,$0,$0
	
handlePlus:
	add $0,$0,$0
	lui $a0,0x1001
	ori $a0,$a0,0x2000		#go to the operator address
	add $a0,$a0,$t3			#go to next index of the operator address
	lb $s1,0($a0)			#check operator in next index 
	add $0,$0,$0	
	beq $s1,43,load2		#if it is a + again go to load2 which is enhance load function
	add $0,$0,$0
	beq $s1,45,load2		#if it is a - again go to load2 which is enhance load function
	add $0,$0,$0
	add $v0,$0,$a1			#else just put the first argument to return register which is v0
	beq $t7,1,reverse		#if the sign bit is 1 go to reverse
	add $0,$0,$0
	j returnAnswer			#returnAnswer which load the answer to current index of answer address
	add $0,$0,$0
load2:
	add $0,$0,$0
	lui $a0,0x1001
	ori $a0,$a0,0x3000		#go to the answer address
	add $a0,$a0,$t4			#go to the avaiable index
	sw $a1,0($a0)			#store argument1 as a word
	addi $t4,$t4,4			#increment answer counter
	beq $s1,45,handleMinues		#if the operator is - go to handleMinues
	add $0,$0,$0
	sw $a2,4($a0)			#else store the second argument to next avaiable index
	addi $t3,$t3,1			#increment the operator counter
	bne $t3,$t5,loadSign		#if operator counter doesnt reach the end, go back to load next Sign
	add $0,$0,$0
	j lastNumber			#else go to the last step
	add $0,$0,$0
handleMinues:
	add $0,$0,$0
	add $v0,$0,$a2			#put the second argument in to v0 which is my return registor
	addi $t7,$0,1			#force sign registor to 1
	beq $t7,1,reverse		#go to reverse the sign
	add $0,$0,$0	
	j returnAnswer			#else go to return answer	
	add $0,$0,$0
	
firstArgument:
	add $0,$0,$0
	lui $a0,0x1001			#go to the address of my answer
	ori $a0,$a0,0x3000
	addi $t4,$t4,-4			#go to the previous index of answer address
	add $a0,$a0,$t4	
	lw $a1,0($a0)			#load the content in that address as first argument
	add $0,$0,$0
	lui $a0,0x1001
	ori $a0,$a0,0x2000		#go to the operator address
	add $a0,$a0,$t3
	lb $s1,0($a0)			#load the current operator out
	add $0,$0,$0
	lui $a0,0x1001			#go to number address
	add $a0,$a0,$t6			#go to current index
	addi $t6,$t6,2			#increment the number address index by 2
	lh $a2,4($a0)			#load the third number as my second argument
	add $0,$0,$0
	beq $s1,43,load2		#if the sign is + go to special load function for plus
	add $0,$0,$0
	beq $s1,45,load2		#if the sign is - go to special load function for plus
	add $0,$0,$0
	addi $t6,$t6,-2			#decrese the answer counter by two because first argument we took from the answer address
	lui $a0,0x1001
	add $a0,$a0,$t6			#else go the the current number address
	addi $t6,$t6,2			#increment the index by 2
	slt $t1,$a1,0			#check it is negative
	beq $t1,1,reverseSign1		#if 1 go reverseSign
	add $0,$0,$0
	lh $a2,4($a0)			#load second argument
	add $0,$0,$0
	slti $t7,$a2,0			#check it is negative or noy
	beq $t7,1,reverseSign2		#if 1 go reverseSign
	add $0,$0,$0
	j calculate			#else jump to calculate
	
reverseSign1:
	
	add $0,$0,$0			#basic 2's complement to get a opposite sign number
	nor $a1,$a1,0
	addi $a1,$a1,1

check:

	add $0,$0,$0			#load second argument
	lh $a2,4($a0)	
	add $0,$0,$0
	addi $t7,$0,1			#set sign registor t7 to 1
	slt $t1,$a2,0			#check a2 is negative or not
	bne $t7,$t1,calculate		#if they are different just go to calculate
	add $0,$0,$0
	add $t7,$t7,-1			# if they are the same we need to sign registor to 0
reverseSign2:
	add $0,$0,$0			#2's complement
	nor $a2,$a2,0
	addi $a2,$a2,1
	j calculate			#jumb to calculate
	add $0,$0,$0

multiplication:
	add $0,$0,$0			#multiplication start
	sll $a1,$a1,16			#shift multiplicant 16 bits to the left
muloop:					#loop start
	add $0,$0,$0			
	andi $t1,$a2,1			#get the rightmost bit of product
	beq $t1,1,plusM1		#if equal 1 go to PlusM1
	add $0,$0,$0
	srl $a2,$a2,1			#else shift product 1 bit to the right
	addi $t0,$t0,1			#increment multiplication counter
	slti $t1,$t0,16			#check it is less than 16 or not
	beq $t1,1,muloop		#if yes go back to loop
	j return
plusM1:
	add $0,$0,$0
	add $a2,$a1,$a2			#plus multiplicant and product store in product
	srl $a2,$a2,1			#shift product 1 bit to the right
	addi $t0,$t0,1			#increment the multiplication counter by 1
	slti $t1,$t0,16			#check it is less than 16 or not
	beq $t1,1,muloop		# if yes go back to the loop
	j return
return:
	add $0,$0,$0			#multiplication completed
	add $v0,$0,$a2			#put the product in to v0 which is my return registor 
	beq $t7,1,reverse		#check sign registor if it is 1 reverse the number
	add $0,$0,$0
	j returnAnswer			#if no need for reverse sign just go returnAnswer
	add $0,$0,$0
	
		 
division:				#division start
	add $0,$0,$0
	add $v0,$0,$0			#initialize v0 to 0
	sll $a2,$a2,16			#shift divisor 16 bit to the left
loop:
	add $0, $0, $0
	sub $a1, $a1, $a2	# substract divisor from remainder
	slt $t2, $a1, $0	
	bne $t2, $0, Rless0	# Remainder $t2<0-->Rless0
	add $0, $0, $0	

Rgreater0:

	sll $v0, $v0, 1		#shift Quoteint left 1 bit
	addi $v0, $v0, 1	# set rightmost bit to 1
	j shiftDivisor		#jump to shiftDivisor
	add $0, $0, $0
Rless0:
	add $0, $0, $0
	add $a1, $a2, $a1	#restore remainder
	sll $v0, $v0, 1		#shift Quoteint 1 bit left
	
shiftDivisor:
	add $0, $0, $0
	addi $t0, $t0, 1	# increment 1
	srl $a2, $a2, 1		# shift Divisor right 1 bit 
	slti $t2, $t0, 17	# check if counter is < 17
	beq $t2, 1, loop	# if is go back to loop else continue
	add $0, $0, $0
	beq $s1,37,returnRemainder	#if the operator is % go return remainder
	add $0,$0,$0
	beq $t7,1,reverse	#check the sign operator if it is 1 go reverse the answer
	add $0,$0,$0
returnAnswer:
	add $0,$0,$0
	lui $a0,0x1001
	ori $a0,$a0,0x3000	# go to the address where I store my answers from the first round iteration
	add $a0,$a0,$t4		# go to the current index of my answer address
	sw $v0,0($a0)		# store my return value into the answer address
	add $0,$0,$0
	addi $t4,$t4,4		# increment the answer counter by 4 since it is a word
	addi $t3,$t3,1		# increment the operator counter by 1
	add $t0,$0,$0
	bne $t3,$t5,loadSign	# check if operator counter point to the end
	add $0,$0,$0
	j lastNumber		# go to the last step
	add $0,$0,$0
returnRemainder:
	add $0,$0,$0
	add $v0,$0,$a1		#set the number we want to store to remainder
	j returnAnswer		#go to returnAnswer
	
reverse:
	add $0,$0,$0		#2's complement to reverse the sign
	nor $v0,$v0,0
	addi $v0,$v0,1
	j returnAnswer		#jump to returnAnswer
	add $0,$0,$0
directEnd:			#means there is no sign
	add $0,$0,$0
	lui $a0,0x1001		#go to number address
	lh $s1,2($a0)		#load the second data in there
	add $0,$0,$0
	lui $a0,0x1001		
	ori $a0,$a0,0x3000	#go to answer address
	sw $s1,0($a0)		#store the number in answer address
	j lastNumber
lastNumber:			#prepare for the sum
	add $0,$0,$0
	addi $t4,$t4,4		#get the index 1 word larger just in case some number is not load
sum:
	add $0,$0,$0
	lui $a0,0x1001
	ori $a0,$a0,0x3000	#go to the answer address
	add $a0,$a0,$t0		#go  to current index
	addi $t0,$t0,4		#increment the counter by 4
	lw $s1,0($a0)		#load the number in current index to s1
	add $0,$0,$0
	add $v1,$s1,$v1		#put add s1 with the previous answer number
	bne $t0,$t4,sum		#if not end, go back to sum
	add $0,$0,$0		#sum end
	add $t0,$0,$0
	lui $a0,0x1001		#go to the number address
	lh $s0,0($a0)		#load the first number in that address which is the symbol we want to assign our new number
	add $0,$0,$0
	j loadback		#jump to load the new value back to the initial address of symbol 
	add $0,$0,$0
displayError:
	add $0,$0,$0
	addi $v0,$0,4
	lui $a0,0x1000		#address of error prompt
	addi $a0,$a0,10
	syscall			#call display
	add $0,$0,$0
	j done			#jump to done

loadback:
	add $0,$0,$0		
	lui $a0,0x1000		#begining of the address
	add $a0,$a0,$t0		#go to current index
	lh $s1,0($a0)		#load the value in there to s1
	add $0,$0,$0
	addi $t0,$t0,2		# increment the counter by 2
	bne $s0,$s1,loadback	# if the s1!=s0 which mean the symbol is not match go loadback again
	add $0,$0,$0
	sh $v1,0($a0)		# replace the original symbol value with the value I just compute from my calculator
	j done			#jump to done
done:		
	add $0,$0,$0
	addi $v0,$0,1		#call display a integer
	add $a0,$0,$v1		#pass my value into argument
	syscall			#display
	add $0,$0,$0
	addi $v0,$0,10		#exit
	syscall
