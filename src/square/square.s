# Changes to 32bit:
# 
# 4-byte registers are replaces with 8 byte ones
# movl is replaced with movq as registers are 8 bytes
# System call number for exit is 60 compared to 1
# Return Status is stored in rdi instead of ebx
# 

# PURPOSE: Program to illustrate how functions work
# This program will compute the value of
# 3^2
#

.section .text
.globl _start
_start:
pushq $10 # push first argument
call square # call the function
addq $8, %rsp # move the stack pointer back

movq %rax, %rbx # move answer to %rbx
movq $1, %rax # exit system call
int $0x80 # Transfer control to kernel


# PURPOSE: This function is used to compute
# the square of a number
#
# INPUT: First argument - the base number
#
# OUTPUT: Will give the result as a return value
#
# NOTES: The power must be 1 or greater
#
# VARIABLES:
# %rbx - holds the base number
# 
#
.type square,@function
square:
pushq %rbp # save old base pointer
movq %rsp, %rbp # make stack pointer the base pointer

# Note that we don't need temporary storage for this function
# We can simply use %rax for calculations, then return it

movq 16(%rbp), %rax # Store argument in %rax
imulq $10, %rax # Multiply argument by 10

movq %rbp, %rsp # restore the stack pointer
popq %rbp # restore the base pointer
ret
