title array_carp.asm
.model small
.stack 100h
.data
    valueB DW 1000, 2, 3, -1, -2, -3
    valueD DW 1000, 5, 4, 3, 2, 1
    result DW 12 DUP(?)
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
    mov ax, [si]
    imul word ptr [bx]
    mov [di], ax
    mov [di+2], dx
    
    add di, 4
    add si, 2
    add bx, 2
    
    loop total
    
finish:
    mov ah, 0x4c
    int 0x20 
ana endp
end ana