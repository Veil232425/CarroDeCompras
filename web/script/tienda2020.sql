----------------------------------------------
-- Base de Datos : tienda2020
-- Fecha : 20-Junio-2020
----------------------------------------------
use tienda2020;

-- Tabla : Categorias
DROP TABLE IF EXISTS Categorias;
CREATE TABLE Categorias(
    IdCategoria CHAR(5) NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
    Imagen VARCHAR(50) NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdCategoria),
    CHECK(Estado IN ('0','1'))
);

INSERT INTO Categorias VALUES('CAT01','Televisores','CAT01.jpg','1'),
('CAT02','Refrigeradoras','CAT02.jpg','1'),
('CAT03','Lavadoras','CAT03.jpg','1'),
('CAT04','Cocina','CAT04.jpg','1'),
('CAT05','Equipos de Sonido','CAT05.jpg','1'),
('CAT06','BlueRay','CAT06.jpg','1');

-- Tabla : Productos
DROP TABLE IF EXISTS Productos;
CREATE TABLE Productos(
    IdProducto CHAR(6) NOT NULL,
    IdCategoria CHAR(5) NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
    Imagen VARCHAR(50) NOT NULL,
    PrecioUnidad DECIMAL NOT NULL,
    Stock INT NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdProducto),
    FOREIGN KEY(IdCategoria) REFERENCES Categorias(IdCategoria),
    CHECK(PrecioUnidad > 0),
    CHECK(Stock > 0),
    CHECK(Estado IN ('0','1'))
);

INSERT INTO Productos 
VALUES('PRO001','CAT01','Televisor LG','PRO001.jpg',1200,10,'1'),
('PRO002','CAT01','Televisor SONY','PRO002.jpg',1800,10,'1'),
('PRO003','CAT01','Televisor SAMSUNG','PRO003.jpg',1500,10,'1'),
('PRO004','CAT02','Refrigeradora AIWA','PRO004.jpg',1800,5,'1'),
('PRO005','CAT02','Refrigeradora G&E','PRO005.jpg',2200,5,'1'),
('PRO006','CAT02','Refrigeradora SAMSUNG','PRO006.jpg',1900,5,'1'),
('PRO007','CAT03','Lavadora MIRAY','PRO007.jpg',600,10,'1'),
('PRO008','CAT03','Lavadora G&E','PRO008.jpg',1200,10,'1'),
('PRO009','CAT03','Lavadora FAEDA','PRO009.jpg',700,10,'1'),
('PRO010','CAT04','Cocina Coldex','PRO010.jpg',600,10,'1'),
('PRO011','CAT04','Cocina MIRAY','PRO011.jpg',400,10,'1'),
('PRO012','CAT04','Cocina MABE','PRO012.jpg',300,10,'1'),
('PRO013','CAT05','Equipo de Sonido LG','PRO013.jpg',1500,5,'1'),
('PRO014','CAT05','Equipo de Sonido SONY','PRO014.jpg',1800,5,'1'),
('PRO015','CAT05','Equipo de Sonido SAMSUNG','PRO015.jpg',1600,5,'1'),
('PRO016','CAT06','Blueray LG','PRO016.jpg',300,20,'1'),
('PRO017','CAT06','BlueRay SONY','PRO017.jpg',500,20,'1'),
('PRO018','CAT06','BlueRay SAMSUNG','PRO018.jpg',400,20,'1');

-- STORE PROCEDURE
DROP PROCEDURE IF EXISTS ListaCategorias;
DELIMITER @@
CREATE PROCEDURE ListaCategorias()
BEGIN
    SELECT * FROM Categorias;
END @@
DELIMITER ;


DROP PROCEDURE IF EXISTS ListaProductos;
DELIMITER @@
CREATE PROCEDURE ListaProductos(IdCat CHAR(5))
BEGIN
    SELECT * FROM Productos WHERE IdCategoria = IdCat;
END @@
DELIMITER ;

DROP PROCEDURE IF EXISTS BuscaProducto;
DELIMITER @@
CREATE PROCEDURE BuscaProducto(Id CHAR(6))
BEGIN
    SELECT * FROM Productos WHERE IdProducto = Id;
END @@
DELIMITER ;

CALL BuscaProducto('PRO004')

-- Tabla : Clientes
DROP TABLE IF EXISTS Clientes;
CREATE TABLE Clientes(
    IdCliente CHAR(8) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Nombres VARCHAR(50) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Sexo CHAR(1) NOT NULL,
    Correo VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdCliente),
    CHECK(Sexo IN ('M','F')),
    CHECK(Estado IN ('0','1'))
);

INSERT INTO Clientes VALUES('CLI00001','RIVERA RIOS','JUAN CARLOS',
'AV.LIMA 1234-CERCADO','1990-05-01','M','jrivera@gmail.com','1234','1');
INSERT INTO Clientes VALUES('CLI00002','TORRES DURAN','CLAUDIA',
'AV.PRIMAVERA 1234-SURCO','1991-07-11','F','ctorres@gmail.com','1234','1');
INSERT INTO Clientes VALUES('CLI00003','VILLAR RAMOS','WALTER ISMAEL',
'AV.ARENALES 1525-LINCE','1989-12-01','M','wvillar@gmail.com','1234','1');

SELECT * FROM Clientes;

-- Tabla : Ventas
DROP TABLE IF EXISTS Ventas;
CREATE TABLE Ventas(
    IdVenta CHAR(10) NOT NULL,
    IdCliente CHAR(8) NOT NULL,
    FechaVenta DATE NOT NULL,
    MontoTotal DECIMAL NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdCliente,IdVenta),
    CHECK(MontoTotal > 0),

    CHECK(Estado IN ('0','1'))
);

-- Tabla : Detalle
DROP TABLE IF EXISTS Detalle;
CREATE TABLE Detalle(
    IdVenta CHAR(10) NOT NULL,
    IdProducto CHAR(8) NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnidad DECIMAL NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdVenta, IdProducto),
    FOREIGN KEY(IdVenta) REFERENCES Ventas(IdVenta),
    CHECK(Cantidad > 0),
    CHECK(PrecioUnidad >0),
    CHECK(Estado IN ('0','1'))
);

-- Store Procedure : InsertaVenta
DROP PROCEDURE IF EXISTS InsertaVenta;
DELIMITER @@
CREATE PROCEDURE InsertaVenta(
    IdVenta CHAR(10),
    IdCliente CHAR(8),
    FechaVenta DATE,
    MontoTotal DECIMAL,
    Estado CHAR(1)
)
BEGIN
    INSERT INTO Ventas VALUES(IdVenta,IdCliente,FechaVenta,MontoTotal,Estado);
END @@
DELIMITER;

-- Store Procedure : InsertaDetalle
DROP PROCEDURE InsertaDetalle;
DELIMITER @@
CREATE PROCEDURE InsertaDetalle(
    IdVenta CHAR(10),
    IdProducto CHAR(8),
    Cantidad INT,
    PrecioUnidad DECIMAL,
    Estado CHAR(1)
)
BEGIN
    INSERT INTO Detalle VALUES(IdVenta,IdProducto,Cantidad,PrecioUnidad,Estado);
END @@
DELIMITER;

-- Store Procedure : InfoCliente
DROP PROCEDURE IF EXISTS InfoCliente;
DELIMITER @@
CREATE PROCEDURE InfoCliente(IdCli CHAR(8))
BEGIN
    SELECT * FROM Clientes
    WHERE IdCliente = IdCli;
END @@
DELIMITER;

CALL InfoCliente('CLI00001');




