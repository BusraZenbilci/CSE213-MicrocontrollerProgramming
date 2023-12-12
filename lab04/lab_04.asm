
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

CMP N,14
JB MES
CMP N,26
JA MES 
MOV SI,1
MOV ARRAY[0],0
INC SI
MOV ARRAY[1],1 
SUB N,2
MOV CH,0
MOV CL,N

LOOP1:
INC SI 
MOV BL,2   
MOV AX,SI 
MOV DH, ARRAY[SI-2]
MOV DL, ARRAY[SI-3]
DIV BL
CMP AH,0
JE EVEN
JMP ODD

EVEN:
ADD DH, DL
MOV ARRAY[SI-1], DH 
JMP LOOPEND 

ODD: 
SUB DH, DL
MOV ARRAY[SI-1], DH
LOOP LOOP1 
   
LOOPEND:
LOOP LOOP1


ret
MES:
LEA SI, MESSAGE
MOV CX, 38
MOV AH, 0Eh
GO:     LODSB
INT 10h
LOOP GO
N DB 15
ARRAY DB N DUP<0>
MESSAGE DB 'Please enter a value between 14 and 26', 0

