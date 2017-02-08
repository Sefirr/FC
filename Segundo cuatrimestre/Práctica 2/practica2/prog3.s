/* b. Codificar en ensamblador del ARM un algoritmo de ordenación basado en el códigodel apartado anterior. 
Supongamos un vector A de N enteros mayores de 0, queremos rellenar un vector B con los valores de A ordenados 
de mayor a menor.
Para ello nos podemos basar en el siguiente código de alto nivel. . Es
OBLIGATORIO escribir en memoria el valor de ind y max cada vez que cambien
(es decir, no basta con actualizar un registro; hay que realizar una instrucción str) */
.global start

.EQU N, 8

.data
A: .word 7,3,25,4,75,2,1,1
.bss
B: .space N*4
max: .space 4
ind: .space 4

.text
start:	MOV R0, #0 
		MOV R1, #0
		LDR R2, = max 
		STR R0, [R2] 
		LDR R3, = A 
		LDR R4, = B 
		LDR R5, = ind 

FOR_VECTOR_B:	CMP R1, #N
				BGE FIN_FOR_VECTOR_B

FOR_VECTOR_A:	CMP R0, #N
				BGE FIN_FOR_VECTOR_A

				LDR R6, [R2] 
				LDR R7, [R3, R0, LSL#2] 

				CMP R7, R6 
				BLE INCREMENTAR_INDICE

				STR R7, [R2] 
				STR R0, [R5] 
				LDR R8, [R5]  
				ADD R0, R0, #1
				B FOR_VECTOR_A 
				
INCREMENTAR_INDICE:	ADD R0, R0, #1 
					B FOR_VECTOR_A 

FIN_FOR_VECTOR_A:	MOV R0, #0 
					STR R0, [R2] 
	
					LDR R9, [R3, R8, LSL#2]
					STR R9, [R4, R1, LSL#2]


					STR R0, [R3, R8, LSL#2] 

					ADD R1, R1, #1

					B FOR_VECTOR_B

FIN_FOR_VECTOR_B:	B .
					.end