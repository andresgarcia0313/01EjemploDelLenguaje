#include <iostream>  //iostream es la librería de código ya realizado que nos permite imprimir en consola
#include <vector>    //vector es la librería de código ya realizado que nos permite trabajar con vectores que son arreglos dinámicos
#include <algorithm> //algorithm es la librería de código ya realizado que nos permite trabajar con algoritmos como el sort y find

using namespace std; // std es el espacio de nombres que nos permite usar las funciones de la librería iostream sin escribir std:: antes de cada función

class Animal
{
public:
    Animal(string nombre, int edad) : nombre(nombre), edad(edad) {}
    string describir()
    {
        return "Soy un animal llamado " + nombre + " y tengo " + to_string(edad) + " años.";
    }

protected:
    string nombre;
    int edad;
};

class Perro : public Animal
{
public:
    Perro(string nombre, int edad, string raza, double precio) : Animal(nombre, edad), raza(raza), precio(precio) {}
    string ladrar()
    {
        return "¡Guau!";
    }
    string describir()
    {
        return Animal::describir() + " Soy un perro de raza " + raza + ".";
    }
    double getPrecio()
    {
        return precio;
    }

private:
    string raza;
    double precio;
};

class PerrosTienda
{
public:
    void agregarPerro(Perro *perro)
    {
        perros.push_back(perro);
    }
    int contarPerros()
    {
        return perros.size();
    }
    vector<Perro *> obtenerPerros()
    {
        return perros;
    }

private:
    vector<Perro *> perros;
};

Perro *encontrarPerroMasViejo(vector<Perro *> perros)
{
    Perro *perroMasViejo = perros[0];
    for (auto perro : perros)
    {
        if (perro->describir() > perroMasViejo->describir())
        {
            perroMasViejo = perro;
        }
    }
    return perroMasViejo;
}

void imprimirPerros(vector<Perro *> perros)
{
    cout << "Los perros registrados:" << endl;
    for (auto perro : perros)
    {
        cout << perro->describir() << endl;
    }
}

int main()
{
    PerrosTienda tiendaDePerros;

    Perro *objPerro = new Perro("Firulais", 3, "Labrador", 1000);
    tiendaDePerros.agregarPerro(objPerro);
    tiendaDePerros.agregarPerro(new Perro("Rex", 5, "Pastor Alemán", 1500));
    tiendaDePerros.agregarPerro(new Perro("Bobby", 7, "Chihuahua", 500));

    Perro *perroMasViejo = encontrarPerroMasViejo(tiendaDePerros.obtenerPerros());

    cout << "El perro de más edad:" << endl;
    cout << perroMasViejo->describir() << endl;
    cout << perroMasViejo->ladrar() << endl;

    cout << "Perros en la tienda:" << endl;
    imprimirPerros(tiendaDePerros.obtenerPerros());

    cout << "Total de perros en la tienda: " << tiendaDePerros.contarPerros() << endl;

    delete objPerro;
    for (auto perro : tiendaDePerros.obtenerPerros())
    {
        delete perro;
    }

    return 0;
}
