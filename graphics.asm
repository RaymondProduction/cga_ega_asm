.model small
.data

    ; Дані для шрифтів (графічне представлення символів)
              font_data label byte
.data

    ; Дані для шрифтів (графічне представлення символів)
    font_data label byte

    ; A
    db 00011000b
    db 00100100b
    db 01000010b
    db 01111110b
    db 01000010b
    db 01000010b
    db 01000010b
    db 00000000b

    ; B
    db 01111100b
    db 01000010b
    db 01000010b
    db 01111100b
    db 01000010b
    db 01000010b
    db 01111100b
    db 00000000b

    ; C
    db 00111100b
    db 01000010b
    db 01000000b
    db 01000000b
    db 01000000b
    db 01000010b
    db 00111100b
    db 00000000b

    ; D
    db 01111000b
    db 01000100b
    db 01000010b
    db 01000010b
    db 01000010b
    db 01000100b
    db 01111000b
    db 00000000b

    ; E
    db 01111110b
    db 01000000b
    db 01000000b
    db 01111100b
    db 01000000b
    db 01000000b
    db 01111110b
    db 00000000b

    ; F
    db 01111110b
    db 01000000b
    db 01000000b
    db 01111100b
    db 01000000b
    db 01000000b
    db 01000000b
    db 00000000b

    ; G
    db 00111100b
    db 01000010b
    db 01000000b
    db 01001110b
    db 01000010b
    db 01000010b
    db 00111100b
    db 00000000b

    ; H
    db 01000010b
    db 01000010b
    db 01000010b
    db 01111110b
    db 01000010b
    db 01000010b
    db 01000010b
    db 00000000b

    ; I
    db 00111100b
    db 00001000b
    db 00001000b
    db 00001000b
    db 00001000b
    db 00001000b
    db 00111100b
    db 00000000b

    ; J
    db 00011110b
    db 00000100b
    db 00000100b
    db 00000100b
    db 00000100b
    db 01000100b
    db 00111000b
    db 00000000b

    ; K
    db 01000100b
    db 01001000b
    db 01010000b
    db 01100000b
    db 01010000b
    db 01001000b
    db 01000100b
    db 00000000b

    ; L
    db 01000000b
    db 01000000b
    db 01000000b
    db 01000000b
    db 01000000b
    db 01000000b
    db 01111110b
    db 00000000b

    ; M
    db 01000010b
    db 01100110b
    db 01011010b
    db 01000010b
    db 01000010b
    db 01000010b
    db 01000010b
    db 00000000b

    ; N
    db 01000010b
    db 01100010b
    db 01010010b
    db 01001010b
    db 01000110b
    db 01000010b
    db 01000010b
    db 00000000b

    ; O
    db 00111100b
    db 01000010b
    db 01000010b
    db 01000010b
    db 01000010b
    db 01000010b
    db 00111100b
    db 00000000b

    ; P
    db 01111100b
    db 01000010b
    db 01000010b
    db 01111100b
    db 01000000b
    db 01000000b
    db 01000000b
    db 00000000b

    ; Q
    db 00111100b
    db 01000010b
    db 01000010b
    db 01000010b
    db 01001010b
    db 01000100b
    db 00111010b
    db 00000000b

    ; R
    db 01111100b
    db 01000010b
    db 01000010b
    db 01111100b
    db 01010000b
    db 01001000b
    db 01000100b
    db 00000000b

    ; S
    db 00111100b
    db 01000010b
    db 01000000b
    db 00111100b
    db 00000010b
    db 01000010b
    db 00111100b
    db 00000000b

    ; T
    db 01111110b
    db 00001000b
    db 00001000b
    db 00001000b
    db 00001000b
    db 00001000b
    db 00001000b
    db 00000000b

    ; U
    db 01000010b
    db 01000010b
    db 01000010b
    db 01000010b
    db 01000010b
    db 01000010b
    db 00111100b
    db 00000000b

    ; V
    db 01000010b
    db 01000010b
    db 01000010b
    db 01000010b
    db 01000010b
    db 00100100b
    db 00011000b
    db 00000000b

    ; W
    db 01000010b
    db 01000010b
    db 01000010b
    db 01000010b
    db 01000010b
    db 01011010b
    db 00100100b
    db 00000000b

    ; X
    db 01000010b
    db 00100100b
    db 00011000b
    db 00011000b
    db 00100100b
    db 01000010b
    db 01000010b
    db 00000000b

    ; Y
    db 01000010b
    db 00100100b
    db 00011000b
    db 00001000b
    db 00001000b
    db 00001000b
    db 00001000b
    db 00000000b

    ; Z
    db 01111110b
    db 00000010b
    db 00000100b
    db 00001000b
    db 00010000b
    db 00100000b
    db 01111110b
    db 00000000b

    ; a
    db 00000000b
    db 00000000b
    db 00111100b
    db 00000010b
    db 00111110b
    db 01000010b
    db 00111110b
    db 00000000b

    ; b
    db 01000000b
    db 01000000b
    db 01111100b
    db 01000010b
    db 01000010b
    db 01000010b
    db 01111100b
    db 00000000b

    ; c
    db 00000000b
    db 00000000b
    db 00111100b
    db 01000010b
    db 01000000b
    db 01000010b
    db 00111100b
    db 00000000b

    ; d
    db 00000010b
    db 00000010b
    db 00111110b
    db 01000010b
    db 01000010b
    db 01000010b
    db 00111110b
    db 00000000b

    ; e
    db 00000000b
    db 00000000b
    db 00111100b
    db 01000010b
    db 01111110b
    db 01000000b
    db 00111100b
    db 00000000b

    ; f
    db 00000110b
    db 00001000b
    db 00011100b
    db 00001000b
    db 00001000b
    db 00001000b
    db 00001000b
    db 00000000b

    ; g
    db 00000000b
    db 00000000b
    db 00111110b
    db 01000010b
    db 01000010b
    db 00111110b
    db 00000010b
    db 00111100b

    ; h
    db 01000000b
    db 01000000b
    db 01011100b
    db 01100010b
    db 01000010b
    db 01000010b
    db 01000010b
    db 00000000b

    ; i
    db 00001000b
    db 00000000b
    db 00111000b
    db 00001000b
    db 00001000b
    db 00001000b
    db 00111100b
    db 00000000b

    ; j
    db 00000100b
    db 00000000b
    db 00001100b
    db 00000100b
    db 00000100b
    db 00000100b
    db 00000100b
    db 01111000b

    ; k
    db 01000000b
    db 01000100b
    db 01001000b
    db 01110000b
    db 01001000b
    db 01000100b
    db 01000010b
    db 00000000b

    ; l
    db 00111000b
    db 00001000b
    db 00001000b
    db 00001000b
    db 00001000b
    db 00001000b
    db 00111100b
    db 00000000b

    ; m
    db 00000000b
    db 00000000b
    db 01110110b
    db 01011010b
    db 01000010b
    db 01000010b
    db 01000010b
    db 00000000b

    ; n
    db 00000000b
    db 00000000b
    db 01011100b
    db 01100010b
    db 01000010b
    db 01000010b
    db 01000010b
    db 00000000b

    ; o
    db 00000000b
    db 00000000b
    db 00111100b
    db 01000010b
    db 01000010b
    db 01000010b
    db 00111100b
    db 00000000b

    ; p
    db 00000000b
    db 00000000b
    db 01111100b
    db 01000010b
    db 01000010b
    db 01000010b
    db 01111100b
    db 01000000b

    ; q
    db 00000000b
    db 00000000b
    db 00111110b
    db 01000010b
    db 01000010b
    db 00111110b
    db 00000010b
    db 00000010b

    ; r
    db 00000000b
    db 00000000b
    db 01011100b
    db 01100010b
    db 01000000b
    db 01000000b
    db 01000000b
    db 00000000b

    ; s
    db 00000000b
    db 00000000b
    db 00111110b
    db 01000000b
    db 00111100b
    db 00000010b
    db 01111100b
    db 00000000b

    ; t
    db 00001000b
    db 00001000b
    db 00111110b
    db 00001000b
    db 00001000b
    db 00001010b
    db 00000100b
    db 00000000b

    ; u
    db 00000000b
    db 00000000b
    db 01000010b
    db 01000010b
    db 01000010b
    db 01000110b
    db 00111010b
    db 00000000b

    ; v
    db 00000000b
    db 00000000b
    db 01000010b
    db 01000010b
    db 00100100b
    db 00011000b
    db 00011000b
    db 00000000b

    ; w
    db 00000000b
    db 00000000b
    db 01000010b
    db 01000010b
    db 01011010b
    db 01011010b
    db 01100110b
    db 00000000b

    ; x
    db 00000000b
    db 00000000b
    db 01000010b
    db 00100100b
    db 00011000b
    db 00100100b
    db 01000010b
    db 00000000b

    ; y
    db 00000000b
    db 00000000b
    db 01000010b
    db 01000010b
    db 01000010b
    db 00111110b
    db 00000010b
    db 00111100b

    ; z
    db 00000000b
    db 00000000b
    db 01111110b
    db 00000100b
    db 00011000b
    db 00010000b
    db 01111110b
    db 00000000b
    ; ... (додайте дані для інших символів)


.code

public set_graphic_mode
public set_text_mode
public draw_char
public draw_pixel
public draw_rectangle

    ; Явно вказуємо, що font_data доступний з сегмента коду
    ;TODO:                public font_data

; draw_char процедура
; Вхід:
;   AL - ASCII код символу
;   CX - X координата
;   DX - Y координата
;   BL - колір символу
; Використовує: AX, BX, CX, DX, SI, DI
draw_char proc
    push   ax
    push   bx
    push   cx
    push   dx
    push   si
    push   di

    ; Отримуємо адресу шрифту для символу
    sub    al, 'A'
    mov    ah, 0
    shl    ax, 3
    mov    si, offset font_data
    add    si, ax

    mov    di, 8                   ; висота символу

draw_char_loop: 
    push   cx
    mov    al, [si]
    mov    ah, 8

draw_char_row:  
    test   al, 10000000b
    jz     draw_char_skip

    push   ax
    mov    al, bl
    call   draw_pixel
    pop    ax

draw_char_skip: 
    inc    cx
    shl    al, 1
    dec    ah
    jnz    draw_char_row

    pop    cx
    inc    dx
    inc    si
    dec    di
    jnz    draw_char_loop

    pop    di
    pop    si
    pop    dx
    pop    cx
    pop    bx
    pop    ax
    ret
draw_char endp

; Процедура для встановлення графічного режиму
; Вхід: AL - номер режиму (0 - CGA, 1 - EGA, 2 - SVGA 640x480x256)
set_graphic_mode proc
    push ax
    push bx
    
    cmp al, 0
    je set_cga
    cmp al, 1
    je set_ega
    cmp al, 2
    je set_svga
    
    ; Якщо невідомий режим, встановлюємо EGA за замовчуванням
set_ega:
    mov ax, 0010h  ; EGA режим (640x350, 16 кольорів)
    jmp set_mode
    
set_cga:
    mov ax, 0006h  ; CGA режим (640x200, 2 кольори)
    jmp set_mode

set_svga:
    mov ax, 0012h  ; SVGA режим (640x480, 256 кольорів)
    
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