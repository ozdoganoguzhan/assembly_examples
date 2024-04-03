.model small
.stack 128
.data
fibo DW 0, 1, 18 DUP(?)

.code
ana proc far
    mov ax, @DATA
    mov ds, ax
    mov di, 4
    mov ax, 0
    mov bx, 1 
    mov cx, 18; first 20 fibo num
    
fibolp:
    push bx
    add bx, ax
    pop ax
    mov fibo[di], bx
    add di, 2
    loop fibolp
    
    mov ah, 4ch
    int 21h
ana endp
end ana
    
    