/* c. Desarrollar un programa en c�digo ensamblador del ARM que divida dos n�meros
tama�o palabra A y B y escriba el resultado en el n�mero C mediante restas parciales
utilizando el algoritmo del cuadro 1.4.
C = 0
mientras A >= B
A = A - B
C = C + 1
fin mientras 
int x=2;
int y=10;
int mayor;
int main()
{
if ( x>y ) mayor=x;
else mayor=y;
return 1;
}
Cuadro 1.4
*/
.global start

.data
.equ CERO, 0x00
A: .word 0x09
B: .word 0x02

.bss
C: .space 4
R: .space 4

.text

start: 	ldr R0, =A
		ldr R1, =B
		ldr R5, =C
		ldr R6, =R
		ldr R2, [R0]
		ldr R3, [R1]
		mov R4, #CERO
bucle:	cmp R2,R3
		ble fin
		sub R2, R2, R3
		add R4, R4, #1
		b bucle
fin:	str R2, [R6]
		str R4, [R5]

		b .
		.end