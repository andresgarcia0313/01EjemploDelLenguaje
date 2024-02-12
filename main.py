# Definición de la clase Animal
class Animal:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    def describir(self):
        return f"Soy un animal llamado {self.nombre} y tengo {self.edad} años."

# Definición de la clase Perro que hereda de Animal
class Perro(Animal):
    def __init__(self, nombre, edad, raza):
        super().__init__(nombre, edad)
        self.raza = raza

    def ladrar(self):
        return "¡Guau!"

    def describir(self):
        return f"{super().describir()} Soy un perro de raza {self.raza}."

# Función para encontrar el perro más viejo en una lista de perros
def encontrar_perro_mas_viejo(perros):
    perro_mas_viejo = perros[0]
    for perro in perros:
        if perro.edad > perro_mas_viejo.edad:
            perro_mas_viejo = perro
    return perro_mas_viejo

# Función para imprimir la descripción de cada perro en una lista
def imprimir_perros(perros):
    print("Los perros registrados:")
    for perro in perros:
        print(perro.describir())

# Definición de la clase PerrosTienda para gestionar la tienda de perros
class PerrosTienda:
    def __init__(self):
        self.perros = []

    def contar_perros(self):
        return len(self.perros)

    def agregar_perro(self, perro):
        self.perros.append(perro)

# Creación de una instancia de PerrosTienda
tienda_de_perros = PerrosTienda()

# Agregar algunos perros a la tienda
tienda_de_perros.agregar_perro(Perro("Firulais", 3, "Labrador"))
tienda_de_perros.agregar_perro(Perro("Rex", 5, "Pastor Alemán"))
tienda_de_perros.agregar_perro(Perro("Bobby", 7, "Chihuahua"))

# Uso del algoritmo para encontrar el perro más viejo
perro_mas_viejo = encontrar_perro_mas_viejo(tienda_de_perros.perros)

# Impresión del resultado
print("El perro de más edad:")
print(perro_mas_viejo.describir())
print(perro_mas_viejo.ladrar())

# Impresión de todos los perros en la tienda
print("Perros en la tienda:")
imprimir_perros(tienda_de_perros.perros)

# Contar la cantidad total de perros en la tienda
print(f"Total de perros en la tienda: {tienda_de_perros.contar_perros()}")
