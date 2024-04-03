title string_islemine_donustur.asm
.model small
.data
    DIZIN DB 'ELEKTRONIK'
    BOS DB 10 DUP('*')
.code
alat proc far
    cld
    mov ax, @data
    mov ds, ax
    mov es, ax
                   
    std
    lea si, DIZIN+9     ; Source index points to the start of DIZIN
    lea di, BOS       ; Destination index points to the start of BOS
    mov cx, 10        ; Set the loop count to the length of the string including null terminator

dongu:
    std
    lodsb
    cld         ; Load byte from [DS:SI] into AL and decrement SI
    stosb             ; Store AL into [ES:DI] and increment DI
    loop dongu        ; Repeat for CX times, decrementing CX each time

    mov ah, 4Ch       ; Exit program
    int 21h
    
alat endp
end alat