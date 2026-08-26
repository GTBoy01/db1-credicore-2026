--Creacion de usuario desde sa
CREATE LOGIN Dev_CrediCore WITH PASSWORD = 'TuPasswordSeguro2026!';
CREATE USER Dev_CrediCore FOR LOGIN Dev_CrediCore;
ALTER ROLE db_owner ADD MEMBER Dev_CrediCore;
