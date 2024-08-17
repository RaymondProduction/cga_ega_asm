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
                mov  ax, [blue]          ; колір пікселя
                mov  cx, 10              ; початкова X координата
                mov  dx, 10              ; початкова Y координата
                mov  bx, 90              ; ширина прямокутника
                mov  si, 90              ; висота прямокутника
                call draw_rectangle

    ; Малювання прямокутника
                mov  ax, 0               ; колір пікселя
                mov  cx, 30              ; початкова X координата
                mov  dx, 30              ; початкова Y координата
                mov  bx, 50              ; ширина прямокутника
                mov  si, 50              ; висота прямокутника
                call draw_rectangle

    ; Малювання прямокутника
                mov  ax, [green]         ; колір пікселя
                mov  cx, 102             ; початкова X координата
                mov  dx, 10              ; початкова Y координата
                mov  bx, 90              ; ширина прямокутника
                mov  si, 90              ; висота прямокутника
                call draw_rectangle

    ; Малювання прямокутника
                mov  ax, [red]           ; колір пікселя
                mov  cx, 10              ; початкова X координата
                mov  dx, 102             ; початкова Y координата
                mov  bx, 90              ; ширина прямокутника
                mov  si, 90              ; висота прямокутника
                call draw_rectangle


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
                cmp  [mode], 2
                jl   cycle_modes

    ; Повернення до текстового режиму
                call set_text_mode

    ; Вихід з програми
                mov  ax, 4C00h
                int  21h

end start