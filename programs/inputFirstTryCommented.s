ldr r0, =0x20200000    ;)Set up 'base', offsets will be added to this

mov r2, #1             
lsl r2, #12            ;)r2 will be used to turn pin 14 into an output

mov r3, #1
lsl r3, #15            ;)r3 will be used to turn pin 15 into an output

mov r4, #1
lsl r4, #24            ;)r4 will be used to turn pin 18 into an output

mov r5, #0
add r5, r5, r2
add r5, r5, r3         ;)Add r2, r3 and r4 together to be able to simulatneously
add r5, r5, r4         ;)turn pins 14, 15 and 18 into an output
                       
str r5, [r0, #4]       ;)Actually turn these pins into an output

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

str r5, [r0, #8]       ;)Same as above section, but for pins 23, 24 and 25

mov r1, #1
lsl r1, #14
str r1, [r0, #40]      ;)Clear pin 14

mov r1, #1
lsl r1, #15
str r1, [r0, #40]      ;)Clear pin 15

mov r1, #1
lsl r1, #18
str r1, [r0, #40]      ;)Clear pin 18

mov r1, #1
lsl r1, #23
str r1, [r0, #40]      ;)Clear pin 23

mov r1, #1
lsl r1, #24
str r1, [r0, #40]      ;)Clear pin 24

mov r1, #1
lsl r1, #25
str r1, [r0, #40]      ;)Clear pin 25

;)WANT PULL DOWN, SO OFF/UNPRESSED IS 0 (LOW) AND ON/PRESSED IS HIGH (1)
;)SWITCH WIRED TO VOLTAGE (+) AND 

;)gpio.SETUP(pin 17, input, pull down)
;)if(GPIO.input(pin 17) != 0) { PRESSED! }

;)Set last 2 bits of Pull Up/Down Enable to 01, and leave the rest of them the same

ldr r6, =0xFFFFFFFC    ;)~3, could also subract 3 from FFFFFFFF
ldr r7, [r0, #148]     ;)148 is offset to PULL UP/DOWN ENABLE
and r7, r7, r6         ;)And these contents we put in r7 with the negation of 3
orr r7, r7, #1         ;)Or with 1 (1 is pull down), so last 2 bits go to 01
str r7, [r0, #148]     ;)Put this back in the PULL UP/DOWN ENABLE register

ldr r2, =0x200         ;)Waits while it does (0x200)^2 decrements by 1
wait_1_8:          
cmp r2, #0
blt end_wait_1_8
ldr r3, =0x200
wait_2_8:
cmp r3, #0
blt end_wait_2_8
sub r3, r3, #1
b wait_2_8
end_wait_2_8:
sub r2, r2, #1
b wait_1_8
end_wait_1_8:

mov r1, #1
lsl r1, #17
str r1, [r0, #152]     ;)Set bit 17 in PULL UP/DOWN ENABLE CLOCK 0 to 1

ldr r2, =0x200         ;)Waits while it does (0x500)^2 decrements by 1
wait_1_9:          
cmp r2, #0
blt end_wait_1_9
ldr r3, =0x200
wait_2_9:
cmp r3, #0
blt end_wait_2_9
sub r3, r3, #1
b wait_2_9
end_wait_2_9:
sub r2, r2, #1
b wait_1_9
end_wait_1_9:

ldr r6, =0xFFFFFFFC    ;)~3, could also subract 3 from FFFFFFFF
ldr r7, [r0, #148]     ;)148 is offset to PULL UP/DOWN ENABLE
and r7, r7, r6         ;)And these contents we put in r7 with the negation of 3
str r7, [r0, #148]     ;)Resets last 2 bits of PULL UP/DOWN ENABLE register

mov r1, #0
str r1, [r0, #152]     ;)Reset PULL UP/DOWN ENABLE CLOCK 0 to 0

ldr r6, =0xFF1FFFFF    ;)0xFF1FFFFF = ~(7<<21), mask to preserve all bits except pin 17 bits
ldr r7, [r0, #4]       ;)Control bits for 10 - 19
and r7, r7, r6         ;)Only sets pin 17 control bits to 0 (INPUT)
str r7, [r0, #4]       ;)Store this back in function select registers

main_loop:             ;)This loop will go on forever (Rest of code is in this loop)

ldr r2, =0x500         ;)Waits while it does (0x500)^2 decrements by 1
wait_1_1:          
cmp r2, #0
blt end_wait_1_1
ldr r3, =0x500
wait_2_1:

;)TRYING TO CHECK IF INPUT HAS BEEN PRESSED
ldr r2, [r0, #52]
mov r1, #1
lsl r1, #17
and r2, r2, r1
cmp r2, #0
bne pressed 

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
str r1, [r0, #40]      ;)Clear pin 25

mov r1, #1
lsl r1, #14
str r1, [r0, #28]      ;)Turns pin 14 on

ldr r2, =0x500      
wait_1_2:          
cmp r2, #0
blt end_wait_1_2
ldr r3, =0x500
wait_2_2:

;)TRYING TO CHECK IF INPUT HAS BEEN PRESSED
ldr r2, [r0, #52]
mov r1, #1
lsl r1, #17
and r2, r2, r1
cmp r2, #0
bne pressed

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

;)TRYING TO CHECK IF INPUT HAS BEEN PRESSED
ldr r2, [r0, #52]
mov r1, #1
lsl r1, #17
and r2, r2, r1
cmp r2, #0
bne pressed

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

;)TRYING TO CHECK IF INPUT HAS BEEN PRESSED
ldr r2, [r0, #52]
mov r1, #1
lsl r1, #17
and r2, r2, r1
cmp r2, #0
bne pressed

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

;)TRYING TO CHECK IF INPUT HAS BEEN PRESSED
ldr r2, [r0, #52]
mov r1, #1
lsl r1, #17
and r2, r2, r1
cmp r2, #0
bne pressed

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

;)TRYING TO CHECK IF INPUT HAS BEEN PRESSED
ldr r2, [r0, #52]
mov r1, #1
lsl r1, #17
and r2, r2, r1
cmp r2, #0
bne pressed

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

ldr r2, =0x500         ;)PROBABLY SHOULD NOT HAVE THIS, as we wait at start of main_loop
wait_1_7:          
cmp r2, #0
blt end_wait_1_7
ldr r3, =0x500
wait_2_7:

;)TRYING TO CHECK IF INPUT HAS BEEN PRESSED
ldr r2, [r0, #52]
mov r1, #1
lsl r1, #17
and r2, r2, r1
cmp r2, #0
bne pressed

cmp r3, #0
blt end_wait_2_7
sub r3, r3, #1
b wait_2_7
end_wait_2_7:
sub r2, r2, #1
b wait_1_7
end_wait_1_7:

b main_loop

pressed:

ldr r2, =0x2000         ;)Waits while it does (0x200)^2 decrements by 1
wait_1_8:          
cmp r2, #0
blt end_wait_1_8
ldr r3, =0x2000
wait_2_8:
cmp r3, #0
blt end_wait_2_8
sub r3, r3, #1
b wait_2_8
end_wait_2_8:
sub r2, r2, #1
b wait_1_8
end_wait_1_8:

b main_loop:
