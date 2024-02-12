module AnimalModule
  implicit none

  type :: Animal
    character(len=50) :: nombre
    integer :: edad
  contains
    procedure :: describir
  end type Animal

  type, extends(Animal) :: Perro
    character(len=50) :: raza
    real :: precio
  contains
    procedure :: ladrar
    procedure :: describir => describirPerro
  end type Perro

contains

  ! Constructor para la clase Animal
  subroutine initAnimal(this, nombre, edad)
    class(Animal), intent(inout) :: this
    character(len=*), intent(in) :: nombre
    integer, intent(in) :: edad
    
    this%nombre = nombre
    this%edad = edad
  end subroutine initAnimal

  ! Método para describir un animal
  function describir(this) result(description)
    class(Animal), intent(in) :: this
    character(len=:), allocatable :: description

    description = 'Soy un animal llamado ' // this%nombre // ' y tengo ' // &
                  trim(adjustl(str(this%edad))) // ' años.'
  end function describir

  ! Método para ladridos de un perro
  function ladrar(this) result(sound)
    class(Perro), intent(in) :: this
    character(len=10) :: sound

    sound = '¡Guau!'
  end function ladrar

  ! Método para describir un perro (sobrescritura)
  function describirPerro(this) result(description)
    class(Perro), intent(in) :: this
    character(len=:), allocatable :: description

    description = describir(this) // ' Soy un perro de raza ' // this%raza // '.'
  end function describirPerro

end module AnimalModule

program Main
  use AnimalModule
  implicit none

  type(Perro) :: objPerro
  type(PerrosTienda) :: tiendaDePerros
  type(Perro) :: perroMasViejo
  type(Facturar) :: facturar
  integer :: i

  ! Inicialización de perros y tienda
  call initAnimal(objPerro, 'Firulais', 3)
  objPerro%raza = 'Labrador'
  objPerro%precio = 1000.0
  call tiendaDePerros%agregarPerro(objPerro)

  call initAnimal(objPerro, 'Rex', 5)
  objPerro%raza = 'Pastor Alemán'
  objPerro%precio = 1500.0
  call tiendaDePerros%agregarPerro(objPerro)

  call initAnimal(objPerro, 'Bobby', 7)
  objPerro%raza = 'Chihuahua'
  objPerro%precio = 500.0
  call tiendaDePerros%agregarPerro(objPerro)

  ! Encontrar el perro más viejo
  perroMasViejo = tiendaDePerros%encontrarPerroMasViejo()

  ! Impresión del resultado
  print *, 'El perro de más edad:'
  print *, describirPerro(perroMasViejo)
  print *, ladrar(perroMasViejo)

  ! Impresión de todos los perros en la tienda
  print *, 'Perros en la tienda:'
  do i = 1, tiendaDePerros%contarPerros()
     print *, describirPerro(tiendaDePerros%obtenerPerro(i))
  end do

  ! Contar la cantidad total de perros en la tienda
  print *, 'Total de perros en la tienda: ', tiendaDePerros%contarPerros()

  ! Facturación
  call facturar%comprarPerro(perroMasViejo)
  print *, 'Total de la factura:', facturar%obtenerTotal()

end program Main
