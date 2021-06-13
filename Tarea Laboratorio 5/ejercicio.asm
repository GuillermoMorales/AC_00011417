org 100h

    section .text
;   Limpio lo que usare
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d
    
    call modotexto
    call movercursor
    call escribircaracter
    call movercursordos
    call escribircaracterdos
    call movercursortres
    call escribircaractertres
    call movercursorcuatro
    call escribircaractercuatro
    call esperartecla
    call exit

    modotexto: 
        MOV AH, 0h 
        MOV AL, 03h
        INT 10h
        RET
    movercursor:
        MOV AH, 02h
        MOV DH, 10 
        MOV DL, 20 
        MOV BH, 0h 
        INT 10h
        RET
    movercursordos:
        MOV AH, 02h 
        MOV DH, 12 
        MOV DL, 20 
        MOV BH, 0h 
        INT 10h
        RET
    movercursortres:
        MOV AH, 02h 
        MOV DH, 14 
        MOV DL, 20 
        MOV BH, 0h 
        INT 10h
        RET
    movercursorcuatro:
        MOV AH, 02h
        MOV DH, 16 
        MOV DL, 20 
        MOV BH, 0h 
        INT 10h
        RET
    escribircaracter:
        MOV AH, 09h 
        MOV DX, caracter 
        INT 21h
        RET
    escribircaracterdos: 
        MOV AH, 09h 
        MOV DX, caracterdos 
        INT 21h
        RET
    escribircaractertres: 
        MOV AH, 09h 
        MOV DX, caractertres
        INT 21h
        RET
    escribircaractercuatro: 
        MOV AH, 09h 
        MOV DX, caractercuatro 
        INT 21h
        RET

    esperartecla:
        MOV AH, 00h 
        INT 16h

        ret
    exit:
        int 20h

section .data

caracter DB "Guillermo$"
caracterdos DB "Javier$"
caractertres DB "Morales$"
caractercuatro DB "Cornejo$"
