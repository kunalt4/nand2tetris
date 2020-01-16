// for (i=0; i<n; i++){
//     draw 16 black pixels at beginning of row i
// }

// addr = SCREEN
// n = RAM[0]
// i = 0

// LOOP:
//     if i > n goto END
//     RAM [addr] = -1      //1111111111111111
//     //advance to next row
//     addr = addr + 32     //32 words in one row 32*16=512 pixels 
//     i=i+1
//     goto LOOP
// END:
//     goto END


@SCREEN
D=A
@addr
M=D // addr = SCREEN


@0
D=M
@n
M=D // n = RAM[0]

@i
M=0 // i = 0

(LOOP)
    @i
    D=M
    @n
    D=D-M
    @END
    D;JGT   // if i > n goto END

    @addr
    A=M
    M=-1    //     RAM [addr] = -1      //1111111111111111

    @i
    M=M+1   //     i=i+1

    @32
    D=A
    @addr
    M=M+D   //     addr = addr + 32     //32 words in one row 32*16=512 pixels 

    @LOOP
    0;JMP   //     goto LOOP

(END)
    @END
    0;JMP   //     goto END
