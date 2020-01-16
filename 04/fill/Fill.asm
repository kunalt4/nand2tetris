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



@index
M=0                 //index = 0

@8192
D=A
@n
M=D                 //n=8192

@SCREEN
D=A
@addr
M=D                 //addr=screen

(LOOP)

    @index
    D=M
    @n
    D=D-M

    @CLEAR_INDEX
    D;JEQ           //if index == n, clear index and addr=screen

    @KBD
    D=M
    
    @WHITE
    D;JEQ           //goto white if kbd=0

    @BLACK
    D;JNE           //goto black if kbd!=0

(WHITE)

    @addr
    A=M
    M=0             //set ram[addr]=0

    @addr
    M=M+1           //addr = addr + 1

    @index
    M=M+1           //index = index + 1

    @LOOP
    0;JMP           //loop back

    

(BLACK)

    @addr
    A=M
    M=-1            //set ram[addr]=-1

    @addr
    M=M+1           //addr = addr + 1

    @index
    M=M+1           //index = index + 1

    @LOOP
    0;JMP           //loop back

(CLEAR_INDEX)
   
    @index
    M=0             //set index=0

    @SCREEN
    D=A
    @addr
    M=D             //set addr = screen

    @LOOP
    0;JMP           //loop back

   

    