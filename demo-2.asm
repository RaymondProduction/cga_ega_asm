.model small
.stack 100h

; Оголошення зовнішніх процедур, які визначаються в іншому файлі
extrn set_graphic_mode:proc   ; Процедура встановлення графічного режиму
extrn set_text_mode:proc      ; Процедура повернення до текстового режиму
extrn draw_char:proc          ; Процедура малювання символу
extrn draw_rectangle:proc     ; Процедура малювання прямокутника
extrn draw_pixel:proc         ; Процедура малювання пікселя
;TODO: extrn font_data:byte

.data
    ; Оголошення кольорів
    black     dw 0
    blue      dw 1
    green     dw 2
    cyan      dw 3
    red       dw 4
    magenta   dw 5
    yellow    dw 6
    gray      dw 7
    dark_gray dw 8

    color     dw 0    ; Початковий колір
    mode      db 0    ; Початковий графічний режим


.code
    start:          
                    mov  ax, @data
                    mov  ds, ax              ; Встановлюємо сегмент даних

    cycle_modes:    
    ; Встановлення графічного режиму
                    mov  al, [mode]
                    call set_graphic_mode

    ; Малювання кількох прямокутників з різними кольорами
                    mov  cx, 0               ; Початкова X координата
                    mov  ax, [color]         ; Колір пікселя (спочатку чорний)
    cycle_rectangle:
                    add  cx, 10              ; Зміщуємо X координату на 10
                    mov  dx, 10              ; Початкова Y координата
                    mov  bx, 10              ; Ширина прямокутника
                    mov  si, 10              ; Висота прямокутника
                    call draw_rectangle      ; Викликаємо процедуру малювання прямокутника
                    inc  ax                  ; Змінюємо колір пікселя
                    cmp  ax, 16              ; Перевіряємо чи перевищили максимальне значення
                    jl   cycle_rectangle     ; Повертаємося до циклу, якщо колір менший за 16

    ; Виведення символу
                    mov  al, 'H'
                    mov  cx, 10
                    mov  dx, 150
                    mov  bl, 15
                    call draw_char

    ; Виведення символу
                    mov  al, 'E'
                    add  cx, 8
                    call draw_char

    ; Виведення символу
                    mov  al, 'L'
                    add  cx, 8
                    call draw_char

    ; Виведення символу
                    mov  al, 'L'
                    add  cx, 8
                    call draw_char

    ; Виведення символу
                    mov  al, 'O'
                    add  cx, 8
                    call draw_char
    ; Виведення символу
                    mov  al, '@'
                    add  cx, 8
                    call draw_char


    ; Очікування натискання клавіші користувачем
                    mov  ah, 0
                    int  16h

    ; Перехід до наступного графічного режиму
                    inc  [mode]
                    cmp  [mode], 3           ; Переходимо до наступного режиму, перевіряємо межу (3)
                    jl   cycle_modes         ; Повертаємося до початку циклу, якщо режим менший за 3

    ; Повернення до текстового режиму
                    call set_text_mode

    ; Завершення програми
                    mov  ax, 4C00h
                    int  21h
end start