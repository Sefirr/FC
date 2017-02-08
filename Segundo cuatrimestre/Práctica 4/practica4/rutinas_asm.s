	.global Intercambiar
	.global OrdenaPorPrioridad

/*Intercambiar:
	MOV IP,SP
	STMDB SP!,{R4-R10,FP,IP,lr,PC}
    SUB FP,IP,#4

	ADD R1, R0, R1, lsl #3    @ R1 <- &(T[i])
	ADD R2, R0, R2, lsl #3    @ R2 <- &(T[j])
	LDR R3, [R1]              @ R3 <- T[i].prioridad
	LDR R0, [R2]              @ R0 <- T[j].prioridad
	STR R3, [R2]              @ T[j].prioridad <- R3
	STR R0, [R1]              @ T[i].prioridad <- R0
	LDR R3,[R1,#4]            @ R3 <- T[i].id
    LDR R0,[R2,#4]            @ R0 <- T[j].id
    STR R3,[R2,#4]            @ T[j].id <- R3
    STR R0,[R1,#4]            @ T[i].id <- R0

	LDMDB FP,{R4-R10,FP,SP,PC}*/
	
	OrdenaPorPrioridad:
	
	MOV IP,SP
	STMDB SP!,{R4-R10,FP,IP,lr,PC}
	
    SUB FP,IP,#4
	SUB SP,SP,#8			
	STR R0, [FP,#-44]
	STR R1, [FP,#-48]
	MOV R4,#0 				 
	
	
	FOR_I:
	
	
		LDR R2, [FP,#-48]   
		CMP R4,R2			
		BGE FIN_FOR			
		LDR R0, [FP,#-44]
		LDR R2, [FP,#-48] 
		MOV R1,R4			
		BL PosMinPrioridad	
		MOV R2,R0			
	@	MOV R1,R4		
		LDR R0, [FP,#-44]	
		BL Intercambiar		
		ADD R4,R4,#1		
		B FOR_I				
		
	FIN_FOR:
	
		B FIN_FOR
		
.end
