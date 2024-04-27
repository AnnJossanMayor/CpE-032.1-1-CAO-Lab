.MODEL SMALL
.STACK 100h
.DATA
    byte1   db 1 
    byte2   db 0
    word1   dw 1234h 
    word2   dw 0
    string  db "Stressed!", 0dh, 0ah, "$"
    reversed_string db 11 dup ('$') ; Reserve space for reversed string
.CODE
MAIN PROC
    Mov ax, @data
    Mov ds, ax

    Mov dx, offset string
    Mov ah, 9
    Int 21h

    ; Reverse the string
    Mov si, offset string  ; SI points to the start of the original string
    Mov di, offset reversed_string + 9  ; DI points to the end of the reversed string
    Mov cx, 10  ; Number of characters to copy
reverse_loop:
    Mov al, [si]  ; Load a character from the original string
    Mov [di], al  ; Store it in the reversed string
    Inc si  ; Move SI to the next character in the original string
    Dec di  ; Move DI to the previous position in the reversed string
    Loop reverse_loop  ; Repeat for all characters

    ; Null-terminate the reversed string
    Mov byte ptr [di], '$'

    ; Display the reversed string
    Mov dx, offset reversed_string
    Mov ah, 9
    Int 21h

    Mov ax, 4c00h
    Int 21h
MAIN endp
End MAIN
