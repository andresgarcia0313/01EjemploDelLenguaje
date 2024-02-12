// Definición de la clase Animal en donde una clase es como una plantilla para crear objetos con características y comportamientos similares.
class Animal {
  nombre: string;
  edad: number;

  constructor(nombre: string, edad: number) {
    // Método constructor para inicializar las propiedades de un objeto
    this.nombre = nombre; // Propiedad para almacenar el nombre del animal
    this.edad = edad; // Propiedad para almacenar la edad del animal
  }

  describir(): string {
    // Funcionalidad para obtener la descripción del animal
    return `Soy un animal llamado ${this.nombre} y tengo ${this.edad} años.`; // Retorna el texto de la descripción del animal
  }
}

class Perro extends Animal {
  // Definición de la clase Perro, que copia o "hereda" de la clase Animal las funciones y propiedades
  raza: string;
  precio: number;

  constructor(nombre: string, edad: number, raza: string, precio: number) {
    // Método constructor para inicializar las propiedades de un objeto
    super(nombre, edad);
    this.raza = raza;
    this.precio = precio;
  }

  ladrar(): string {
    // Método o función para ladrar por que los perros tienen esa funcionalidad!!!
    return "¡Guau!"; // Retorna el ladrido del perro
  }

  describir(): string {
    // Sobrescritura del método describir para incluir la raza del perro reemplazando el método de la clase padre
    return `${super.describir()} Soy un perro de raza ${this.raza}.`; // Retorna el texto de la descripción del perro y usa el método describir de la clase padre
  }
}

// Definición de la clase PerrosTienda para gestionar la tienda de perros
class PerrosTienda {
  perros: Perro[];

  constructor() {
    this.perros = []; // Inicialmente la tienda no tiene perros
  }

  contarPerros(): number {
    // Método para contar la cantidad total de perros en la tienda
    return this.perros.length;
  }

  agregarPerro(perro: Perro): void {
    // Método para agregar un nuevo perro a la tienda
    this.perros.push(perro);
  }
}

class Facturar {
  perros: Perro[];

  constructor() {
    this.perros = []; // Initially, the facturar has no dogs
  }

  comprarPerro(perro: Perro): void {
    this.perros.push(perro);
  }

  comprarPerros(perros: Perro[]): void {
    this.perros = this.perros.concat(perros);
  }

  obtenerTotal(): number {
    let total = 0;
    for (let perro of this.perros) {
      total += perro.precio;
    }
    return total;
  }

  obtenerPerros(): Perro[] {
    return this.perros;
  }
}

// Algoritmo para encontrar el perro más viejo en un arreglo de perros
const encontrarPerroMasViejo = (perros: Perro[]): Perro => {
  // Función que recibe un arreglo de perros y retorna el perro más viejo y esta por fuera de una clase
  let perroMasViejo = perros[0]; // Inicialmente el perro más viejo es el primero elemento de la lista o array de perros recibida
  for (let perro of perros) {
    // Recorre cada perro en la lista de perros
    if (perro.edad > perroMasViejo.edad) {
      // Realiza una comparación de mayor que en donde si la edad del perro actual es mayor que la edad del perro más viejo
      perroMasViejo = perro; // Asigna el perro actual dentro de la variable como el perro más viejo
    }
  }
  return perroMasViejo; // Retorna el perro más viejo encontrado por fuera de la función
};

// Función para imprimir la descripción de cada perro en una lista
const imprimirPerros = (perros: Perro[]): void => {
  console.log("Los perros registrados:");
  for (let perro of perros) {
    console.log(perro.describir());
  }
};

// Creación de una instancia de PerrosTienda
const tiendaDePerros = new PerrosTienda();

// Agregar algunos perros a la tienda

const objPerro = new Perro("Firulais", 3, "Labrador", 1000);
tiendaDePerros.agregarPerro(objPerro);
tiendaDePerros.agregarPerro(new Perro("Rex", 5, "Pastor Alemán", 1500));
tiendaDePerros.agregarPerro(new Perro("Bobby", 7, "Chihuahua", 500));

let myarray: any[] = [];
//Imprimir los metodos de la variable myarray
console.log(Object.getOwnPropertyNames(myarray));
// Uso del algoritmo para encontrar el perro más viejo
const perroMasViejo = encontrarPerroMasViejo(tiendaDePerros.perros);

// Impresión del resultado
console.log("El perro de más edad:");
console.log(perroMasViejo.describir()); // Salida: Soy un animal llamado Bobby y tengo 7 años. Soy un perro de raza Chihuahua.
console.log(perroMasViejo.ladrar()); // Salida: ¡Guau!

// Impresión de todos los perros en la tienda
console.log("Perros en la tienda:");
imprimirPerros(tiendaDePerros.perros);

// Contar la cantidad total de perros en la tienda
console.log(`Total de perros en la tienda: ${tiendaDePerros.contarPerros()}`);

//ANALISIS DE OBJETOS Y SUS TIPO
//Muestra el tipo de objeto
console.log(typeof objPerro);
//Consultar a partir del objeto el nombre de la clase de la cual se instancio
console.log(objPerro.constructor.name);
