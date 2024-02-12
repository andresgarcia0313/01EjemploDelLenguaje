       IDENTIFICATION DIVISION.
       PROGRAM-ID. FundamentosDeProgramacion.
       AUTHOR. Usuario.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NOMBRE PIC X(10) VALUE 'Juan'.
       01 EDAD PIC 99 VALUE 30.
       01 ALTURA PIC 9(3)V99 VALUE 1.75.
       01 ES-ESTUDIANTE PIC X VALUE 'S'.

       PROCEDURE DIVISION.
           PERFORM V-CONDICIONAL
           PERFORM V-BUCLE
           PERFORM V-FUNCION
           PERFORM V-ARRAY
           PERFORM V-NODOS
           PERFORM V-BUSQUEDA
           PERFORM V-ORDENAMIENTO
           STOP RUN.
           
       V-CONDICIONAL.
           IF EDAD >= 18
               DISPLAY NOMBRE " es mayor de edad."
           ELSE
               DISPLAY NOMBRE " es menor de edad."
           END-IF.
           EXIT.
           
       V-BUCLE.
           PERFORM V-ITERACION VARYING I FROM 1 BY 1 UNTIL I > 5.
           EXIT.
           
       V-ITERACION.
           DISPLAY "Iteración número " I.
           EXIT.
           
       V-FUNCION.
           PERFORM V-SALUDAR USING NOMBRE.
           EXIT.
           
       V-SALUDAR SECTION USING NOMBRE.
           DISPLAY "¡Hola, " NOMBRE "!".
           EXIT.
           
       V-ARRAY.
           01 NUMEROS OCCURS 5 TIMES PIC 99 VALUE 1 2 3 4 5.
           DISPLAY "El primer número es: " NUMEROS(1).
           EXIT.
           
       V-NODOS.
           01 NODO1.
               05 VALOR1 PIC 99 VALUE 1.
               05 SIGUIENTE1 POINTER.
           01 NODO2.
               05 VALOR2 PIC 99 VALUE 2.
               05 SIGUIENTE2 POINTER.
           SET ADDRESS OF NODO2 TO SIGUIENTE1.
           DISPLAY "El valor del primer nodo es: " VALOR1.
           DISPLAY "El valor del segundo nodo es: " VALOR2.
           EXIT.
           
       V-BUSQUEDA.
           COMPUTE POSICION = 0.
           PERFORM V-LINEAL VARYING I FROM 1 BY 1 UNTIL I > 5
               IF NUMEROS(I) = 30
                   COMPUTE POSICION = I
                   EXIT PERFORM
               END-IF
           END-PERFORM.
           DISPLAY "El valor 30 está en el índice: " POSICION.
           EXIT.
           
       V-ORDENAMIENTO.
           PERFORM V-BUBBLESORT.
           DISPLAY "Números ordenados: " NUMEROS-DESORDENADOS.
           EXIT.
           
       V-BUBBLESORT.
           COMPUTE LEN = 5.
           PERFORM V-ITERACION-EXTERNA VARYING I FROM 1 BY 1 UNTIL I > 5
               PERFORM V-ITERACION-INTERNA VARYING J FROM 1 BY 1 UNTIL J > 4
                   IF NUMEROS-DESORDENADOS(J) > NUMEROS-DESORDENADOS(J + 1)
                       COMPUTE TEMP = NUMEROS-DESORDENADOS(J)
                       NUMEROS-DESORDENADOS(J) = NUMEROS-DESORDENADOS(J + 1)
                       NUMEROS-DESORDENADOS(J + 1) = TEMP
                   END-IF
               END-PERFORM
           END-PERFORM.
           EXIT.
           
       V-ITERACION-EXTERNA.
           EXIT.
           
       V-ITERACION-INTERNA.
           EXIT.
