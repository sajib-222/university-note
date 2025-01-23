.model small 
.data
str1 db "Enter first number: $"
str2 db 13,10,"Enter second number: $"
str3 db 13,10,"Sum : $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    
    mov ah,9
    lea dx,str1
    int 21h 
    
    mov ah,1
    int 21h
    mov bl,al 
    
    
    mov ah,9 
    lea dx,str2
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al 
    
    sub bh,48
    sub bl,48
    
    
    mov ah,9
    lea dx,str3
    int 21h
       
    add bh,bl
    add bh,48 
    
    mov ah,2
    mov dl,bh
    int 21h 
    
    
    mov ah,4Ch
    int 21h
    main endp
end main