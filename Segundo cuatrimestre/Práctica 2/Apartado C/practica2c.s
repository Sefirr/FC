.global start
.EQU N, 8
.data
A: .word 7,3,-25,4,-75,2,1,1
B: .space N*4
max: .space 4
ind: .space 4
.text

start:

MOV R0, #0        @ Inicilaiza j = 0.
            
LDR R1, =max
LDR R4, =A
LDR R6, =ind
LDR R7, =B
MOV R10, #0

FORA:
	CMP R0, #N
	BGE fin_fora
	MOV R2, #0
	STR R2, [R1]    @ Pasamos 0 a R1(maximo). 
	MOV R3, #0              @ Inicializa i = 0.

FORB:
   
	CMP R3, #N
	BGE fin_forb
IF:
	LDR R5, [R4, R3, LSL#2]    @ Carga A[i] en R5
	
	CMP R5, #0
	BLE darvuelta
	
    LDR R2, [R1] @ Cargamos el contenido de max en R2. Usando R2, que ya no se usa en ese for.
	CMP R5, R2 @ Comparamos A[i] con max. 
	BLE fin_if  @ Si es menor o igual va a fin_if
	STR R5, [R1]  @ max = A[i]
	LDR R9, [R6] @ CARGO EN R9 EL CONTENIDO DE IND
    MOV R9, R3   @ Cargo i en ind. La posicion del ultimo mayor	

darvuelta: 	
	SUB R5, R10, R5
	b .-28
    
    
fin_if:
	ADD R3, R3, #1  @ Incrementamos el contador i.
	B FORB

fin_forb:
	LDR R5, [R1]  @ Carga A[ind] en R5. Es decir, el mayor valor del array.
    MOV R8, R5  @ B[j] = A[ind]
    STR R8, [R7, R0, LSL#2]  @ Carga B[j] en R8.
    STR R9, [R6]
    MOV R5, #0 
	STR R5, [R4, R9, LSL#2]
	ADD R0, R0, #1
 	B FORA

 
fin_fora:
b .
.end


