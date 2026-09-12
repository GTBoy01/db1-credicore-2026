USE CrediCoreDB;
--Sección B, Reporte Maestro con un INNER JOIN triple
SELECT 
    cl.Primer_Nombre AS 'Nombre del Cliente', 
    cl.Numero_Personal, 
    v.Marca AS 'Marca del Vehículo', 
    v.Placa_Circulacion, 
    cr.Monto_Capital AS 'Monto del Crédito', 
    cr.Estado_Credito AS 'Estado actual'
FROM Operaciones.Creditos cr
INNER JOIN Operaciones.Clientes cl 
    ON cr.ID_Cliente = cl.ID_Cliente
INNER JOIN Garantias.Vehiculos v 
    ON cr.ID_Vehiculo = v.ID_Vehiculo;

--Mineria de potenciales clientes, LEFT JOIN
--Clientes registrados que nunca han sacado un crédito
SELECT 
    cl.Primer_Nombre,
    cl.Primer_Apellido,
    cl.Numero_Personal
FROM Operaciones.Clientes cl
LEFT JOIN Operaciones.Creditos cr 
    ON cl.ID_Cliente = cr.ID_Cliente
WHERE cr.ID_Credito IS NULL;