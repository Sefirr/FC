#define MAX_PACIENTES 16
struct Descriptor {
unsigned int prioridad;
unsigned int pid;
};
struct Descriptor Pacientes[MAX_PACIENTES] = { {127,1},{127,2},{112,3},{100,4},{132,5},{136,6},{255,7},{10,8},{0,0}};

int NumPacientes(struct Descriptor* P)
{



	int i;
	for( i = 0; i < MAX_PACIENTES; i++ )
	if( (P[i].prioridad == 0) && ( P[i].pid == 0 ) )
	return i;
	
return MAX_PACIENTES - 1;
}

int PosMinPrioridad(struct Descriptor* P,int ini, int num)
{

 int minpos = ini;
	unsigned int min = P[ini].prioridad;
	int i;
	for( i = ini+1; i < num; i++)
	if( P[i].prioridad < min )
	{
		minpos = i;
		min = P[i].prioridad;
	}
return minpos;
}

//extern void Intercambiar(struct Descriptor* P, int i, int j); 
/*
void OrdenaPorPrioridad(struct Descriptor* A, int num)
{
// Explicacion: con esta funcion lo que hacemos es primero buscar la posicon del valor minimos (j) y lo intercambiamos con los
// elementos del array (i).
	int i,j;
	

for( i = 0; i < num ; i++ )
{
	j = PosMinPrioridad(A,i,num);
	Intercambiar(A,i,j);
}
}
*/



extern OrdenaPorPrioridad(struct Descriptor* A, int num);
void Intercambiar(struct Descriptor* P, int i, int j)
{
 
	int aux, aux2;
	
	aux = P[i].prioridad;
	aux2 = P[i].pid;
	P[i].prioridad = P[j].prioridad;
	P[i].pid = P[j].pid;
	P[j].prioridad = aux; 
	P[j].pid = aux2;
}

int __main(void)
{
	int num;
	num = NumPacientes(Pacientes);
	OrdenaPorPrioridad( Pacientes, num );
	return 0;
}