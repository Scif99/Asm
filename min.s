# PURPOSE: This program finds the minimum  number of a
# set of data items.
# VARIABLES: The registers have the following uses:
#
# %rdi - Holds the index of the data item being examined
# %rbx - smallest data item found
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
movq $0, %rdi # move 0 into the index register
movq data_items(,%rdi,8), %rax # load the first byte of data
movq %rax, %rbx # since this is the first item, %rax is the smallest

start_loop:
cmpq %rdi, data_size # check to see if we hit the end
je loop_exit # If we hit the end, exit the loop
incq %rdi # load next value by incrementing index
movq data_items(,%rdi,8), %rax # load next byte of data
cmpq %rbx, %rax # compare values
jge start_loop # jump to loop beginning if the new one is bigger (we don't need to update current smallest)

movq %rax, %rbx # update smallest so far
jmp start_loop # jump to beginning of loop

loop_exit:
# %rbx is the status code for the exit system call. It already has the maximum number
movq $1, %rax # 1 is the exit() syscall 
int $0x80 
