package com.organization.app;

import java.util.ArrayList;
import java.util.List;

// Clase para gestionar la tienda de perros
public class PerrosTienda {
    private List<Perro> perros;

    public PerrosTienda() {
        perros = new ArrayList<>();
    }

    public int contarPerros() {
        return perros.size();
    }

    public void agregarPerro(Perro perro) {
        perros.add(perro);
    }
    public List<Perro> getPerros() {
        return this.perros;
    }
}
