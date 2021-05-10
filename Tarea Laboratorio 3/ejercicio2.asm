        org     100h

        section .text

        XOR SI, SI; Limpiar SI
        XOR AX, AX; Limpiando el registro
        XOR BX, BX; Limpiando el registro
        mov  AL, 1d; Coloco primero 1 al AL
        mov word CX, 5d; Para empezar a multiplicar 5*1, luego AL tendrá 5 y CX 4, multiplico
;       5*4, luego 20*3...
        jmp iterar; Mando a llamar la etiqueta iterar
        
        iterar:
        mul CX; Empiezo a multiplicar         
        loop iterar; Se le va a restar a CX 1 en cada iteración

        mov [20bH],AL; Paso a 20bH el 78 hexadecimal que me dió del factorial 

        exit int 20h 