// Fundamentos de programación

// Variables y tipos de datos
let nombre = "Juan";
let edad = 30;
let altura = 1.75;
let esEstudiante = true;

// Estructuras de control - Condicionales
if (edad >= 18) {
    console.log(nombre + " es mayor de edad.");
} else {
    console.log(nombre + " es menor de edad.");
}

// Estructuras de control - Bucles
for (let i = 0; i < 5; i++) {
    console.log("Iteración número " + i);
}

// Funciones
function saludar(nombre) {
    console.log("¡Hola, " + nombre + "!");
}

saludar("María");

// Estructuras de datos básicas

// Arrays
let numeros = [1, 2, 3, 4, 5];
console.log("El primer número es: " + numeros[0]);

// Listas enlazadas (implementación básica)
class Nodo {
    constructor(valor) {
        this.valor = valor;
        this.siguiente = null;
    }
}

let nodo1 = new Nodo(1);
let nodo2 = new Nodo(2);
nodo1.siguiente = nodo2;
console.log("El valor del primer nodo es: " + nodo1.valor);
console.log("El valor del segundo nodo es: " + nodo1.siguiente.valor);

// Algoritmos básicos

// Algoritmo de búsqueda lineal
function busquedaLineal(arr, valor) {
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] === valor) {
            return i;
        }
    }
    return -1;
}

let arreglo = [10, 20, 30, 40, 50];
console.log("El valor 30 está en el índice: " + busquedaLineal(arreglo, 30));

// Algoritmo de ordenamiento - Bubble Sort
function bubbleSort(arr) {
    let len = arr.length;
    for (let i = 0; i < len; i++) {
        for (let j = 0; j < len - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                let temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
    return arr;
}

let numerosDesordenados = [3, 1, 4, 1, 5, 9, 2, 6, 5];
console.log("Números ordenados: " + bubbleSort(numerosDesordenados));
