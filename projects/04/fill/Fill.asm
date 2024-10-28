// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
@8192
D=A
@n
M=D // RAM[n]=50

(LOOP2)
    @j
    M=0 // RAM[j] = 0
    @SCREEN
    D=A // D=address of SCREEN
    @addr
    M=D // RAM[addr] = address of SCREEN
    (LOOP1)
        @n
        D=M
        @j
        D=M-D
        @LOOP3
        D;JEQ

        @addr
        A=M // A=RAM[addr]
        M=0 // RAM[A] = 0

        @j
        M=M+1
        @1
        D=A
        @addr
        M=M+D
        @LOOP1
        0;JMP
    (LOOP3)
        @KBD
        D=M
        @LOOP3
        D;JEQ

    @i
    M=0 // RAM[i] = 0
@SCREEN
D=A // D=address of SCREEN
@addr
M=D // RAM[addr] = address of SCREEN
(LOOP)
    @n
    D=M
    @i
    D=M-D
    @LOOP2
    D;JEQ

    @addr
    A=M // A=RAM[addr]
    M=-1 // RAM[A] = -1

    @i
    M=M+1
    @1
    D=A
    @addr
    M=M+D
    @LOOP
    0;JMP