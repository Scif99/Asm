# PURPOSE: This program writes the message "hello world" and exits
# Uses the printf function, that sends a string to the standard output
.section .data
helloworld:
.ascii "hello world\n\0" # The \0 allows the printf function to detect the end of the string

.section .text
.globl main
main:
# pushq $helloworld # Add parameter to stack
movq $helloworld, %rdi
call printf # Call function
# pushq $0
# call exit 

# Exit
movq $0, %rbx
movq $1, %rax
int $0x80
