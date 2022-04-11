# PURPOSE: This program finds the minimum  number of a
# set of data items.
# VARIABLES: The registers have the following uses:
#
# %edi - Holds the index of the data item being examined
# %ebx - smallest data item found
# %eax - Current data item
# The following memory locations are used:
#
# data_items - contains the item data. 
# data_size - contains the size of the data

.section .data
data_items: 
.long 3,67,34,222,45,75,54,34,44,33,10,1,66,100

data_size:
.long 14

.section .text

.globl _start
_start: 
movl $0, %edi # move 0 into the index register
movl data_items(,%edi,4), %eax # load the first byte of data
movl %eax, %ebx # since this is the first item, %eax is the smallest

start_loop:
cmpl %edi, data_size # check to see if we hit the end
je loop_exit # If we hit the end, exit the loop
incl %edi # load next value by incrementing index
movl data_items(,%edi,4), %eax # load next byte of data
cmpl %ebx, %eax # compare values
jge start_loop # jump to loop beginning if the new one is bigger (we don't need to update current smallest)

movl %eax, %ebx # update smallest so far
jmp start_loop # jump to beginning of loop

loop_exit:
# %rbx is the status code for the exit system call. It already has the maximum number
movl $1, %eax # 1 is the exit() syscall 
int $0x80 
