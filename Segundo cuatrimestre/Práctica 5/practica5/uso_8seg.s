	.global start

	
.equ LED8ADDR, 0x2140000

.equ segmento_A, 0x7F
.equ segmento_B, 0xBF
.equ segmento_C, 0xDF
.equ segmento_D, 0xF7
.equ segmento_E, 0xFB
.equ segmento_F, 0xFD
.equ segmento_G, 0xFE
.equ segmento_P, 0xEF


.data 
segmentos: .word segmento_A,segmento_B,segmento_C,segmento_D,segmento_E,segmento_F,segmento_G,segmento_P
	
.text

start: bl init_seg
	   bl escribeC
FIN: B .

## inicializamos los segmentos con todos iluminados(YA QUE TENDREMOS EN LED8ADDR LOS 8 BITS A 0).
init_seg:  
		 mov r0,#0 @ Movemos un 0 al registro r0.
		 ldr r1,=LED8ADDR @ Cargamos en r1 la direccion asociada a la etiqueta LED8ADDR.
		 str  r0,[r1] @ Guardamos en memoria  un 0 en la direccion de memoria asociada a r1.
		 bx lr @ Devolvemos el control al programa principal. (MOV PC, LR)


## Escribe una A "componiendo" segmentos
escribeA: 
		 mov r0,#segmento_A
		 and r0,r0,#segmento_B
		 and r0,r0,#segmento_C
		 and r0,r0,#segmento_E
		 and r0,r0,#segmento_F
		 and r0,r0,#segmento_G
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.

## Escribe una B "componiendo" segmentos
escribeB: 
		 mov r0,#segmento_C
		 and r0,r0,#segmento_D
		 and r0,r0,#segmento_E
		 and r0,r0,#segmento_F
		 and r0,r0,#segmento_G
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.

## Escribe una C "componiendo" segmentos
escribeC: 
		 mov r0,#segmento_A
		 and r0,r0,#segmento_G
		 and r0,r0,#segmento_E
		 and r0,r0,#segmento_D
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.

## Escribe una D "componiendo" segmentos
escribeD: 
		 mov r0,#segmento_B
		 and r0,r0,#segmento_C
		 and r0,r0,#segmento_D
		 and r0,r0,#segmento_E
		 and r0,r0,#segmento_F
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.
	
## Escribe una E "componiendo" segmentos
escribeE: 
		 mov r0,#segmento_A
		 and r0,r0,#segmento_D
		 and r0,r0,#segmento_E
		 and r0,r0,#segmento_F
		 and r0,r0,#segmento_G
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.
	
## Escribe una F "componiendo" segmentos
escribeF: 
		 mov r0,#segmento_A
		 and r0,r0,#segmento_E
		 and r0,r0,#segmento_F
		 and r0,r0,#segmento_G
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.

## Escribe una 0 "componiendo" segmentos
escribe8: 
		 mov r0,#segmento_A
		 and r0,r0,#segmento_B
		 and r0,r0,#segmento_C
		 and r0,r0,#segmento_D
		 and r0,r0,#segmento_E
		 and r0,r0,#segmento_G
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.	

## Escribe una 1 "componiendo" segmentos
escribe1: 
		 mov r0,#segmento_B
		 and r0,r0,#segmento_C
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.	

## Escribe una 2 "componiendo" segmentos
escribe2: 
		 mov r0,#segmento_A
		 and r0,r0,#segmento_B
		 and r0,r0,#segmento_F
		 and r0,r0,#segmento_D
		 and r0,r0,#segmento_E
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.
	
## Escribe una 3 "componiendo" segmentos
escribe3: 
		 mov r0,#segmento_A
		 and r0,r0,#segmento_B
		 and r0,r0,#segmento_C
		 and r0,r0,#segmento_D
		 and r0,r0,#segmento_F
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.

## Escribe una 4 "componiendo" segmentos
escribe4: 
		 mov r0,#segmento_B
		 and r0,r0,#segmento_C
		 and r0,r0,#segmento_F
		 and r0,r0,#segmento_G
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.

## Escribe una 5 "componiendo" segmentos
escribe5: 
		 mov r0,#segmento_A
		 and r0,r0,#segmento_C
		 and r0,r0,#segmento_D
		 and r0,r0,#segmento_F
		 and r0,r0,#segmento_G
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.

## Escribe una 6 "componiendo" segmentos
escribe6: 
		 mov r0,#segmento_A
		 and r0,r0,#segmento_C
		 and r0,r0,#segmento_D
		 and r0,r0,#segmento_E
		 and r0,r0,#segmento_F
		 and r0,r0,#segmento_G
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.

## Escribe una 7 "componiendo" segmentos
escribe7: 
		 mov r0,#segmento_A
		 and r0,r0,#segmento_B
		 and r0,r0,#segmento_C
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.

## Escribe una 8 "componiendo" segmentos
escribe8: 
		 mov r0,#segmento_A
		 and r0,r0,#segmento_B
		 and r0,r0,#segmento_C
		 and r0,r0,#segmento_D
		 and r0,r0,#segmento_E
		 and r0,r0,#segmento_F
		 and r0,r0,#segmento_G
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.

## Escribe una 9 "componiendo" segmentos
escribe9: 
		 mov r0,#segmento_A
		 and r0,r0,#segmento_B
		 and r0,r0,#segmento_C
		 and r0,r0,#segmento_F
		 and r0,r0,#segmento_G
		 ldr r1,=LED8ADDR
		 strb  r0,[r1] @ escritura de tamaño byte
		 bx lr @ Devolvemos el control al programa principal y termina el programa.
.end