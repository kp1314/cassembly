ldr r0, =0x20200000 ;)THIS ONE NOW HAS COMMENTS


mov r2, #1
lsl r2, #12

mov r3, #1
lsl r3, #15

mov r4, #1
lsl r4, #24

mov r5, #0
add r5, r5, r2
add r5, r5, r3
add r5, r5, r4

str r5, [r0, #4]


mov r2, #1
lsl r2, #9

mov r3, #1
lsl r3, #12

mov r4, #1
lsl r4, #15

mov r5, #0
add r5, r5, r2
add r5, r5, r3
add r5, r5, r4

str r5, [r0, #8]


mov r1, #1
lsl r1, #14
str r1, [r0, #40]

mov r1, #1
lsl r1, #15
str r1, [r0, #40]  

mov r1, #1
lsl r1, #18
str r1, [r0, #40]  

mov r1, #1
lsl r1, #23
str r1, [r0, #40]  

mov r1, #1
lsl r1, #24
str r1, [r0, #40]  

mov r1, #1
lsl r1, #25
str r1, [r0, #40]  


main_loop:

ldr r2, =0x500      
wait_1_1:          
cmp r2, #0
blt end_wait_1_1
ldr r3, =0x500
wait_2_1:
cmp r3, #0
blt end_wait_2_1
sub r3, r3, #1
b wait_2_1
end_wait_2_1:
sub r2, r2, #1
b wait_1_1
end_wait_1_1:

mov r1, #1         
lsl r1, #25
str r1, [r0, #40]  

mov r1, #1
lsl r1, #14
str r1, [r0, #28]  

ldr r2, =0x500      
wait_1_2:          
cmp r2, #0
blt end_wait_1_2
ldr r3, =0x500
wait_2_2:
cmp r3, #0
blt end_wait_2_2
sub r3, r3, #1
b wait_2_2
end_wait_2_2:
sub r2, r2, #1
b wait_1_2
end_wait_1_2:

mov r1, #1         
lsl r1, #14
str r1, [r0, #40] 

mov r1, #1
lsl r1, #15
str r1, [r0, #28]  

ldr r2, =0x500      
wait_1_3:          
cmp r2, #0
blt end_wait_1_3
ldr r3, =0x500
wait_2_3:
cmp r3, #0
blt end_wait_2_3
sub r3, r3, #1
b wait_2_3
end_wait_2_3:
sub r2, r2, #1
b wait_1_3
end_wait_1_3:

mov r1, #1         
lsl r1, #15
str r1, [r0, #40]  

mov r1, #1
lsl r1, #18
str r1, [r0, #28] 

ldr r2, =0x500    
wait_1_4: 
cmp r2, #0
blt end_wait_1_4
ldr r3, =0x500
wait_2_4:
cmp r3, #0
blt end_wait_2_4
sub r3, r3, #1
b wait_2_4
end_wait_2_4:
sub r2, r2, #1
b wait_1_4
end_wait_1_4:

mov r1, #1    
lsl r1, #18
str r1, [r0, #40] 

mov r1, #1
lsl r1, #23
str r1, [r0, #28] 

ldr r2, =0x500    
wait_1_5:     
cmp r2, #0
blt end_wait_1_5
ldr r3, =0x500
wait_2_5:
cmp r3, #0
blt end_wait_2_5
sub r3, r3, #1
b wait_2_5
end_wait_2_5:
sub r2, r2, #1
b wait_1_5
end_wait_1_5:

mov r1, #1    f
lsl r1, #23
str r1, [r0, #40]

mov r1, #1
lsl r1, #24
str r1, [r0, #28]

ldr r2, =0x500  
wait_1_6:    
cmp r2, #0
blt end_wait_1_6
ldr r3, =0x500
wait_2_6:
cmp r3, #0
blt end_wait_2_6
sub r3, r3, #1
b wait_2_6
end_wait_2_6:
sub r2, r2, #1
b wait_1_6
end_wait_1_6:

mov r1, #1       
lsl r1, #24
str r1, [r0, #40] 

mov r1, #1
lsl r1, #25
str r1, [r0, #28] 


ldr r2, =0x500      
wait_1_7:          
cmp r2, #0
blt end_wait_1_7
ldr r3, =0x500
wait_2_7:
cmp r3, #0
blt end_wait_2_7
sub r3, r3, #1
b wait_2_7
end_wait_2_7:
sub r2, r2, #1
b wait_1_7
end_wait_1_7:

b main_loop
