/* a. Codificar en ensamblador del ARM el siguiente código C encargado de buscar el
valor máximo de un vector A de enteros positivos de longitud N y almacenarlo en la
variable max. Es OBLIGATORIO escribir en memoria el valor de max cada vez
que éste cambie (es decir, no basta con actualizar un registro; hay que realizar una
instrucción str).*/

.global start

.EQU N, 8

.data
A: .word 7,3,25,4,75,2,1,1

.bss
max: .space 4

.text
start:	mov r0, #0
		ldr r1, =max
		str r0, [r1] 
		ldr r2, =A @ 
	
for:	cmp r0, #N
		bge fin
		ldr r3, [r1]
		ldr r4, [r2, r0, LSL#2] 
		cmp r4, r3
		add r0, r0, #1
		ble for
		str	r4, [r1]
		b for

fin:	b .
		.end