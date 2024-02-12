package com.organization.app;

// Definición de la clase Animal
public class Animal {
    String nombre;
    int edad;

    public Animal(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    public String describir() {
        return "Soy un animal llamado " + nombre + " y tengo " + edad + " años.";
    }
}
