ldr r0, =0x20200000
mov r2, #1
lsl r2, #24
str r2, [r0, #4]
mov r1, #1
lsl r1, #18
str r1, [r0, #40]

on_off_loop:

ldr r2, =0x2000
off_loop_1:
cmp r2, #0
blt end_off_loop_1
ldr r3, =0x2000
off_loop_2:
cmp r3, #0
blt end_off_loop_2
sub r3, r3, #1
b off_loop_2
end_off_loop_2:
sub r2, r2, #1
b off_loop_1
end_off_loop_1:

str r1, [r0, #28]

ldr r2, =0x2000
on_loop_1:
cmp r2, #0
blt end_on_loop_1
ldr r3, =0x2000
on_loop_2:
cmp r3, #0
blt end_on_loop_2
sub r3, r3, #1
b on_loop_2
end_on_loop_2:
sub r2, r2, #1
b on_loop_1
end_on_loop_1:

str r1, [r0, #40]

b on_off_loop
