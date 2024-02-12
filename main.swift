// Definición de la clase Animal
class Animal {
    let nombre: String
    let edad: Int
    
    init(nombre: String, edad: Int) {
        self.nombre = nombre
        self.edad = edad
    }
    
    func describir() -> String {
        return "Soy un animal llamado \(nombre) y tengo \(edad) años."
    }
}

// Definición de la clase Perro que hereda de Animal
class Perro: Animal {
    let raza: String
    let precio: Double
    
    init(nombre: String, edad: Int, raza: String, precio: Double) {
        self.raza = raza
        self.precio = precio
        super.init(nombre: nombre, edad: edad)
    }
    
    func ladrar() -> String {
        return "¡Guau!"
    }
    
    override func describir() -> String {
        return "\(super.describir()) Soy un perro de raza \(raza)."
    }
}

// Definición de la clase PerrosTienda
class PerrosTienda {
    var perros: [Perro]
    
    init() {
        self.perros = []
    }
    
    func contarPerros() -> Int {
        return perros.count
    }
    
    func agregarPerro(_ perro: Perro) {
        perros.append(perro)
    }
}

// Definición de la clase Facturar
class Facturar {
    var perros: [Perro]
    
    init() {
        self.perros = []
    }
    
    func comprarPerro(_ perro: Perro) {
        perros.append(perro)
    }
    
    func comprarPerros(_ perros: [Perro]) {
        self.perros += perros
    }
    
    func obtenerTotal() -> Double {
        var total: Double = 0
        for perro in perros {
            total += perro.precio
        }
        return total
    }
    
    func obtenerPerros() -> [Perro] {
        return perros
    }
}

// Algoritmo para encontrar el perro más viejo en un arreglo de perros
func encontrarPerroMasViejo(_ perros: [Perro]) -> Perro? {
    var perroMasViejo: Perro? = perros.first
    for perro in perros {
        if let masViejo = perroMasViejo {
            if perro.edad > masViejo.edad {
                perroMasViejo = perro
            }
        }
    }
    return perroMasViejo
}

// Función para imprimir la descripción de cada perro en una lista
func imprimirPerros(_ perros: [Perro]) {
    print("Los perros registrados:")
    for perro in perros {
        print(perro.describir())
    }
}

// Creación de una instancia de PerrosTienda
let tiendaDePerros = PerrosTienda()

// Agregar algunos perros a la tienda
tiendaDePerros.agregarPerro(Perro(nombre: "Firulais", edad: 3, raza: "Labrador", precio: 1000))
tiendaDePerros.agregarPerro(Perro(nombre: "Rex", edad: 5, raza: "Pastor Alemán", precio: 1500))
tiendaDePerros.agregarPerro(Perro(nombre: "Bobby", edad: 7, raza: "Chihuahua", precio: 500))

// Uso del algoritmo para encontrar el perro más viejo
if let perroMasViejo = encontrarPerroMasViejo(tiendaDePerros.perros) {
    // Impresión del resultado
    print("El perro de más edad:")
    print(perroMasViejo.describir()) // Salida: Soy un animal llamado Bobby y tengo 7 años. Soy un perro de raza Chihuahua.
    print(perroMasViejo.ladrar()) // Salida: ¡Guau!
}

// Impresión de todos los perros en la tienda
print("Perros en la tienda:")
imprimirPerros(tiendaDePerros.perros)

// Contar la cantidad total de perros en la tienda
print("Total de perros en la tienda: \(tiendaDePerros.contarPerros())")
