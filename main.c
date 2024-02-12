#include <stdio.h> // Inclusión de la biblioteca estándar de E/S que permite el uso de printf y sprintf
#include <stdlib.h> // Inclusión de la biblioteca estándar que permite el uso de malloc y free que son funciones para asignar y liberar memoria dinámica
#include <string.h> // Inclusión de la biblioteca estándar que permite el uso de sprintf que es una función para formatear cadenas de caracteres

// Definición de la estructura Animal
typedef struct {
    char nombre[50];
    int edad;
} Animal;

// Función para describir un animal
char* describirAnimal(Animal *animal) {
    static char descripcion[100];
    sprintf(descripcion, "Soy un animal llamado %s y tengo %d años.", animal->nombre, animal->edad);
    return descripcion;
}



// Definición de la estructura Perro que hereda de Animal
typedef struct {
    Animal animal; // Incorporación de Animal como parte de la estructura Perro
    char raza[50];
    float precio;
} Perro;

// Función para describir un perro
char* describirPerro(Perro *perro) {
    static char descripcion[100];
    sprintf(descripcion, "%s Soy un perro de raza %s.", describirAnimal(&(perro->animal)), perro->raza);
    return descripcion;
}

// Función para que un perro ladre
char* ladrar() {
    return "¡Guau!";
}



// Definición de la estructura PerrosTienda
typedef struct {
    Perro *perros; // Un arreglo dinámico de perros
    int cantidad;
} PerrosTienda;

// Función para crear una nueva tienda de perros
PerrosTienda* nuevaTienda() {
    PerrosTienda *tienda = (PerrosTienda*)malloc(sizeof(PerrosTienda));
    tienda->perros = NULL;
    tienda->cantidad = 0;
    return tienda;
}

// Función para agregar un perro a la tienda
void agregarPerro(PerrosTienda *tienda, Perro *perro) {
    tienda->cantidad++;
    tienda->perros = (Perro*)realloc(tienda->perros, tienda->cantidad * sizeof(Perro));
    tienda->perros[tienda->cantidad - 1] = *perro;
}

// Función para encontrar el perro más viejo en la tienda
Perro* encontrarPerroMasViejo(PerrosTienda *tienda) {
    Perro *perroMasViejo = &(tienda->perros[0]);
    for (int i = 1; i < tienda->cantidad; i++) {
        if (tienda->perros[i].animal.edad > perroMasViejo->animal.edad) {
            perroMasViejo = &(tienda->perros[i]);
        }
    }
    return perroMasViejo;
}

// Función para imprimir los perros en la tienda
void imprimirPerros(PerrosTienda *tienda) {
    printf("Los perros registrados:\n");
    for (int i = 0; i < tienda->cantidad; i++) {
        printf("%s\n", describirPerro(&(tienda->perros[i])));
    }
}

int main() {
    // Creación de una nueva tienda de perros
    PerrosTienda *tiendaDePerros = nuevaTienda();

    // Creación y agregado de algunos perros a la tienda
    Perro firulais = { .animal = {"Firulais", 3}, .precio = 1000, .raza = "Labrador" };
    agregarPerro(tiendaDePerros, &firulais);

    Perro rex = { .animal = {"Rex", 5}, .precio = 1500, .raza = "Pastor Alemán" };
    agregarPerro(tiendaDePerros, &rex);

    Perro bobby = { .animal = {"Bobby", 7}, .precio = 500, .raza = "Chihuahua" };
    agregarPerro(tiendaDePerros, &bobby);

    // Encontrar y mostrar el perro más viejo
    Perro *perroMasViejo = encontrarPerroMasViejo(tiendaDePerros);
    printf("El perro de más edad:\n");
    printf("%s\n", describirPerro(perroMasViejo));
    printf("%s\n", ladrar());

    // Mostrar todos los perros en la tienda
    printf("Perros en la tienda:\n");
    imprimirPerros(tiendaDePerros);

    // Contar la cantidad total de perros en la tienda
    printf("Total de perros en la tienda: %d\n", tiendaDePerros->cantidad);

    // Liberar la memoria asignada dinámicamente
    free(tiendaDePerros->perros);
    free(tiendaDePerros);

    return 0;
}
