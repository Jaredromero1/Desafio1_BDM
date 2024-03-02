create database RO201303_Desafio1
go

use RO201303_Desafio1
go

create table Productos (
	Producto_ID char(5) not null,
	Nombre_de_parte varchar(50),
	Precio_unitario decimal(18,0),
)

create table Clientes (
	Cliente_ID char(5) not null,
	Nombre varchar(35),
	Apellido varchar(35)
)

create table Sucursales (
	Sucursal_ID char(3) not null,
	Nombre varchar(35)
)

create table Ventas(
	Venta_ID char(5) not null,
	Cliente_ID char(5),
	Producto_ID char(5),
	Cantidad integer,
	Sucursal_ID char(3),
	Fecha_de_compra date
)


-- primary key
alter table Productos
add constraint PK_ProductoID
primary key (Producto_ID)
go

alter table Clientes
add constraint PK_ClienteID
primary key (Cliente_ID)
go

alter table Sucursales
add constraint PK_SucursalID
primary key (Sucursal_ID)
go

alter table Ventas
add constraint PK_VentaID
primary key (Venta_ID)
go

-- foreign key
alter table Ventas
add constraint FK_ClienteID
foreign key (Cliente_ID)
references Clientes(Cliente_ID)
go

alter table Ventas
add constraint FK_ProductoID
foreign key (Producto_ID)
references Productos(Producto_ID)
go

alter table Ventas
add constraint FK_SucursalesID
foreign key (Sucursal_ID)
references Sucursales(Sucursal_ID)
go

-- restriciones
alter table Ventas
add constraint DF_fecha
default getdate() for Fecha_de_compra
go

alter table Ventas
add constraint CK_CantidadProducto
check (cantidad > 0)
go

alter table Productos
add constraint CK_PrecioUnitario
check (precio_unitario > 0)
go


-- Datos sucursales
insert into Sucursales (Sucursal_ID, Nombre) values ('S01', 'Soyapango')
insert into Sucursales (Sucursal_ID, Nombre) values ('S02', 'Antiguo Cuscatlan')
insert into Sucursales (Sucursal_ID, Nombre) values ('S03', 'Santa Tecla')
insert into Sucursales (Sucursal_ID, Nombre) values ('S04', 'Ciudad Delgado')

select * from Sucursales

-- Datos clientes
insert into Clientes (Cliente_ID, Nombre, Apellido) values ('101', 'Juan', 'Perez')
insert into Clientes (Cliente_ID, Nombre, Apellido) values ('102', 'Carlos', 'Ramirez')
insert into Clientes (Cliente_ID, Nombre, Apellido) values ('103', 'Sofia', 'Fernandez')
insert into Clientes (Cliente_ID, Nombre, Apellido) values ('104', 'Alejandro', 'Hernandez')
insert into Clientes (Cliente_ID, Nombre, Apellido) values ('105', 'Moises', 'Juarez')

select * from Clientes

--Datos Productos
insert into Productos (Producto_ID, Nombre_de_parte, Precio_unitario) values ('AB123', 'Bateria', 50.00)
insert into Productos (Producto_ID, Nombre_de_parte, Precio_unitario) values ('CD456', 'Filtro de aceite', 100.00)
insert into Productos (Producto_ID, Nombre_de_parte, Precio_unitario) values ('EF789', 'Espejo retrovisor', 30.00)
insert into Productos (Producto_ID, Nombre_de_parte, Precio_unitario) values ('GH012', 'Escape', 25.00)
insert into Productos (Producto_ID, Nombre_de_parte, Precio_unitario) values ('IJ345', 'Alojenas', 70.00)
insert into Productos (Producto_ID, Nombre_de_parte, Precio_unitario) values ('KL678', 'Bujia', 15.00)
insert into Productos (Producto_ID, Nombre_de_parte, Precio_unitario) values ('MN901', 'Filtro de aire', 85.00)
insert into Productos (Producto_ID, Nombre_de_parte, Precio_unitario) values ('OP234', 'Puntas de felchas', 45.00)
insert into Productos (Producto_ID, Nombre_de_parte, Precio_unitario) values ('QR567', 'Tambor de freno', 95.00)
insert into Productos (Producto_ID, Nombre_de_parte, Precio_unitario) values ('ST890', 'Pastillas de freno', 35.00)

select * from Productos

-- Datos Ventas
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (1, '105', 'EF789', 1, 'S02', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (2, '101', 'GH012', 2, 'S03', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (3, '102', 'IJ345', 1, 'S02', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (4, '103', 'KL678', 4, 'S04', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (5, '104', 'MN901', 1, 'S02', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (6, '105', 'OP234', 2, 'S01', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (7, '101', 'QR567', 1, 'S02', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (8, '102', 'ST890', 1, 'S03', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (9, '103', 'AB123', 1, 'S02', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (10, '104', 'CD456', 2, 'S01', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (11, '105', 'EF789', 1, 'S03', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (12, '101', 'GH012', 2, 'S04', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (13, '102', 'IJ345', 1, 'S02', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (14, '103', 'KL678', 2, 'S03', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (15, '104', 'MN901', 1, 'S01', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (16, '105', 'OP234', 3, 'S01', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (17, '101', 'QR567', 2, 'S02', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (18, '102', 'ST890', 2, 'S04', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (19, '103', 'AB123', 1, 'S02', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (20, '105', 'KL678', 1, 'S03', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (21, '103', 'OP234', 1, 'S04', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (22, '104', 'AB123', 1, 'S03', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (23, '101', 'EF789', 1, 'S02', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (24, '102', 'ST890', 1, 'S02', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (25, '102', 'CD456', 1, 'S01', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (26, '103', 'KL678', 4, 'S03', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (27, '104', 'QR567', 2, 'S01', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (28, '105', 'IJ345', 1, 'S02', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (29, '103', 'EF789', 2, 'S04', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (30, '101', 'AB123', 2, 'S02', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (31, '104', 'CD456', 1, 'S03', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (32, '102', 'EF789', 1, 'S01', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (33, '105', 'OP234', 1, 'S02', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (34, '103', 'AB123', 2, 'S04', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (35, '101', 'GH012', 1, 'S04', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (36, '104', 'ST890', 1, 'S03', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (37, '103', 'IJ345', 1, 'S01', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (38, '105', 'CD456', 1, 'S01', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (39, '101', 'EF789', 2, 'S03', '2024-02-28')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (40, '102', 'KL678', 2, 'S02', '2024-02-29')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (41, '103', 'GH012', 1, 'S04', '2024-02-29')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (42, '105', 'EF789', 1, 'S04', '2024-02-29')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (43, '101', 'ST890', 1, 'S01', '2024-02-29')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (44, '105', 'KL678', 4, 'S03', '2024-02-29')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (45, '102', 'EF789', 1, 'S02', '2024-02-29')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (46, '103', 'QR567', 2, 'S04', '2024-02-29')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (47, '101', 'EF789', 2, 'S01', '2024-02-29')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (48, '104', 'MN901', 1, 'S04', '2024-02-29')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (49, '105', 'EF789', 2, 'S03', '2024-02-29')
insert into Ventas (Venta_ID, Cliente_ID, Producto_ID, Cantidad, Sucursal_ID, Fecha_de_compra) values (50, '101', 'AB123', 1, 'S02', '2024-02-29')

select * from Ventas