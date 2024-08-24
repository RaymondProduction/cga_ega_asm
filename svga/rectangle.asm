.model small
.stack 100h
.data
    x1 dw 100    ; Ліва координата X
    y1 dw 100    ; Верхня координата Y
    x2 dw 300    ; Права координата X
    y2 dw 200    ; Нижня координата Y
    color db 15  ; Колір (15 - білий)

.code
start:
    mov ax, @data
    mov ds, ax

    ; Встановлення відеорежиму 640x480, 256 кольорів
    mov ax, 0012h
    int 10h

    ; Малювання верхньої горизонтальної лінії
    mov cx, [x1]
    mov dx, [y1]
    call draw_horizontal_line

    ; Малювання нижньої горизонтальної лінії
    mov cx, [x1]
    mov dx, [y2]
    call draw_horizontal_line

    ; Малювання лівої вертикальної лінії
    mov cx, [x1]
    mov dx, [y1]
    call draw_vertical_line

    ; Малювання правої вертикальної лінії
    mov cx, [x2]
    mov dx, [y1]
    call draw_vertical_line

    ; Очікування натискання клавіші
    mov ah, 0
    int 16h

    ; Повернення до текстового режиму
    mov ax, 0003h
    int 10h

    ; Вихід з програми
    mov ax, 4C00h
    int 21h

draw_horizontal_line:
    mov ah, 0Ch
    mov al, [color]
    mov bx, [x2]
horizontal_loop:
    int 10h
    inc cx
    cmp cx, bx
    jle horizontal_loop
    ret

draw_vertical_line:
    mov ah, 0Ch
    mov al, [color]
    mov bx, [y2]
vertical_loop:
    int 10h
    inc dx
    cmp dx, bx
    jle vertical_loop
    ret

end start