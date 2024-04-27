.MODEL SMALL
.STACK 100h
.DATA
    MSG1     DB 13,10,'Hello, What''s your name? $'
    MSG2     DB 13,10,'Hello, $', 13,10, 'Congratulations! Your first program is working! $'
    USERNAME DB 31 DUP ('$') ; Maximum length of the username is 30 characters
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Prompt the user to enter their name
    MOV AH, 09h
    MOV DX, OFFSET MSG1
    INT 21h

    ; Read the user's name
    MOV AH, 0Ah
    MOV DX, OFFSET USERNAME
    INT 21h

    ; Display the personalized message
    MOV AH, 09h
    MOV DX, OFFSET MSG2
    INT 21h

    ; Display the user's name
    MOV DX, OFFSET USERNAME + 2 ; Point DX to the beginning of the username
    MOV AH, 09h                 ; DOS function to display a string
    INT 21h

    MOV AX, 4C00h
    INT 21h
MAIN ENDP
END MAIN
