.model small

; Оголошуємо зовнішній сегмент даних
;EXTRN font_data:BYTE
extrn font_data:byte
;extrn draw_char:proc          ; Процедура малювання символу

.data
.code

public set_graphic_mode
public set_text_mode
public draw_pixel
public draw_rectangle
public draw_string

    ; Явно вказуємо, що font_data доступний з сегмента коду
    ;TODO:                public font_data

; draw_string процедура
; Вхід:
;   SI - адреса рядка (завершується нулем)
;   CX - початкова X координата
;   DX - Y координата
;   BL - колір тексту
; Використовує: AX, BX, CX, DX, SI, DI
draw_string proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di

draw_string_loop:
    mov al, [si]    ; Завантажуємо символ з рядка
    test al, al     ; Перевіряємо, чи це кінець рядка (нуль)
    jz draw_string_end

    call draw_char  ; Викликаємо процедуру для виведення символу

    inc si          ; Переходимо до наступного символу в рядку
    add cx, 8       ; Збільшуємо X координату (припускаємо, що ширина символу 8 пікселів)
    jmp draw_string_loop

draw_string_end:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
draw_string endp

; Процедура для встановлення графічного режиму
; Вхід: AL - номер режиму (0 - CGA, 1 - EGA, 2 - SVGA 640x480x256)
set_graphic_mode proc

    ; Ініціалізація сегментів
    mov ax, @data
    mov ds, ax
    mov es, ax

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
    mov bx, 101h           ; Режим 101h - 640x480x256
    jmp set_mode
    
set_cga:
    mov bx, 101h           ; Режим 101h - 640x480x256
    jmp set_mode

set_svga:
    mov bx, 101h           ; Режим 101h - 640x480x256
    
set_mode:
    mov ax, 4F02h          ; Функція VESA - Set VBE Mode
    int 10h                ; Виклик переривання BIOS
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
    mov ah, 0Ch            ; Функція BIOS для малювання пікселя
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
    
    ; Отримуємо зміщення для символу в таблиці даних
    mov    ah, 0
    shl    ax, 3  ; Множимо на 8, оскільки кожен символ займає 8 байт
    lea si, font_data
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

end