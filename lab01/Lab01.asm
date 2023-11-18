ORG 100H

   
MOV CL, N    ;LOOP COUNTER IS N
MOV CH, 0  
MOV DI, 2000H   
MOV DS, DI    
MOV DL, 01H 
MOV AX, 0      

; CONSTRUCT A LOOP FOR N TIMES

MYLOOP:

MOV [DI], DL
ADD AL, DL
INC DL
INC DI 

LOOP MYLOOP 
MOV [DI], AL
 
RET
N DB  255
   
 
                         