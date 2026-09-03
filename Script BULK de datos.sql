USE CrediCoreDB;
GO

BULK INSERT Operaciones.Creditos 
FROM '/var/opt/mssql/data/creditos.txt' 
WITH (
    FIELDTERMINATOR = '|', 
    ROWTERMINATOR = '0x0a'
);