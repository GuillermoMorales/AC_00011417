        org 	100h

	      section	.text
;       Limpio
        xor AX, AX
        xor SI, SI
        xor BX, BX
        XOR CX, CX
        xor DX, DX

        ; print msg1
	      mov 	  DX, msg1
	      call  	EscribirCadena

        ; input clave
	      mov 	  BP, clave
	      call  	LeerCadena

        call    comparar

        call	  EsperarTecla

	      int 	  20h

        section	.data

        msg1	db	"Ingresa la clave : ", "$"
        msg2 	db 	"Clave", "$"
        msg3    db      "BIENVENIDO", "$"
        msg4    db      "INCORRECTO", "$"
        clave 	times 	20  	db	" " 	;Inicializar String

        ; Permite leer un carácter de la entrada estándar con echo
        ; Parámetros:   AH: 07h         
        ; Salida:       AL: caracter ASCII leído
        EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret

        LeerCadena:
        xor     SI, SI          ; SI = 0
        while:  
        call    EsperarTecla    ; retorna un caracter en AL
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      exit            ; si AL == EnterKey, saltar a exit
        mov     [BP+SI], AL   	; guardar caracter en memoria
        inc     SI              ; SI++
        jmp     while           ; saltar a while
        exit:
	      mov 	byte [BP+SI], "$"	; agregar $ al final de la cadena
        ret

        comparar:
        xor     DI, DI          ;DI = 0
        
        ITERAR:
        mov     CX,[msg2+DI]
        cmp     DI, 5d          ;comparo DI con 5, si es así salto a exit1
        je      exit1
        cmp     [clave+DI], CX  ; comparar la clave ingresada con CX(que tiene la clave original)
        je      suma            ; si [clave+DI] == CX , saltar a suma, para aumentar y seguir
        mov     DX, msg4        ; si no son iguales, entonces le paso el mensaje de error
        call    EscribirCadena
        ret
        suma:
        INC     DI
        jmp     ITERAR
        ret
        exit1:
	      ; Paso el mensaje de bienvenido a DX y luego a call escribir cadena
	      mov 	DX, msg3
	      call 	EscribirCadena	
        ret
        ; Permite escribir en la salida estándar una cadena de caracteres o string, este
        ; debe tener como terminación el carácter “$”
        ; Parámetros:	AH: 09h 	DX: dirección de la celda de memoria inicial de la cadena
        EscribirCadena:
	      mov 	AH, 09h
	      int 	21h
	      ret
