    org 	100h

	  section	.text

	  mov byte [200h], "G"
    mov byte [201h], "J"
    mov byte [202h], "M"
    mov byte [203h], "C"
    mov	BX, 200h
    mov SI, 2d

;   Direccionamiento directo o absoluto
    mov AL, [200h]
;   Direccionamiento indirecto por registro
    mov	CL, [BX]
;   Direccionamiento indirecto por base+índice
    mov 	DL, [BX+SI]
;   Direccionamiento relativo por registro
	  mov     DI, [BX+3h]
    
	  int	20h
