 .model small
 .stack 200h
 .data
   
   a db 'enter a capital leter alphbet : $'
   b db 10,13, 'smaller leter alphbet : $'
   
 .code
 
 main proc    
    mov ax, @data
    mov ds, ax       
      
    mov ah, 9 
    lea dx, a
    int 21h
    
    mov ah,1
    int 21h
    mov bl, al 
    
    add bl,32
    mov bh,bl
    
    mov ah, 9 
    lea dx, b
    int 21h 
    
    mov ah,2 
    mov dl,bh
    int 21h 
     
    mov ah, 4ch
    int 21h
    main endp
 end main
    








