page 60,800
.model small
.stack 128
.data
tablo db 10, 20, 30, 40, 50
tablo2 db 8, "AHMETLER"
.code
ana proc far
    cld  
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; asagidakiler mlsbsay icin    
    mov ax, 31  
    mov [0A40Eh], 10000001b
    mov [0A410h], 10000001b    
    
    call ekleme  
 
    ; programdan cikis                
    mov al, [0E004h]
    mov ah, 4ch
    int 21h
endp

mlsbsay proc near
    mov cx, 10
    mov dx, 0
    mov bx, 0A40Eh
    
dongu:
    test [bx], 10000001b
    jz devam
    inc dx
devam:
    inc bx
    loop dongu
    
    mov [0E004h], dx
    ret
    
endp   

ekleme proc near
    mov al, "O"     
    mov cl, tablo2  
    push
    lea di, tablo2+1
    
    repne scasb
    je cikis
    mov [di], al
cikis:
    ret
endp
    
end ana

