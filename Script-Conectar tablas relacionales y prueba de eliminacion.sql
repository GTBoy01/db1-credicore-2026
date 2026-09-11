USE CrediCoreDB;
-- 1. Conectar Créditos con Clientes
ALTER TABLE Operaciones.Creditos
ADD CONSTRAINT FK_Creditos_Clientes 
FOREIGN KEY (ID_Cliente) REFERENCES Operaciones.Clientes(ID_Cliente);

-- 2. Conectar Créditos con Vehículos en Garantía
ALTER TABLE Operaciones.Creditos
ADD CONSTRAINT FK_Creditos_Vehiculos 
FOREIGN KEY (ID_Vehiculo) REFERENCES Garantias.Vehiculos(ID_Vehiculo);

--Probamos a eliminar un cliente
DELETE FROM Operaciones.Clientes 
WHERE ID_Cliente = 2002;

