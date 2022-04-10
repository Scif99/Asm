# PURPOSE: This program writes the message "hello world" and exits
# Doesn't use any library

.include "linux.s" # Include a file with some common linux system calls

.section .data
helloworld:
    .ascii "hello world\n"

random: 
.ascii "random intermediate data\n"

helloworld_end:
.equ helloworld_len, random-helloworld # Get the length by using the difference of addresses

.section .text
.globl _start
_start:
movq $STDOUT, %rbx
movq $helloworld, %rcx
movq $helloworld_len, %rdx
movq $SYS_WRITE, %rax
int $LINUX_SYSCALL # Transfer control to kernel (executes the write)

XORq %rbx, %rbx # Equivalent to movq $0, %rbx
movq $SYS_EXIT, %rax
int $LINUX_SYSCALL # Transfer control to kernel, exit.
