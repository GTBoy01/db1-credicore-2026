USE CrediCoreDB;

-- =========================================================================
-- REPORTE 1: Riesgo Financiero por Estado
-- Usamos CASE WHEN para traducir TINYINT (1, 2, 3) a texto legible
-- =========================================================================
SELECT 
    CASE Estado_Credito
        WHEN 1 THEN 'Activo'
        WHEN 2 THEN 'Atrasado'
        WHEN 3 THEN 'Pagado'
        ELSE 'Desconocido'
    END AS Estado_Del_Prestamo,
    SUM(Monto_Capital) AS Total_Capital_Prestado,
    AVG(Tasa_Interes_Mensual) AS Promedio_Tasa_Interes
FROM Operaciones.Creditos
GROUP BY Estado_Credito;

-- =========================================================================
--REPORTE 2: Clientes VIP (Uso de HAVING)
--Agrupamos por Cliente para encontrar a los que tienen más creditos
-- =========================================================================
SELECT 
    ID_Cliente,
    COUNT(ID_Credito) AS Total_Prestamos_Otorgados,
    SUM(Monto_Capital) AS Volumen_Total_Financiado
FROM Operaciones.Creditos
GROUP BY ID_Cliente
HAVING COUNT(ID_Credito) >= 5
ORDER BY Total_Prestamos_Otorgados DESC;
-- =========================================================================
-- REPORTE 3: Extremos Financieros
-- La consulta más rápida, sin agrupaciones
-- =========================================================================
SELECT 
    MAX(Monto_Capital) AS Prestamo_Mas_Grande,
    MIN(Monto_Capital) AS Prestamo_Mas_Pequeno
FROM Operaciones.Creditos;