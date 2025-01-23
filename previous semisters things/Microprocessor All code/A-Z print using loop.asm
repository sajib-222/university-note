.model small
.stack 100h
.data
.code
main proc
     
     mov cx,26
     mov dl,97
     
     lv:
         mov ah,2
         int 21h 
         inc dl
         loop lv
         
         
         
  
    mov ah,4ch
    int 21h
    
    main endp
end main
