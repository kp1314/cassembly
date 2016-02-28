ldr r0, =0x20200000

mov r2, #1
lsl r2, #12
str r2, [r0, #4]   //Pin 14 is output
mov r1, #1
lsl r1, #14
str r1, [r0, #40]  //Pin 14 OFF

mov r2, #1
lsl r2, #15
str r2, [r0, #4]   //Pin 15 is output
mov r1, #1
lsl r1, #15
str r1, [r0, #40]  //Pin 15 OFF

mov r2, #1
lsl r2, #24
str r2, [r0, #4]   //Pin 18 is output
mov r1, #1
lsl r1, #18
str r1, [r0, #40]  //Pin 18 OFF

mov r2, #1
lsl r2, #9
str r2, [r0, #8]   //Pin 23 is output
mov r1, #1
lsl r1, #23
str r1, [r0, #40]  //Pin 23 OFF

mov r2, #1
lsl r2, #12
str r2, [r0, #8]   //Pin 24 is output
mov r1, #1
lsl r1, #24
str r1, [r0, #40]  //Pin 24 OFF

mov r2, #1
lsl r2, #15
str r2, [r0, #8]   //Pin 25 is output
mov r1, #1
lsl r1, #25
str r1, [r0, #40]  //Pin 25 OFF

main_loop:

ldr r2, =0x1000      //Can have 0x1000 stored into a register and half it 
wait_1_1:          //every time or something cool to make it harder
cmp r2, #0
blt end_wait_1_1
ldr r3, =0x1000
wait_2_1:
cmp r3, #0
blt end_wait_2_1
sub r3, r3, #1
b wait_2_1
end_wait_2_1:
sub r2, r2, #1
b wait_1_1
end_wait_1_1:

mov r1, #1         //Turn off 25 and turn on 14
lsl r1, #25
str r1, [r0, #40]  //Pin 25 OFF           

mov r1, #1
lsl r1, #14
str r1, [r0, #28]  //Pin 14 ON

ldr r2, =0x1000      //Can have 0x1000 stored into a register and half it 
wait_1_2:          //every time or something cool to make it harder
cmp r2, #0
blt end_wait_1_2
ldr r3, =0x1000
wait_2_2:
cmp r3, #0
blt end_wait_2_2
sub r3, r3, #1
b wait_2_2
end_wait_2_2:
sub r2, r2, #1
b wait_1_2
end_wait_1_2:

mov r1, #1         //Turn off 14 and turn on 15
lsl r1, #14
str r1, [r0, #40]  //Pin 14 OFF           

mov r1, #1
lsl r1, #15
str r1, [r0, #28]  //Pin 15 ON

ldr r2, =0x1000      //Can have 0x1000 stored into a register and half it 
wait_1_3:          //every time or something cool to make it harder
cmp r2, #0
blt end_wait_1_3
ldr r3, =0x1000
wait_2_3:
cmp r3, #0
blt end_wait_2_3
sub r3, r3, #1
b wait_2_3
end_wait_2_3:
sub r2, r2, #1
b wait_1_3
end_wait_1_3:

mov r1, #1         //Turn off 15 and turn on 18
lsl r1, #15
str r1, [r0, #40]  //Pin 15 OFF           

mov r1, #1
lsl r1, #18
str r1, [r0, #28]  //Pin 18 ON

ldr r2, =0x1000      //Can have 0x1000 stored into a register and half it 
wait_1_4:          //every time or something cool to make it harder
cmp r2, #0
blt end_wait_1_4
ldr r3, =0x1000
wait_2_4:
cmp r3, #0
blt end_wait_2_4
sub r3, r3, #1
b wait_2_4
end_wait_2_4:
sub r2, r2, #1
b wait_1_4
end_wait_1_4:

mov r1, #1         //Turn off 18 and turn on 23
lsl r1, #18
str r1, [r0, #40]  //Pin 18 OFF           

mov r1, #1
lsl r1, #23
str r1, [r0, #28]  //Pin 23 ON

ldr r2, =0x1000      //Can have 0x1000 stored into a register and half it 
wait_1_5:          //every time or something cool to make it harder
cmp r2, #0
blt end_wait_1_5
ldr r3, =0x1000
wait_2_5:
cmp r3, #0
blt end_wait_2_5
sub r3, r3, #1
b wait_2_5
end_wait_2_5:
sub r2, r2, #1
b wait_1_5
end_wait_1_5:

mov r1, #1         //Turn off 23 and turn on 24
lsl r1, #23
str r1, [r0, #40]  //Pin 23 OFF           

mov r1, #1
lsl r1, #24
str r1, [r0, #28]  //Pin 24 ON


ldr r2, =0x1000      //Can have 0x1000 stored into a register and half it 
wait_1_6:          //every time or something cool to make it harder
cmp r2, #0
blt end_wait_1_6
ldr r3, =0x1000
wait_2_6:
cmp r3, #0
blt end_wait_2_6
sub r3, r3, #1
b wait_2_6
end_wait_2_6:
sub r2, r2, #1
b wait_1_6
end_wait_1_6:

mov r1, #1         //Turn off 24 and turn on 25
lsl r1, #25
str r1, [r0, #40]  //Pin 24 OFF           

mov r1, #1
lsl r1, #14
str r1, [r0, #28]  //Pin 25 ON

b main_loop