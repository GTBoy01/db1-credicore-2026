-- 1. Creación de la BD, verificamos que no exista
IF DB_ID('CrediCoreDB') IS NULL
BEGIN
    CREATE DATABASE CrediCoreDB;
END

USE CrediCoreDB;

--Esquemas de Seguridad (Separados para mejorar la gestión futura)
CREATE SCHEMA Operaciones;
CREATE SCHEMA Garantias;

--Tabla de Clientes
CREATE TABLE Operaciones.Clientes(
    ID_Cliente INT IDENTITY(1,1) NOT NULL, -- Llave Primaria autoincremental
    Primer_Nombre VARCHAR(50) NOT NULL,
    Segundo_Nombre VARCHAR(50),
    Tercer_Nombre VARCHAR(100),
    Primer_Apellido VARCHAR(50) NOT NULL,
    Segundo_Apellido VARCHAR(50),
    Apellido_Casada VARCHAR(50),
    Numero_Personal VARCHAR(15) NOT NULL, --VARCHAR da mas seguridad
    Numero_Residencial VARCHAR(15),
    Correo VARCHAR(50),
    DPI_Cliente VARCHAR(13) NOT NULL, 
    Fecha_Inscripcion DATETIME DEFAULT GETDATE(),
    --RESTRICCIONES
    CONSTRAINT PK_Clientes_ID_Cliente PRIMARY KEY (ID_Cliente), --Creamos la primary Key
    CONSTRAINT UQ_Clientes_DPI_Cliente UNIQUE (DPI_Cliente) -- Restricción de no repeticion de DPI
);
GO

--Tabla de Garantías Vehiculares
CREATE TABLE Garantias.Vehiculos(
    ID_Vehiculo INT IDENTITY(1,1) NOT NULL, -- Llave Primaria
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    VIN_Chasis VARCHAR(100) NOT NULL,
    Placa_Circulacion VARCHAR(25) NOT NULL,
    Anio_Modelo INT NOT NULL, 
    Color VARCHAR(50) NOT NULL,
    No_Titulo_Propiedad VARCHAR(100) NOT NULL,
    --RESTRICCIONES
    CONSTRAINT PK_Vehiculos_ID_Vehiculo PRIMARY KEY (ID_Vehiculo),
    
    -- Bloquea cualquier vehículo menor a 2011
    CONSTRAINT CK_Vehiculos_Anio_Modelo CHECK (Anio_Modelo >= 2011),
    
    -- La combinación de Placa o Chasis debe ser única
    CONSTRAINT UQ_Vehiculos_VIN_Chasis UNIQUE (VIN_Chasis),
    CONSTRAINT UQ_Vehiculos_Placa_Circulacion UNIQUE (Placa_Circulacion)
);
GO

--Tabla de Préstamos
CREATE TABLE Operaciones.Creditos (
    ID_Credito INT IDENTITY(1,1) NOT NULL, -- Llave Primaria
    ID_Cliente INT, 
    ID_Vehiculo INT,
    Monto_Capital DECIMAL(18,2) NOT NULL, -- dieciocho enteros y 2 decimales
    Tasa_Interes_Mensual DECIMAL(8,4) NOT NULL, --Precision de 8 enteros y 4 decimales
    Estado_Credito TINYINT DEFAULT(1), -- TINYINT ya que guarda un solo numero
    Fecha_Desembolso DATETIME DEFAULT GETDATE(), -- Captura la fecha del servidor

    CONSTRAINT PK_Creditos_ID_Credito PRIMARY KEY (ID_Credito),
    -- La tasa de interés jamás puede ser negativa
    CONSTRAINT CK_Creditos_Tasa_Interes_Mensual CHECK (Tasa_Interes_Mensual >= 0),
    -- El monto otorgado debe ser estrictamente mayor a Q1,000
    CONSTRAINT CK_Creditos_Monto_Capital CHECK (Monto_Capital > 1000)
);
GO