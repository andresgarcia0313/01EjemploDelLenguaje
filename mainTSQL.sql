-- Definición de una tabla para almacenar los perros
CREATE TABLE Perros
(
  Nombre NVARCHAR(50),
  Edad INT,
  Raza NVARCHAR(50),
  Precio INT
);
GO
-- Procedimiento almacenado para agregar un perro a la tienda
CREATE PROCEDURE AgregarPerro
  @Nombre NVARCHAR(50),
  @Edad INT,
  @Raza NVARCHAR(50),
  @Precio INT
AS
BEGIN
  INSERT INTO Perros
    (Nombre, Edad, Raza, Precio)
  VALUES
    (@Nombre, @Edad, @Raza, @Precio);
END;
GO
-- Función para obtener la descripción de un perro
CREATE FUNCTION DescribirPerro (@Nombre NVARCHAR(50), @Edad INT, @Raza NVARCHAR(50))
RETURNS NVARCHAR(200)
AS
BEGIN
  DECLARE @Descripcion NVARCHAR(200);
  SET @Descripcion = 'Soy un animal llamado ' + @Nombre + ' y tengo ' + CAST(@Edad AS NVARCHAR(10)) + ' años. Soy un perro de raza ' + @Raza + '.';
  RETURN @Descripcion;
END;
GO
-- Procedimiento almacenado para encontrar el perro más viejo
CREATE PROCEDURE EncontrarPerroMasViejo
AS
BEGIN
  SELECT TOP 1
    Nombre, Edad, Raza
  FROM Perros
  ORDER BY Edad DESC;
END;
GO
-- Procedimiento almacenado para imprimir la descripción de todos los perros
CREATE PROCEDURE ImprimirPerros
AS
BEGIN
  DECLARE @Nombre NVARCHAR(50);
  DECLARE @Edad INT;
  DECLARE @Raza NVARCHAR(50);
  DECLARE @Descripcion NVARCHAR(200);

  DECLARE PerrosCursor CURSOR FOR SELECT Nombre, Edad, Raza
  FROM Perros;

  OPEN PerrosCursor;
  FETCH NEXT FROM PerrosCursor INTO @Nombre, @Edad, @Raza;
  WHILE @@FETCH_STATUS = 0
  BEGIN
    SET @Descripcion = dbo.DescribirPerro(@Nombre, @Edad, @Raza);
    PRINT @Descripcion;
    FETCH NEXT FROM PerrosCursor INTO @Nombre, @Edad, @Raza;
  END;

  CLOSE PerrosCursor;
  DEALLOCATE PerrosCursor;
END;
GO
-- Uso de los procedimientos almacenados y funciones
EXEC AgregarPerro 'Firulais', 3, 'Labrador', 1000;
EXEC AgregarPerro 'Rex', 5, 'Pastor Alemán', 1500;
EXEC AgregarPerro 'Bobby', 7, 'Chihuahua', 500;

-- Encontrar el perro más viejo
EXEC EncontrarPerroMasViejo;

-- Imprimir descripción de todos los perros
EXEC ImprimirPerros;
