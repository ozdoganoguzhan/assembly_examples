title array_topla.asm
.model small
.stack 100h
.data
    valueB DB 1, 2, 3, -1, -2, -3
    valueD DB 6, 5, 4, 3, 2, 1
    result DB 6 DUP(?)
.code       
ana proc far
start:
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    lea si, valueB
    lea bx, valueD
    lea di, result
    
    mov cx, 6

total:
    mov al, [si]
    add al, [bx]
    mov [di], al
    
    add di, 1
    inc si
    add bx, 1
    
    loop total
    
finish:
    mov ah, 04ch
    int 020h
ana endp
end ana