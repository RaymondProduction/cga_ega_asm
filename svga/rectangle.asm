.model small
.stack 100h
.data
    x1    dw 100    ; Ліва координата X
    y1    dw 100    ; Верхня координата Y
    x2    dw 300    ; Права координата X
    y2    dw 200    ; Нижня координата Y
    color db 15     ; Колір (15 - білий)

.code
    start:      
                mov ax, @data
                mov ds, ax

    ; Встановлення відеорежиму 640x480, 256 кольорів
                mov ax, 0012h
                int 10h

    ; Підготовка до малювання
                mov ah, 0Ch        ; Функція для малювання пікселя
                mov al, [color]    ; Колір пікселя

    ; Малювання верхньої горизонтальної лінії
                mov dx, [y1]
                mov cx, [x1]
    top_line:   
                int 10h
                inc cx
                cmp cx, [x2]
                jle top_line

    ; Малювання нижньої горизонтальної лінії
                mov dx, [y2]
                mov cx, [x1]
    bottom_line:
                int 10h
                inc cx
                cmp cx, [x2]
                jle bottom_line

    ; Малювання лівої вертикальної лінії
                mov cx, [x1]
                mov dx, [y1]
    left_line:  
                int 10h
                inc dx
                cmp dx, [y2]
                jle left_line

    ; Малювання правої вертикальної лінії
                mov cx, [x2]
                mov dx, [y1]
    right_line: 
                int 10h
                inc dx
                cmp dx, [y2]
                jle right_line

    ; Очікування натискання клавіші
                mov ah, 0
                int 16h

    ; Повернення до текстового режиму
                mov ax, 0003h
                int 10h

    ; Вихід з програми
                mov ax, 4C00h
                int 21h

end start