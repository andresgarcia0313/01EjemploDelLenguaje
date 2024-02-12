package main

import (
    "fmt"
)

// Definición de la estructura Animal
type Animal struct {
    nombre string
    edad   int
}

// Método describir para Animal
func (a Animal) describir() string {
    return fmt.Sprintf("Soy un animal llamado %s y tengo %d años.", a.nombre, a.edad)
}

// Definición de la estructura Perro que hereda de Animal
type Perro struct {
    Animal
    raza   string
    precio int
}

// Método ladrar para Perro
func (p Perro) ladrar() string {
    return "¡Guau!"
}

// Sobrescritura del método describir para incluir la raza del perro
func (p Perro) describir() string {
    return fmt.Sprintf("%s Soy un perro de raza %s.", p.Animal.describir(), p.raza)
}

// Definición de la estructura PerrosTienda para gestionar la tienda de perros
type PerrosTienda struct {
    perros []Perro
}

// Método para contar la cantidad total de perros en la tienda
func (pt *PerrosTienda) contarPerros() int {
    return len(pt.perros)
}

// Método para agregar un nuevo perro a la tienda
func (pt *PerrosTienda) agregarPerro(perro Perro) {
    pt.perros = append(pt.perros, perro)
}

// Función para encontrar el perro más viejo en un arreglo de perros
func encontrarPerroMasViejo(perros []Perro) Perro {
    perroMasViejo := perros[0]
    for _, perro := range perros {
        if perro.edad > perroMasViejo.edad {
            perroMasViejo = perro
        }
    }
    return perroMasViejo
}

// Función para imprimir la descripción de cada perro en una lista
func imprimirPerros(perros []Perro) {
    fmt.Println("Los perros registrados:")
    for _, perro := range perros {
        fmt.Println(perro.describir())
    }
}

func main() {
    // Creación de una instancia de PerrosTienda
    tiendaDePerros := PerrosTienda{}

    // Agregar algunos perros a la tienda
    tiendaDePerros.agregarPerro(Perro{Animal{"Firulais", 3}, "Labrador", 1000})
    tiendaDePerros.agregarPerro(Perro{Animal{"Rex", 5}, "Pastor Alemán", 1500})
    tiendaDePerros.agregarPerro(Perro{Animal{"Bobby", 7}, "Chihuahua", 500})

    // Uso del algoritmo para encontrar el perro más viejo
    perroMasViejo := encontrarPerroMasViejo(tiendaDePerros.perros)

    // Impresión del resultado
    fmt.Println("El perro de más edad:")
    fmt.Println(perroMasViejo.describir())
    fmt.Println(perroMasViejo.ladrar())

    // Impresión de todos los perros en la tienda
    fmt.Println("Perros en la tienda:")
    imprimirPerros(tiendaDePerros.perros)

    // Contar la cantidad total de perros en la tienda
    fmt.Printf("Total de perros en la tienda: %d\n", tiendaDePerros.contarPerros())
}
