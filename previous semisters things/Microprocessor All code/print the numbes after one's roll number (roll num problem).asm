.model small
.stack 100h
.data
.code
main proc 
    mov cx, 9      
           
    mov dl, 49      

    print:
        cmp dl, '6'     
        jle skip
        mov ah, 2 
        int 21h         
    
    skip:
        inc dl         
        loop print 

      
    mov ah, 4ch    
    int 21h        
    
main endp
end main