 .model small
 .stack 200h
 .data
   
   a_input db 'enter  A : $'
   b_input db 'enter  B : $'
   c_input db 'enter  C : $'
   
   a db 'A is smallest $'
   b db 'B is smallest $'
   c db 'C is smallest $'
   
   
   ab db 'AB is smaller $'
   bc db 'BC is smaller $'
   ac db 'AC is smaller $'
   abc db 'ALL of them are equal $'
   
 .code
 
 main proc    
    mov ax, @data
    mov ds, ax
    
         
      
    mov ah, 9 
    lea dx, a_input
    int 21h
    
    mov ah,1
    int 21h
    mov bl, al
    
    
    
    ;new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
      
    
    mov ah, 9 
    lea dx, b_input
    int 21h 
    
    mov ah,1
    int 21h
    mov bh, al 
    
           
    ;new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
      
           
    
    mov ah, 9 
    lea dx, c_input
    int 21h
    
    mov ah,1
    int 21h
    mov cl, al  
    
    
    ;new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
          
    
    
    ;a com b
    cmp bl, bh
        jg com_b
        jl com_c
        je equal
    
    
    
    com_b:
        ;b com c
        cmp bh,cl
        jg  c_is_small
        jl  b_is_small
        je  bc_small
    
    
    com_c:
        ; a com c
        cmp bl,cl
        jg  c_is_small
        jl  a_is_small
        je  ac_small
    
    
    equal:
        cmp bl,cl
        jg c_is_small
        jl ab_small
        je abc_equal    

    
    a_is_small:
        mov ah, 9
        lea dx, a
        int 21h
        jmp exit  
        
    b_is_small:
        mov ah, 9
        lea dx, b
        int 21h
        jmp exit
        
        
    c_is_small:
        mov ah,9
        lea dx,c
        int 21h
        jmp exit
        
    bc_small :   
        mov ah,9
        lea dx,bc
        int 21h
        jmp exit
    
    
    ac_small :     
        mov ah,9
        lea dx,ac
        int 21h
        jmp exit 
        
        
    ab_small: 
        mov ah,9
        lea dx,ab
        int 21h
        jmp exit 
        
    abc_equal:
        mov ah, 9
        lea dx, abc
        int 21h
        jmp exit
        
             
               
    exit:
    mov ah, 4ch
    int 21h
    main endp
 end main
    








