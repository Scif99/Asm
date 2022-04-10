# Changes to 32bit:
# 
# 4-byte registers are replaces with 8 byte ones
# movl is replaced with movq as registers are 8 bytes
# System call number for exit is 60 compared to 1
# Return Status is stored in rdi instead of ebx
# 

# Purpose
# This program does nothing but exit and return a status code to the Linux kernel
# The system call number is always required to be stored in %eax. In this case the syscall number is 1 for exit.
# 
# Input: None
# Output: Returns a status code. This can be viewed by typing
# echo $? after running
#
# Variables:
#       %rax holds to system call number
#       %rdi holds the return status

.section .text
.globl _start
_start:
movq $60, %rax # Exit system call number -> RAX
movq $42, %rdi # Status number to be returned -> RDI
syscall # Signal to the kernel to perform the system call