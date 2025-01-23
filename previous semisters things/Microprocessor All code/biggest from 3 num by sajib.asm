.model small
.stack 100h
.data
a db 10,13, 'a greatest $'
b db 10,13, 'b greatest $'
c db 10,13, 'c greatest $'
d db 10,13, 'all equal  $' 

a_input db 10,13, 'enter a : $'
b_input db 10,13, 'enter b : $'
c_input db 10,13, 'enter c : $'
.code

main proc 
     mov ax,@data
     mov ds,ax
     
     mov ah,9
     lea dx,a_input
     int 21h
     
     mov ah,1
     int 21h
     mov bl,al
     
     mov ah,9
     lea dx,b_input
     int 21h
     
     mov ah,1
     int 21h
     mov bh,al
     
     mov ah,9
     lea dx,c_input
     int 21h
     
     mov ah,1
     int 21h
     mov cl,al
     
     cmp bl,bh
     
     jg cmp_a_with_c
     jl cmp_b_with_c
     je all_equal 
     cmp_a_with_c:
     cmp bl,cl
     jg a_small
     jl c_small
     je all_equal
      cmp_b_with_c:
     cmp bh,cl
     jg b_small
     jl c_small
     je all_equal
     
     a_small:
      mov ah,9
     lea dx,a
     int 21h
     jmp exit
     
 b_small:
    mov ah,9
     lea dx,b
     int 21h
     jmp exit
     
     c_small:
      mov ah,9
     lea dx,c
     int 21h
     jmp exit
     
     all_equal:
      mov ah,9
     lea dx,d
     int 21h 
   
     jmp exit
     
   
   
     exit:
   mov ah,4ch
    int 21h
    
    main endp
end main

