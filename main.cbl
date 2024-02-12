IDENTIFICATION DIVISION.
PROGRAM-ID. AnimalProgram.

DATA DIVISION.
WORKING-STORAGE SECTION.

01 AnimalData.
   05 Nombre PIC X(20).
   05 Edad PIC 99.

01 PerroData.
   05 Raza PIC X(20).
   05 Precio PIC 9999.

01 PerrosTiendaData.
   05 Perros OCCURS 10 TIMES.
      10 NombrePerro PIC X(20).
      10 EdadPerro PIC 99.
      10 RazaPerro PIC X(20).
      10 PrecioPerro PIC 9999.

01 FacturarData.
   05 Total PIC 99999.

01 i PIC 99.

PROCEDURE DIVISION.
    
   MOVE 'Firulais' TO Nombre
   MOVE 3 TO Edad
   MOVE 'Labrador' TO Raza
   MOVE 1000 TO Precio
   PERFORM AgregarPerro
   
   MOVE 'Rex' TO Nombre
   MOVE 5 TO Edad
   MOVE 'Pastor Aleman' TO Raza
   MOVE 1500 TO Precio
   PERFORM AgregarPerro
   
   MOVE 'Bobby' TO Nombre
   MOVE 7 TO Edad
   MOVE 'Chihuahua' TO Raza
   MOVE 500 TO Precio
   PERFORM AgregarPerro
   
   DISPLAY 'El perro de más edad:'
   PERFORM BuscarPerroMasViejo
   DISPLAY 'Perros en la tienda:'
   PERFORM ImprimirPerros
   DISPLAY 'Total de perros en la tienda: ' Total
   
   STOP RUN.

AgregarPerro.
   ADD 1 TO i
   MOVE Nombre TO PerrosTiendaData.Perros(i).NombrePerro
   MOVE Edad TO PerrosTiendaData.Perros(i).EdadPerro
   MOVE Raza TO PerrosTiendaData.Perros(i).RazaPerro
   MOVE Precio TO PerrosTiendaData.Perros(i).PrecioPerro.
   
BuscarPerroMasViejo.
   MOVE 1 TO i *> Inicializamos el contador
   MOVE 1 TO Total *> Inicializamos el total
   PERFORM VARYING i FROM 1 BY 1 UNTIL i > 3 *> Recorremos el arreglo
      IF PerrosTiendaData.Perros(i).EdadPerro > Total *> Comparamos la edad
         MOVE i TO Total *> Guardamos el índice del perro más viejo
      END-IF *> Fin de la condición
   END-PERFORM *> Fin del ciclo
   *> Imprimimos el perro más viejo
   DISPLAY 'Soy un animal llamado ' PerrosTiendaData.Perros(Total).NombrePerro 
   DISPLAY 'y tengo ' PerrosTiendaData.Perros(Total).EdadPerro ' años. Soy un perro de raza '
           PerrosTiendaData.Perros(Total).RazaPerro.

ImprimirPerros.
   MOVE 1 TO i
   PERFORM VARYING i FROM 1 BY 1 UNTIL i > 3
      DISPLAY 'Nombre: ' PerrosTiendaData.Perros(i).NombrePerro
      DISPLAY 'Edad: ' PerrosTiendaData.Perros(i).EdadPerro
      DISPLAY 'Raza: ' PerrosTiendaData.Perros(i).RazaPerro
      DISPLAY 'Precio: ' PerrosTiendaData.Perros(i).PrecioPerro
   END-PERFORM.
