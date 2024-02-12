' Definición de la clase Animal
Public Class Animal
    Public Property Nombre As String
    Public Property Edad As Integer

    ' Método constructor
    Public Sub New(ByVal nombre As String, ByVal edad As Integer)
        Me.Nombre = nombre
        Me.Edad = edad
    End Sub

    ' Funcionalidad para describir el animal
    Public Function Describir() As String
        Return $"Soy un animal llamado {Nombre} y tengo {Edad} años."
    End Function
End Class

' Definición de la clase Perro, que hereda de Animal
Public Class Perro Inherits Animal
    Public Property Raza As String
    Public Property Precio As Integer

    ' Método constructor
    Public Sub New(ByVal nombre As String, ByVal edad As Integer, ByVal raza As String, ByVal precio As Integer)
        MyBase.New(nombre, edad)
        Me.Raza = raza
        Me.Precio = precio
    End Sub

    ' Método para que el perro ladre
    Public Function Ladrar() As String
        Return "¡Guau!"
    End Function

    ' Sobrescritura del método Describir para incluir la raza del perro
    Public Overrides Function Describir() As String
        Return $"{MyBase.Describir()} Soy un perro de raza {Raza}."
    End Function
End Class

' Definición de la clase PerrosTienda para gestionar la tienda de perros
Public Class PerrosTienda
    Private Perros As New List(Of Perro)

    ' Método para contar la cantidad total de perros en la tienda
    Public Function ContarPerros() As Integer
        Return Perros.Count
    End Function

    ' Método para agregar un nuevo perro a la tienda
    Public Sub AgregarPerro(ByVal perro As Perro)
        Perros.Add(perro)
    End Sub
End Class

' Definición de la clase Facturar para manejar las compras de perros
Public Class Facturar
    Private Perros As New List(Of Perro)

    ' Método para comprar un perro
    Public Sub ComprarPerro(ByVal perro As Perro)
        Perros.Add(perro)
    End Sub

    ' Método para comprar varios perros
    Public Sub ComprarPerros(ByVal perros As List(Of Perro))
        Me.Perros.AddRange(perros)
    End Sub

    ' Método para obtener el total de la compra
    Public Function ObtenerTotal() As Integer
        Dim total As Integer = 0
        For Each perro As Perro In Perros
            total += perro.Precio
        Next
        Return total
    End Function

    ' Método para obtener la lista de perros comprados
    Public Function ObtenerPerros() As List(Of Perro)
        Return Perros
    End Function
End Class

Module Module1
    ' Algoritmo para encontrar el perro más viejo en una lista de perros
    Public Function EncontrarPerroMasViejo(ByVal perros As List(Of Perro)) As Perro
        Dim perroMasViejo As Perro = perros(0)
        For Each perro As Perro In perros
            If perro.Edad > perroMasViejo.Edad Then
                perroMasViejo = perro
            End If
        Next
        Return perroMasViejo
    End Function

    ' Función para imprimir la descripción de cada perro en una lista
    Public Sub ImprimirPerros(ByVal perros As List(Of Perro))
        Console.WriteLine("Los perros registrados:")
        For Each perro As Perro In perros
            Console.WriteLine(perro.Describir())
        Next
    End Sub

    Sub Main()
        ' Creación de una instancia de PerrosTienda
        Dim tiendaDePerros As New PerrosTienda()

        ' Agregar algunos perros a la tienda
        tiendaDePerros.AgregarPerro(New Perro("Firulais", 3, "Labrador", 1000))
        tiendaDePerros.AgregarPerro(New Perro("Rex", 5, "Pastor Alemán", 1500))
        tiendaDePerros.AgregarPerro(New Perro("Bobby", 7, "Chihuahua", 500))

        ' Uso del algoritmo para encontrar el perro más viejo
        Dim perroMasViejo As Perro = EncontrarPerroMasViejo(tiendaDePerros.Perros)

        ' Impresión del resultado
        Console.WriteLine("El perro de más edad:")
        Console.WriteLine(perroMasViejo.Describir())
        Console.WriteLine(perroMasViejo.Ladrar())

        ' Impresión de todos los perros en la tienda
        Console.WriteLine("Perros en la tienda:")
        ImprimirPerros(tiendaDePerros.Perros)

        ' Contar la cantidad total de perros en la tienda
        Console.WriteLine($"Total de perros en la tienda: {tiendaDePerros.ContarPerros()}")

        ' Consultar el tipo de objeto
        Dim objPerro As New Perro("Firulais", 3, "Labrador", 1000)
        Console.WriteLine(objPerro.GetType().ToString())

        ' Consultar la clase de la cual se instanció
        Console.WriteLine(objPerro.GetType().BaseType().Name)

        Console.ReadLine()
    End Sub
End Module
