.model small
.stack 100h
.data
 n dw 1
 result db 10,13, 'result :$' 
.code

main proc
    mov ax,@data
    mov ds,ax
     
    mov ah,1
    int 21h 
    sub al,48  
     
    mov cx, 0
    mov cl,al
    mov bx,0
    
sum:
    add bx,n
    inc n
    loop sum 
     
     
    
    
    mov ah,9
    lea dx,result
    int 21h
    
    
    add bx,48    
    mov ah,2
    mov dx,bx
    int 21h
    
       
       
    mov ah, 4ch
    int 21h
    main endp
end main