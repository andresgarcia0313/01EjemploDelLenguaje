<?php

// Definición de la clase Animal en donde una clase es como una plantilla para crear objetos con características y comportamientos similares.
class Animal {
  public $nombre;
  public $edad;

  // Método constructor para inicializar las propiedades de un objeto
  public function __construct($nombre, $edad) {
    $this->nombre = $nombre;
    $this->edad = $edad;
  }

  // Funcionalidad para obtener la descripción del animal
  public function describir() {
    return "Soy un animal llamado $this->nombre y tengo $this->edad años.";
  }
}

class Perro extends Animal {
  public $raza;
  public $precio;

  // Método constructor para inicializar las propiedades de un objeto
public function __construct($nombre, $edad, $raza, $precio) {
    parent::__construct($nombre, $edad);
    $this->raza = $raza;
    $this->precio = $precio;
  }

  // Método o función para ladrar porque los perros tienen esa funcionalidad!!!
  public function ladrar() {
    return "¡Guau!";
  }

  // Sobrescritura del método describir para incluir la raza del perro reemplazando el método de la clase padre
  public function describir() {
    return parent::describir() . " Soy un perro de raza $this->raza.";
  }
}

// Definición de la clase PerrosTienda para gestionar la tienda de perros
class PerrosTienda {
  public $perros;

  public function __construct() {
    $this->perros = []; // Inicialmente la tienda no tiene perros
  }

  // Método para contar la cantidad total de perros en la tienda
  public function contarPerros() {
    return count($this->perros);
  }

  // Método para agregar un nuevo perro a la tienda
  public function agregarPerro($perro) {
    $this->perros[] = $perro;
  }
}

class Facturar {
  public $perros;

  public function __construct() {
    $this->perros = []; // Inicialmente, the facturar has no dogs
  }

  public function comprarPerro($perro) {
    $this->perros[] = $perro;
  }

  public function comprarPerros($perros) {
    $this->perros = array_merge($this->perros, $perros);
  }

  public function obtenerTotal() {
    $total = 0;
    foreach ($this->perros as $perro) {
      $total += $perro->precio;
    }
    return $total;
  }

  public function obtenerPerros() {
    return $this->perros;
  }
}

// Algoritmo para encontrar el perro más viejo en un arreglo de perros
function encontrarPerroMasViejo($perros) {
  $perroMasViejo = $perros[0];
  foreach ($perros as $perro) {
    if ($perro->edad > $perroMasViejo->edad) {
      $perroMasViejo = $perro;
    }
  }
  return $perroMasViejo;
}

// Función para imprimir la descripción de cada perro en una lista
function imprimirPerros($perros) {
  echo "Los perros registrados:\n";
  foreach ($perros as $perro) {
    echo $perro->describir() . "\n";
  }
}

// Creación de una instancia de PerrosTienda
$tiendaDePerros = new PerrosTienda();

// Agregar algunos perros a la tienda
$objPerro = new Perro("Firulais", 3, "Labrador", 1000);
$tiendaDePerros->agregarPerro($objPerro);
$tiendaDePerros->agregarPerro(new Perro("Rex", 5, "Pastor Alemán", 1500));
$tiendaDePerros->agregarPerro(new Perro("Bobby", 7, "Chihuahua", 500));

// Uso del algoritmo para encontrar el perro más viejo
$perroMasViejo = encontrarPerroMasViejo($tiendaDePerros->perros);

// Impresión del resultado
echo "El perro de más edad:\n";
echo $perroMasViejo->describir() . "\n";
echo $perroMasViejo->ladrar() . "\n";

// Impresión de todos los perros en la tienda
echo "Perros en la tienda:\n";
imprimirPerros($tiendaDePerros->perros);

// Contar la cantidad total de perros en la tienda
echo "Total de perros en la tienda: " . $tiendaDePerros->contarPerros() . "\n";

// ANÁLISIS DE OBJETOS Y SUS TIPOS
// Muestra el tipo de objeto
echo gettype($objPerro) . "\n";
// Consultar a partir del objeto el nombre de la clase de la cual se instanció
echo get_class($objPerro) . "\n";
?>
