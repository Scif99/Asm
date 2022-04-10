# Purpose
# This program does nothing but exit and return a status code to the Linux kernel
# The system call number is always required to be stored in %eax. In this case the syscall number is 1 for exit.
# 
# Input: None
# Output: Returns a status code. This can be viewed by typing
# echo $? after running
#
# Variables:
#       %eax holds to system call number
#       %ebx holds the return status

.section .text
.globl _start
_start:
movl $1, %eax # Exit system call number -> EAX
movl $40, %ebx # Status number to be returned -> EBX
int $0x80 # Signal to the kernel to perform the system call




