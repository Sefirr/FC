.global start

.EQU N, 8

.data
A: .word 7,3,25,4,75,2,1,1

.bss
B: .space N*4
max: .space 4
ind: .space 4

.text
start:
		MOV R3, #0 @ Inicializo un indice R3 a 0 para recorrer el vector A
		MOV R4, #0 @ Inicializo un indice R4 a 0 para recorrer el vector B
		
		LDR R1, = A @ Cargo en R1 la direccion de comienzo del vector asociado a la etiqueta A.
		LDR R2, = N @ Cargo en R2 la direccion de memoria asociada a la variable N.
		LDR R5, = B @ Cargo en R5 la direccion de comienzo del vector asociado a la etiqueta B.
		
		MOV SP, #0x0c200000 @Inicializamos el puntero de PILA.
	
FOR_VECTOR_B:
		CMP R4, #N
		BGE FIN_FOR_VECTOR_B
		BL FUNCION_MAX
		
		B FOR_VECTOR_B
		
FIN_FOR_VECTOR_B:
	B .
		
		
FUNCION_MAX:
	SUB SP, SP, #8 @Reservamos espacio para 2 elementos.
	
	/*PROLOGO*/
		STR R4, [SP, #4]
		STR R5, [SP, #0]
		
		MOV R4, #0 @ Inicializo un indice R4 a 0 para recorrer el vector A
		LDR R5, = max @ Cargo en R5 la direccion de memoria asociada a la etiqueta max.
		STR R4, [R5] @ Escribo 0 en max.
		LDR R6, = ind @ Cargo en R6 la direccion de memoria asociada a ind(LO QUE DEVOLVERA LA FUNCION).
	
	FOR_VECTOR_A:
			
			CMP R4, R2
			BGE FIN_FOR_VECTOR_A
		
			LDR R7, [R5] @ Cargo en R7 el valor maximo actual.
			LDR R8, [R1, R4, LSL#2] @ Cargo en R8 el valor contenido en la posicion del vector A correspondiente al indice en esta iteracion.
		
			CMP R8, R7 @ Si el valor del elemento leido del vector A en esta iteracion es mayor que el valor actual de la variable asociada a max...
			BLE INCREMENTAR_INDICE
				
			STR R8, [R5] @ Escribo en la direccion de memoria contenida en R5 el valor contenido en R8, es decir hemos encontrado un nuevo valor maximo.*/
			STR R4, [R6] @Actualizo en MEMORIA el valor de la variable ind.
			
			MOV R0, R4 @ Actualizo el valor de retorno de la subrutina en R0.*/
			LDR R8, [R5] @ Tambien cargo en R8 el valor del indice del vector A en esta iteracion para poder luego actualizar el vector A y B.
			B FOR_VECTOR_A		
	INCREMENTAR_INDICE:
			ADD R4, R4, #1 @ Incremento el indice en 1 para la siguiente iteracion del vector A.
			B FOR_VECTOR_A	
	
	FIN_FOR_VECTOR_A:
							
		/*EPILOGO*/
		
		LDR R5, [SP, #0]
		LDR R4, [SP, #4]
		
			/* Escribo en el vector B */
				LDR R6, [R1, R0, LSL#2]
				STR R6, [R5, R4, LSL#2]
				
		/* Actualizo poniendo 0 en la posicion adecuada del vector A. */
				STR R3, [R1, R0, LSL#2]
		
		ADD R4, R4, #1
		
		ADD SP, SP, #8
		
		MOV PC, LR
	
		.end
		