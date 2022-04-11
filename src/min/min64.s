# PURPOSE: This program finds the minimum  number of a
# set of data items.
# VARIABLES: The registers have the following uses:
#
# %rbx - Holds the index of the data item being examined
# %rdi - smallest data item found
# %rax - Current data item
# The following memory locations are used:
#
# data_items - contains the item data. 
# data_size - contains the size of the data

.section .data
data_items: 
.quad 3,67,34,222,45,75,54,34,44,33,10,1,66,100

data_size:
.quad 14

.section .text

.globl _start
_start: 
movq $0, %rbx # move 0 into the index register
movq data_items(,%rbx,8), %rax # load the first byte of data
movq %rax, %rdi # since this is the first item, %rax is the smallest

start_loop:
cmpq %rbx, data_size # check to see if we hit the end
je loop_exit # If we hit the end, exit the loop
incq %rbx # load next value by incrementing index
movq data_items(,%rbx,8), %rax # load next byte of data
cmpq %rdi, %rax # compare values
jge start_loop # jump to loop beginning if the new one is bigger (we don't need to update current smallest)

movq %rax, %rdi # update smallest so far
jmp start_loop # jump to beginning of loop

loop_exit:
# %rbx is the status code for the exit system call. It already has the maximum number
movq $60, %rax # 1 is the exit() syscall 
syscall 

# movq $60, %rax # Exit system call number -> RAX
# movq $42, %rdi # Status number to be returned -> RDI
# syscall # Signal to the kernel to perform the system call
