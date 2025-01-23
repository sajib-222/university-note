.data
.model small
.stack 100h
msg1 db 'I am a student $'

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h 
    
    exit:
    
    
    mov ah ,4ch
    int 21h
    main endp
    end main




