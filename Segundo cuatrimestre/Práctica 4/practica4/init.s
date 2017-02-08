.extern __main
.global start
.equ STACK, 0x0c7ff000 @Direccion de incio de SP tiene un valor de memoria elevado para asi asegurarnos
				       @tener suficientes espacio para las pilas
.text
start:
	ldr sp,=STACK  @Cargamos en SP la direccion de inicio de sp
	mov fp,#0      @Como ahora mismo no hay base de la pila ponemos el fp a 0
	mov lr,pc      @Guardamos la direccion de retorno en el registro lr
	ldr pc, =__main @Saltamos al main
End:
B End
.end