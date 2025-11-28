                                    .MODEL SMALL
.STACK 100H
.DATA

FIRSTINPUT   DB "                  1.STUDY OR *.Exit$"
FIRSTINPUT1  DB "                     STUDY",0Dh,0Ah
        DB "               Input Alphabet or Digit$",0Dh,0Ah

FOR     DB " for $"

Z1  DB "ZERO.$"
Z2  DB "ONE.$"
Z3  DB "TWO.$"
Z4  DB "THREE.$"
Z5  DB "FOUR.$"
Z6  DB "FIVE.$"
Z7  DB "SIX.$"
Z8  DB "SEVEN.$"
Z9  DB "EIGHT.$"
Z10 DB "NINE.$"

MSG db  "                      ASSEMBLY PROJECT",0Dh,0Ah
    db  "                      Children Learning App",0Dh,0Ah
    db  "               ==== Alphabets for pre-school ====",0Dh,0Ah
    db  "                   =====================",0Dh,0Ah
    db  "                   Press any key to start...",0Dh,0Ah
    db  "$"

a   db "Apple.$"
b   db "Ball.$"
c   db "Cat.$"
d   db "Dog.$"
e   db "Elephant.$"
f   db "Fox.$"
g   db "Guitar.$"
h   db "Hedgehog.$"
i_s db "Ice Cream.$"    ; 'i' register conflict
j   db "Jar.$"
k   db "Kite.$"
l   db "Lion.$"
m   db "Moon.$"
n   db "Nose.$"
o   db "Orange.$"
p   db "Panda.$"
q   db "Queen.$"
r_s db "Rabbit.$"      ; 'r' register conflict
s   db "Strawberry.$"
t   db "Tiger.$"
u   db "Umbrella.$"
v   db "Violin.$"
w   db "Watermelon.$"
x   db "Xylophone.$"
y   db "Yoyo.$"
z   db "Zebra.$"

TNX DB "                   ===o THANK YOU o===$"
INV DB "                         INVALID INPUT.$"
SPACE DB "                        $"
NEWLINE DB 0Dh,0Ah,'$'

; INCLUDE EMU macros
INCLUDE 'EMU8086.INC'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ; print header
    MOV AH,09H     ; dos prnt func
    LEA DX,MSG     ; point to the string
    INT 21H        

    ; read character and show on the screen
    MOV AH,01H
    INT 21H

TOP_LOOP:
    ; print new line 
    MOV AH,09H
    LEA DX,NEWLINE
    INT 21H

    ; print FIRSTINPUT  
    MOV AH,09H
    LEA DX,FIRSTINPUT
    INT 21H

    ; print space /s indentation
    MOV AH,09H
    LEA DX,NEWLINE
    INT 21H

    ; read char and store in BL reg
    MOV AH,01H
    INT 21H
    MOV BL,AL

    ; check if loop continue or exit 
    CMP BL,'1'
    JE OPP1       ; if BL == 1 go to OPP1
    CMP BL,'*'
    JE OP2        ; if BL == * go to OPP2
    JMP TOP_LOOP  ; else go to TOP_LOOP

; -----------------------------------------
OPP1:
    ; load & print INPUT
    MOV AH,09H
    LEA DX,FIRSTINPUT1
    INT 21H

OP1_LOOP:
    ; print SPACE
    MOV AH,09H
    LEA DX,NEWLINE
    INT 21H

    ; Read char store it in BL
    MOV AH,01H
    INT 21H
    MOV BL,AL
    
    ; if BL == * jump to OP2
    CMP BL,'*'  
    JE OP2

    ; if BL < : ASCII(58) jump to IS_NUMBER
    CMP BL,':'
    JL IS_NUMBER

    ; print FOR
    MOV AH,09H
    LEA DX,FOR
    INT 21H

    ; cases from A-Z if BL == 'letter' jump to it's label
    CMP BL,'A'
    JE C1
    CMP BL,'a'
    JE C1
    CMP BL,'B'
    JE C2
    CMP BL,'b'
    JE C2
    CMP BL,'C'
    JE C3
    CMP BL,'c'
    JE C3
    CMP BL,'D'
    JE C4
    CMP BL,'d'
    JE C4
    CMP BL,'E'
    JE C5
    CMP BL,'e'
    JE C5
    CMP BL,'F'
    JE C6
    CMP BL,'f'
    JE C6
    CMP BL,'G'
    JE C7
    CMP BL,'g'
    JE C7
    CMP BL,'H'
    JE C8
    CMP BL,'h'
    JE C8
    CMP BL,'I'
    JE C9
    CMP BL,'i'
    JE C9
    CMP BL,'J'
    JE C10
    CMP BL,'j'
    JE C10
    CMP BL,'K'
    JE C11
    CMP BL,'k'
    JE C11
    CMP BL,'L'
    JE C12
    CMP BL,'l'
    JE C12
    CMP BL,'M'
    JE C13
    CMP BL,'m'
    JE C13
    CMP BL,'N'
    JE C14
    CMP BL,'n'
    JE C14
    CMP BL,'O'
    JE C15
    CMP BL,'o'
    JE C15
    CMP BL,'P'
    JE C16
    CMP BL,'p'
    JE C16
    CMP BL,'Q'
    JE C17
    CMP BL,'q'
    JE C17
    CMP BL,'R'
    JE C18
    CMP BL,'r'
    JE C18
    CMP BL,'S'
    JE C19
    CMP BL,'s'
    JE C19
    CMP BL,'T'
    JE C20
    CMP BL,'t'
    JE C20
    CMP BL,'U'
    JE C21
    CMP BL,'u'
    JE C21
    CMP BL,'V'
    JE C22
    CMP BL,'v'
    JE C22
    CMP BL,'W'
    JE C23
    CMP BL,'w'
    JE C23
    CMP BL,'X'
    JE C24
    CMP BL,'x'
    JE C24
    CMP BL,'Y'
    JE C25
    CMP BL,'y'
    JE C25
    CMP BL,'Z'
    JE C26
    CMP BL,'z'
    JE C26

    ; else Invalid input
    MOV AH,09H
    LEA DX,INV
    INT 21H
    JMP OP1_LOOP

IS_NUMBER: 
    
    MOV AH,02H
    MOV DL,' '
    INT 21H

    CMP BL,'0'
    JE C27
    CMP BL,'1'
    JE C28
    CMP BL,'2'
    JE C29
    CMP BL,'3'
    JE C30
    CMP BL,'4'
    JE C31
    CMP BL,'5'
    JE C32
    CMP BL,'6'
    JE C33
    CMP BL,'7'
    JE C34
    CMP BL,'8'
    JE C35
    CMP BL,'9'
    JE C36

    ; Invalid Input
    MOV AH,09H
    LEA DX,INV
    INT 21H
    JMP OP1_LOOP

; call alphabet labels
C1:
    MOV AH,09H
    LEA DX,a
    INT 21H
    JMP OP1_LOOP
C2:
    MOV AH,09H
    LEA DX,b
    INT 21H
    JMP OP1_LOOP
C3:
    MOV AH,09H
    LEA DX,c
    INT 21H
    JMP OP1_LOOP
C4:
    MOV AH,09H
    LEA DX,d
    INT 21H
    JMP OP1_LOOP
C5:
    MOV AH,09H
    LEA DX,e
    INT 21H
    JMP OP1_LOOP
C6:
    MOV AH,09H
    LEA DX,f
    INT 21H
    JMP OP1_LOOP
C7:
    MOV AH,09H
    LEA DX,g
    INT 21H
    JMP OP1_LOOP
C8:
    MOV AH,09H
    LEA DX,h
    INT 21H
    JMP OP1_LOOP
C9:
    MOV AH,09H
    LEA DX,i_s
    INT 21H
    JMP OP1_LOOP
C10:
    MOV AH,09H
    LEA DX,j
    INT 21H
    JMP OP1_LOOP
C11:
    MOV AH,09H
    LEA DX,k
    INT 21H
    JMP OP1_LOOP
C12:
    MOV AH,09H
    LEA DX,l
    INT 21H
    JMP OP1_LOOP
C13:
    MOV AH,09H
    LEA DX,m
    INT 21H
    JMP OP1_LOOP
C14:
    MOV AH,09H
    LEA DX,n
    INT 21H
    JMP OP1_LOOP
C15:
    MOV AH,09H
    LEA DX,o
    INT 21H
    JMP OP1_LOOP
C16:
    MOV AH,09H
    LEA DX,p
    INT 21H
    JMP OP1_LOOP
C17:
    MOV AH,09H
    LEA DX,q
    INT 21H
    JMP OP1_LOOP
C18:
    MOV AH,09H
    LEA DX,r_s
    INT 21H
    JMP OP1_LOOP
C19:
    MOV AH,09H
    LEA DX,s
    INT 21H
    JMP OP1_LOOP
C20:
    MOV AH,09H
    LEA DX,t
    INT 21H
    JMP OP1_LOOP
C21:
    MOV AH,09H
    LEA DX,u
    INT 21H
    JMP OP1_LOOP
C22:
    MOV AH,09H
    LEA DX,v
    INT 21H
    JMP OP1_LOOP
C23:
    MOV AH,09H
    LEA DX,w
    INT 21H
    JMP OP1_LOOP
C24:
    MOV AH,09H
    LEA DX,x
    INT 21H
    JMP OP1_LOOP
C25:
    MOV AH,09H
    LEA DX,y
    INT 21H
    JMP OP1_LOOP
C26:
    MOV AH,09H
    LEA DX,z
    INT 21H
    JMP OP1_LOOP
C27:
    MOV AH,09H
    LEA DX,Z1
    INT 21H
    JMP OP1_LOOP
C28:
    MOV AH,09H
    LEA DX,Z2
    INT 21H
    JMP OP1_LOOP
C29:
    MOV AH,09H
    LEA DX,Z3
    INT 21H
    JMP OP1_LOOP
C30:
    MOV AH,09H
    LEA DX,Z4
    INT 21H
    JMP OP1_LOOP
C31:
    MOV AH,09H
    LEA DX,Z5
    INT 21H
    JMP OP1_LOOP
C32:
    MOV AH,09H
    LEA DX,Z6
    INT 21H
    JMP OP1_LOOP
C33:
    MOV AH,09H
    LEA DX,Z7
    INT 21H
    JMP OP1_LOOP
C34:
    MOV AH,09H
    LEA DX,Z8
    INT 21H
    JMP OP1_LOOP
C35:
    MOV AH,09H
    LEA DX,Z9
    INT 21H
    JMP OP1_LOOP
C36:
    MOV AH,09H
    LEA DX,Z10
    INT 21H
    JMP OP1_LOOP

; Print Thanks
OP2:
    MOV AH,09H
    LEA DX,TNX
    INT 21H
    
    ; close the program
    MOV AH,4Ch
    INT 21H

MAIN ENDP
END MAIN
