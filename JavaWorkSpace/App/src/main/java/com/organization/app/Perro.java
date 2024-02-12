package com.organization.app;
// Definición de la clase Perro que hereda de Animal
public class Perro extends Animal {
    String raza;

    public Perro(String nombre, int edad, String raza) {
        super(nombre, edad);
        this.raza = raza;
    }

    public String ladrar() {
        return "¡Guau!";
    }

    @Override
    public String describir() {
        return super.describir() + " Soy un perro de raza " + raza + ".";
    }
}
