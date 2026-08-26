--SXCRIPTS CORRECTOS
USE CrediCoreDB;

INSERT INTO Garantias.Vehiculos (Marca, Modelo, VIN_Chasis, Placa_Circulacion, Anio_Modelo, Color, No_Titulo_Propiedad) 
VALUES ('Toyota', 'Hilux', 'VINTY123456789', 'P-123ABC', 2018, 'Rojo', 'TIT-999888777');

--SCRIPTS MALOS

INSERT INTO Garantias.Vehiculos (Marca, Modelo, VIN_Chasis, Placa_Circulacion, Anio_Modelo, Color, No_Titulo_Propiedad) 
VALUES ('Nissan', 'Sentra', 'VINNS987654321', 'P-999XYZ', 2015, 'Gris', 'TIT-111222333');

--bueno

INSERT INTO Operaciones.Creditos (ID_Cliente, ID_Vehiculo, Monto_Capital, Tasa_Interes_Mensual) 
VALUES (1, 1, 25000.00, 3.5);

--malo

INSERT INTO Operaciones.Creditos (ID_Cliente, ID_Vehiculo, Monto_Capital, Tasa_Interes_Mensual) 
VALUES (2, 2, 5000.00, 2.5);