.model small 
.data
str1 db "Enter first number: $"
str2 db 13,10,"Enter second number: $"
e db 13,10,"both of them are ecqual  $"
str3 db 13,10,"biggest : $" 

num db ?

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
    
    mov num,bl
    
    cmp bh,bl
    
    je equal
    jg num1
    jl num2
    
    
    equal:
        mov ah,9
        lea dx,e
        int 21h
        jmp end
   
      
      
      
    num1:
        mov ah,9
        lea dx,str3
        int 21h
        mov ah,2
        mov dl,bh
        int 21h
        jmp end 
        
        
   
    num2:
        mov ah,9
        lea dx,str3
        int 21h 
        mov ah,2
        mov dl,bl 
        int 21h 
        jmp end 
       
    
    end:
    mov ah,4Ch
    int 21h
    main endp
end main