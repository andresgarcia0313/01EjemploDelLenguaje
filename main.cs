using System;
using System.Collections.Generic;

// Definición de la clase Animal
class Animal
{
    public string Nombre { get; set; }
    public int Edad { get; set; }

    public Animal(string nombre, int edad)
    {
        Nombre = nombre;
        Edad = edad;
    }

    public string Describir()
    {
        return $"Soy un animal llamado {Nombre} y tengo {Edad} años.";
    }
}

// Definición de la clase Perro que hereda de Animal
class Perro : Animal
{
    public string Raza { get; set; }

    public Perro(string nombre, int edad, string raza) : base(nombre, edad)
    {
        Raza = raza;
    }

    public string Ladrar()
    {
        return "¡Guau!";
    }

    public override string Describir()
    {
        return $"{base.Describir()} Soy un perro de raza {Raza}.";
    }
}

// Clase para gestionar la tienda de perros
class PerrosTienda
{
    private List<Perro> _perros;

    public PerrosTienda()
    {
        _perros = new List<Perro>();
    }

    public int ContarPerros()
    {
        return _perros.Count;
    }

    public void AgregarPerro(Perro perro)
    {
        _perros.Add(perro);
    }
}

class Program
{
    // Función para encontrar el perro más viejo en una lista de perros
    static Perro EncontrarPerroMasViejo(List<Perro> perros)
    {
        Perro perroMasViejo = perros[0];
        foreach (Perro perro in perros)
        {
            if (perro.Edad > perroMasViejo.Edad)
            {
                perroMasViejo = perro;
            }
        }
        return perroMasViejo;
    }

    // Función para imprimir la descripción de cada perro en una lista
    static void ImprimirPerros(List<Perro> perros)
    {
        Console.WriteLine("Los perros registrados:");
        foreach (Perro perro in perros)
        {
            Console.WriteLine(perro.Describir());
        }
    }

    static void Main(string[] args)
    {
        // Creación de una instancia de PerrosTienda
        PerrosTienda tiendaDePerros = new PerrosTienda();

        // Agregar algunos perros a la tienda
        tiendaDePerros.AgregarPerro(new Perro("Firulais", 3, "Labrador"));
        tiendaDePerros.AgregarPerro(new Perro("Rex", 5, "Pastor Alemán"));
        tiendaDePerros.AgregarPerro(new Perro("Bobby", 7, "Chihuahua"));

        // Uso del algoritmo para encontrar el perro más viejo
        Perro perroMasViejo = EncontrarPerroMasViejo(tiendaDePerros._perros);

        // Impresión del resultado
        Console.WriteLine("El perro de más edad:");
        Console.WriteLine(perroMasViejo.Describir());
        Console.WriteLine(perroMasViejo.Ladrar());

        // Impresión de todos los perros en la tienda
        Console.WriteLine("Perros en la tienda:");
        ImprimirPerros(tiendaDePerros._perros);

        // Contar la cantidad total de perros en la tienda
        Console.WriteLine($"Total de perros en la tienda: {tiendaDePerros.ContarPerros()}");
    }
}
