// Definición de la clase Animal
class Animal {
  constructor(nombre, edad) {
    this.nombre = nombre;
    this.edad = edad;
  }

  // Método para obtener la descripción del animal
  describir() {
    return `Soy un animal llamado ${this.nombre} y tengo ${this.edad} años.`;
  }
}

// Definición de la clase Perro, que hereda de la clase Animal
class Perro extends Animal {
  constructor(nombre, edad, raza) {
    super(nombre, edad);
    this.raza = raza;
  }

  // Método para ladrar
  ladrar() {
    return "¡Guau!";
  }

  // Sobrescritura del método describir para incluir la raza del perro
  describir() {
    return `${super.describir()} Soy un perro de raza ${this.raza}.`;
  }
}

// Algoritmo para encontrar el perro más viejo en un arreglo de perros
function encontrarPerroMasViejo(perros) {
  let perroMasViejo = perros[0];
  for (let perro of perros) {
    if (perro.edad > perroMasViejo.edad) {
      perroMasViejo = perro;
    }
  }
  return perroMasViejo;
}

// Creación de una lista de perros
const listaDePerros = [
  new Perro("Firulais", 3, "Labrador"),
  new Perro("Rex", 5, "Pastor Alemán"),
  new Perro("Bobby", 7, "Chihuahua"),
];
// Función para realizar la impresión de los perros
function imprimirPerros(perros) {
  console.log("Los perros registrados:");
  for (let perro of perros) {
    console.log(perro.describir());
  }
}

// Uso del algoritmo para encontrar el perro más viejo
const perroMasViejo = encontrarPerroMasViejo(listaDePerros);

// Impresión del resultado
console.log("El perro de más edad:");
console.log(perroMasViejo.describir()); // Salida: Soy un animal llamado Bobby y tengo 7 años. Soy un perro de raza Chihuahua.
console.log(perroMasViejo.ladrar()); // Salida: ¡Guau!

// Impresión de todos los perros
imprimirPerros(listaDePerros);
