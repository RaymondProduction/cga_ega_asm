; rectangle.asm
.model small
.stack 100h

extrn set_graphic_mode:proc
extrn set_text_mode:proc
extrn draw_rectangle:proc

.data
    black     dw 0
    blue      dw 1    ; Синій колір
    green     dw 2    ; Зелений
    cyan      dw 3
    red       dw 4
    magenta   dw 5
    yellow    dw 6
    gray      dw 7
    dark_gray dw 8

    color     dw 0
    mode      db 0    ; Початковий режим - CGA

.code
    start:          
                    mov  ax, @data
                    mov  ds, ax

    cycle_modes:    
    ; Встановлення графічного режиму
                    mov  al, [mode]
                    call set_graphic_mode

    ; Малювання прямокутника
                    mov  cx, 0               ; початкова X координата
                    mov  ax, [color]         ; колір пікселя
    cycle_rectangle:
                    add  cx, 10
                    mov  dx, 10              ; початкова Y координата
                    mov  bx, 10              ; ширина прямокутника
                    mov  si, 10              ; висота прямокутника
                    call draw_rectangle
                    inc  ax                  ; збільшуємо значення AX
                    cmp  ax, 16
                    jl   cycle_rectangle

    ; Виведення інформації про поточний режим
                    mov  ah, 02h             ; функція виведення символу
                    mov  dl, '0'             ; символ '0'
                    add  dl, [mode]          ; додаємо номер режиму (0, 1 або 2)
                    int  21h                 ; виводимо символ

    ; Очікування натискання клавіші
                    mov  ah, 0
                    int  16h

    ; Перехід до наступного режиму
                    inc  [mode]
                    cmp  [mode], 3           ; Змінено з 2 на 3 для підтримки нового режиму
                    jl   cycle_modes

    ; Повернення до текстового режиму
                    call set_text_mode

    ; Вихід з програми
                    mov  ax, 4C00h
                    int  21h

end start