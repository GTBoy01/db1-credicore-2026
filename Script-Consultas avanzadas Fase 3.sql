USE CrediCoreDB;

--Parte C, subconsultas

--1. El filtro dinámico (subconsulta en el WHERE )
SELECT 
    cl.Primer_Nombre AS 'Nombre del Cliente',
    cl.Primer_Apellido AS 'Apellido del Cliente',
    cr.Monto_Capital AS 'Monto del Crédito'
FROM Operaciones.Creditos cr
INNER JOIN Operaciones.Clientes cl 
    ON cr.ID_Cliente = cl.ID_Cliente
WHERE cr.Monto_Capital > (
    -- Esta es la consulta interna que calcula el promedio en milisegundos
    SELECT AVG(Monto_Capital) 
    FROM Operaciones.Creditos
)
AND cl.ID_Cliente != 2002;

--2. Patrones anidados (Subconsulta con IN)
SELECT 
    cl.Primer_Nombre AS 'Nombre del Cliente', 
    cr.ID_Credito AS 'Numero de Credito'
FROM Operaciones.Creditos cr
INNER JOIN Operaciones.Clientes cl 
    ON cr.ID_Cliente = cl.ID_Cliente
WHERE cr.ID_Vehiculo IN (
    -- La consulta interna evalúa el año y devuelve una lista de IDs permitidos
    SELECT ID_Vehiculo 
    FROM Garantias.Vehiculos 
    WHERE Anio_Modelo <= 2011
);

--Consulta por Vehiculos <=2011 con créditos activos
-- Demostración de ausencia de relación
SELECT 
    v.ID_Vehiculo, 
    v.Anio_Modelo, 
    cr.ID_Credito AS 'Credito_Asociado'
FROM Garantias.Vehiculos v
LEFT JOIN Operaciones.Creditos cr 
    ON v.ID_Vehiculo = cr.ID_Vehiculo
WHERE v.Anio_Modelo <= 2011;