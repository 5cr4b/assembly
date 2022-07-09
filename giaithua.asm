.model small 
.stack 100h 
.data   
    muoi dw 10
    tb1 db "Nhap n:  $"  
    tb2 db " ket qua la:  $" 
    enter  db 10,13,"$"    
.code

main proc
    mov ax,@data ;import data
    mov ds,ax
      
    lea dx,tb1 ; in chuoi tb1
    mov ah,9
    int 21h
                 
    mov ah,1     ; ngat 1 , nhap vao 1 ky tu
    int 21h   
      
     
    
    sub al,"0"   ; chuyen ky tu -> so , vd '5' -> 5
    mov cx,0     ; cx =0
    mov cl,al    ; cl = n ; 
    
    lea dx,tb2 ; in chuoi tb2
    mov ah,9
    int 21h
    
    mov ax,1     ; ax= kq 
    mov bx,1     ; bx = bien tang 
    
    
    
giaithua:
    mul bx        ; ax = ax x bx
    inc bx        ; bx += 1
    cmp bx,cx     ; cx == cx ?
    jle giaithua  ; if bx <= cx -> giaithua
    
mov cx,0           ;cx = 0 

pushloop: 
    mov dx,0       ;dx = 0
    div muoi       ;ax = ax / 10 , dx = ax % 10
    add dx,'0'     ; 5 -> '5'
    push dx        ; push vao stack
    inc cx         ; cx += 1
    cmp ax,0       ; ax == 0 ?
    jne pushloop   ; if ax != 0 -> pushloop

hienthi:
    pop dx         ; lay ket qua tu stack
    mov ah,2       ; ngat 2 , in ky tu
    int 21h 
    loop hienthi
    
mov ah,4ch
int 21h

end main
    
