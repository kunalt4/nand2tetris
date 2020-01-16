// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// num1=r0
// num2=r1
// i=0
// r2=0

// LOOP:
// if i==num2 goto end
// r2 = r2 + num1
// i++
// goto loop
// END
// goto END

@R0
D=M
@num1
M=D //num1 = r0

@R1
D=M
@num2
M=D //num2 = r1

@i
M=0 //i=0

@R2
M=0 //R2=0

(LOOP)
    @i
    D=M
    @num2
    D=D-M
    @END
    D;JEQ   //if i == num2 goto end

    @num1
    D=M
    @R2
    M=D+M   // r2 = r2 + num1

    @i
    M=M+1   // i++

    @LOOP
    0;JMP   // goto loop

(END)
    @END
    0;JMP   //goto END

