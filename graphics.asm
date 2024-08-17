; graphics.asm
.model small
.code

public set_graphic_mode
public set_text_mode
public draw_pixel
public draw_rectangle

; Процедура для встановлення графічного режиму
; Вхід: AL - номер режиму (0 - CGA, 1 - EGA)
set_graphic_mode proc
    push ax
    push bx
    
    cmp al, 0
    je set_cga
    cmp al, 1
    je set_ega
    
    ; Якщо невідомий режим, встановлюємо EGA за замовчуванням
set_ega:
    mov ax, 0010h  ; EGA режим (640x350, 16 кольорів)
    jmp set_mode
    
set_cga:
    mov ax, 0006h  ; CGA режим (640x200, 2 кольори)
    
set_mode:
    int 10h
    pop bx
    pop ax
    ret
set_graphic_mode endp

; Процедура для повернення в текстовий режим
set_text_mode proc
    push ax
    mov ax, 0003h  ; Стандартний текстовий режим
    int 10h
    pop ax
    ret
set_text_mode endp

; Процедура для малювання пікселя
; Вхід: AX - колір (для 16-bit режиму), CX - X координата, DX - Y координата
draw_pixel proc
    push ax
    push bx
    push cx
    push dx
    push es
    
    ; Для CGA та EGA
    mov ah, 0Ch
    int 10h

    pop es
    pop dx
    pop cx
    pop bx
    pop ax
    ret
draw_pixel endp

; Процедура для малювання прямокутника
; Вхід: AX - колір, CX - початкова X координата, DX - початкова Y координата
;       BX - ширина, SI - висота
draw_rectangle proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    mov di, cx  ; Зберігаємо початкову X координату
    add bx, cx  ; BX тепер містить кінцеву X координату
    add si, dx  ; SI тепер містить кінцеву Y координату

draw_rect_loop:
    push cx
draw_rect_line:
    call draw_pixel
    inc cx
    cmp cx, bx
    jl draw_rect_line
    pop cx
    inc dx
    cmp dx, si
    jl draw_rect_loop

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
draw_rectangle endp

end