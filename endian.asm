; multi-segment executable file template.

data segment
    ; add your data here!
    bigEndian DB 12h, 34h, 56h, 78h
    littleEndian DB 0
ends
code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    lea si, [bigEndian+3]
    lea di, [littleEndian]
    mov cx, 4
    
reverse:
    mov ax, [si]
    mov [di], ax
    dec si
    inc di
    loop reverse    
          
finish:
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
