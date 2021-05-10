        org     100h

        section .text

        XOR SI, SI; Limpiar SI
        XOR AX, AX; Limpiando el registro
        XOR BX, BX; Limpiando el registro
        mov word CX, 5d; Asigno 5d a CX para que realice 5 iteraciones por los 5 dígitos de mi carnet
        mov BX, 8d; Le paso a DI el divisor
        mov byte [200h],1d
        mov byte [201h],1d
        mov byte [202h],4d
        mov byte [203h],1d
        mov byte [204h],7d
        ;Asigné los decimales de mi carnet
        jmp iterar ; Llamo la etiqueta iterar

        iterar:
        add AL, [200h+SI]; Empiezo a sumar con la iteración
        inc SI; Incrememto SI en 1
        loop iterar; Sigo hasta que CX sea 0

        div BL; Divido AX (Sumatoria total) / BL (8d) 
;       lo que nos va a devolver es en AX 0601, porque la división entera es 8*1 = 8
;       entonces 06 es el residuo y la division es igual a 01 sería 1*8 = 8 + 6 de residuo 
;       =14

        mov [20Ah], AX; Se guarda en 20Ah el resultado, poniendo primero 1, y después el residuo 6

        exit int 20h 