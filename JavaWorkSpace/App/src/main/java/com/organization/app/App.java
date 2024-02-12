package com.organization.app;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.Level;

public class App {
    private static final Logger logger = Logger.getLogger(App.class.getName());
    // Función para encontrar el perro más viejo en una lista de perros
    static Perro encontrarPerroMasViejo(List<Perro> perros) {
        Perro perroMasViejo = perros.get(0);
        for (Perro perro : perros) {
            if (perro.edad > perroMasViejo.edad) {
                perroMasViejo = perro;
            }
        }
        return perroMasViejo;
    }

    // Función para imprimir la descripción de cada perro en una lista
    static void imprimirPerros(List<Perro> perros) {
        logger.info("Los perros registrados:");
        for (Perro perro : perros) {
            if (logger.isLoggable(Level.INFO)) {
                logger.info(perro.describir());
            }
        }
    }

    public static void main(String[] args) {
        // Creación de una instancia de PerrosTienda
        PerrosTienda tiendaDePerros = new PerrosTienda();

        // Agregar algunos perros a la tienda
        tiendaDePerros.agregarPerro(new Perro("Firulais", 3, "Labrador"));
        tiendaDePerros.agregarPerro(new Perro("Rex", 5, "Pastor Alemán"));
        tiendaDePerros.agregarPerro(new Perro("Bobby", 7, "Chihuahua"));

        // Uso del algoritmo para encontrar el perro más viejo
        Perro perroMasViejo = encontrarPerroMasViejo(tiendaDePerros.getPerros());

        // Impresión del resultado
        logger.info("El perro de más edad:");
        if (logger.isLoggable(Level.INFO)) {
            logger.info(perroMasViejo.describir());
        }
        if (logger.isLoggable(Level.INFO)) {
            logger.info(perroMasViejo.ladrar());
        }

        // Impresión de todos los perros en la tienda
        logger.info("Perros en la tienda:");
        imprimirPerros(tiendaDePerros.getPerros());

        // Contar la cantidad total de perros en la tienda
        if (logger.isLoggable(Level.INFO)) {
            logger.info(String.format("Total de perros en la tienda: %d", tiendaDePerros.contarPerros()));
        }
    }
}
