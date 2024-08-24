.model small
.stack 100h
.data
.code
start:
    mov ax, @data
    mov ds, ax

    ; Встановлення відеорежиму 640x480, 256 кольорів
    mov ax, 0012h
    int 10h

    ; Встановлення кольору пікселя (наприклад, 15 - яскраво-білий)
    mov ah, 0Ch
    mov al, 15
    ; Координати пікселя (наприклад, x=320, y=240 - центр екрану)
    mov cx, 320
    mov dx, 240
    int 10h

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