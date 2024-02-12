-- Definición de la tabla animal en donde se almacenan los datos de los animales
CREATE TABLE IF NOT EXISTS animal (
    nombre VARCHAR(50),
    edad INTEGER
);

-- Definición de la tabla perro para almacenar los datos específicos de los perros
CREATE TABLE IF NOT EXISTS perro (
    id_animal SERIAL PRIMARY KEY,
    raza VARCHAR(50),
    precio INTEGER
);

-- Función para insertar un nuevo animal en la tabla animal
CREATE OR REPLACE FUNCTION insertar_animal(nombre VARCHAR, edad INTEGER)
RETURNS VOID AS $$
BEGIN
    INSERT INTO animal VALUES (nombre, edad);
END;
$$ LANGUAGE plpgsql;

-- Función para crear un nuevo perro
CREATE OR REPLACE FUNCTION crear_perro(nombre VARCHAR, edad INTEGER, raza VARCHAR, precio INTEGER)
RETURNS VOID AS $$
DECLARE
    id_animal INTEGER;
BEGIN
    -- Insertar el animal en la tabla animal
    INSERT INTO animal (nombre, edad) VALUES (nombre, edad) RETURNING id_animal INTO id_animal;
    
    -- Insertar los datos específicos del perro en la tabla perro
    INSERT INTO perro (id_animal, raza, precio) VALUES (id_animal, raza, precio);
END;
$$ LANGUAGE plpgsql;

-- Función para describir un perro
CREATE OR REPLACE FUNCTION describir_perro(nombre VARCHAR)
RETURNS VARCHAR AS $$
DECLARE
    descripcion VARCHAR;
BEGIN
    SELECT CONCAT('Soy un perro llamado ', nombre, ' y tengo ', edad::TEXT, ' años.') INTO descripcion FROM animal WHERE nombre = describir_perro.nombre;
    RETURN descripcion;
END;
$$ LANGUAGE plpgsql;

-- Función para hacer ladrar a un perro
CREATE OR REPLACE FUNCTION ladrar_perro()
RETURNS VARCHAR AS $$
BEGIN
    RETURN '¡Guau!';
END;
$$ LANGUAGE plpgsql;

-- Función para contar perros en la tienda
CREATE OR REPLACE FUNCTION contar_perros()
RETURNS INTEGER AS $$
DECLARE
    cantidad INTEGER;
BEGIN
    SELECT COUNT(*) INTO cantidad FROM perro;
    RETURN cantidad;
END;
$$ LANGUAGE plpgsql;

-- Función para imprimir la descripción de los perros en la tienda
CREATE OR REPLACE FUNCTION imprimir_perros()
RETURNS TABLE (descripcion VARCHAR) AS $$
BEGIN
    RETURN QUERY SELECT describir_perro(nombre) FROM animal;
END;
$$ LANGUAGE plpgsql;

-- Función para agregar un perro a la tienda
CREATE OR REPLACE FUNCTION agregar_perro_tienda(nombre VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO perros_tienda SELECT id_animal FROM animal WHERE nombre = agregar_perro_tienda.nombre;
END;
$$ LANGUAGE plpgsql;

-- Función para encontrar el perro más viejo en la tienda
CREATE OR REPLACE FUNCTION encontrar_perro_mas_viejo()
RETURNS TABLE (descripcion VARCHAR) AS $$
BEGIN
    RETURN QUERY SELECT describir_perro(nombre) FROM animal ORDER BY edad DESC LIMIT 1;
END;
$$ LANGUAGE plpgsql;
