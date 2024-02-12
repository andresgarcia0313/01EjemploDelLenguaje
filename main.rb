  class Animal
    attr_reader :nombre, :edad
    def initialize(nombre, edad)
      @nombre = nombre
      @edad = edad
    end
  
    def describir
      "Soy un animal llamado #{@nombre} y tengo #{@edad} años."
    end
  end
  
  class Perro < Animal
    attr_reader :raza, :precio
  
    def initialize(nombre, edad, raza, precio)
      super(nombre, edad)
      @raza = raza
      @precio = precio
    end
  
    def ladrar
      "¡Guau!"
    end
  
    def describir
      "#{super} Soy un perro de raza #{@raza}."
    end
  end
  
  class PerrosTienda
    def initialize
      @perros = []
    end
  
    def contar_perros
      @perros.length
    end
  
    def agregar_perro(perro)
      @perros.push(perro)
    end
  end
  
  class Facturar
    def initialize 
      @perros = [] 
    end
  
    def comprar_perro(perro)
      @perros.push(perro)
    end
  
    def comprar_perros(perros)
      @perros.concat(perros)
    end
  
    def obtener_total
      @perros.sum(&:precio)
    end
  
    def obtener_perros
      @perros
    end
  end
  
  def encontrar_perro_mas_viejo(perros)
    perros.max_by(&:edad)
  end
  
  def imprimir_perros(perros)
    puts "Los perros registrados:"
    perros.each { |perro| puts perro.describir }
  end
  
  tienda_de_perros = PerrosTienda.new
  
  obj_perro = Perro.new("Firulais", 3, "Labrador", 1000)
  tienda_de_perros.agregar_perro(obj_perro)
  tienda_de_perros.agregar_perro(Perro.new("Rex", 5, "Pastor Alemán", 1500))
  tienda_de_perros.agregar_perro(Perro.new("Bobby", 7, "Chihuahua", 500))
  
  myarray = []
  puts myarray.methods
  
  perro_mas_viejo = encontrar_perro_mas_viejo(tienda_de_perros.perros)
  
  puts "El perro de más edad:"
  puts perro_mas_viejo.describir
  puts perro_mas_viejo.ladrar
  
  puts "Perros en la tienda:"
  imprimir_perros(tienda_de_perros.perros)
  
  puts "Total de perros en la tienda: #{tienda_de_perros.contar_perros}"
  
  puts obj_perro.class
  puts obj_perro.class.superclass
  