-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-04-04 05:24:36.051

-- tables
-- Table: Cargo

CREATE DATABASE SistemaVentasDB
USE SistemaVentasDB

CREATE TABLE Cargo (
    idCargo int  NOT NULL IDENTITY,
    nombreCargo varchar(25)  NOT NULL,
    salarioCargo decimal(6,2)  NOT NULL CHECK (salarioCargo >= 300 AND salarioCargo <= 2000), --CHECK
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT Cargo_pk PRIMARY KEY  (idCargo)
);

-- Table: Categoria
CREATE TABLE Categoria (
    idCategoria int  NOT NULL IDENTITY,
    nombreCategoria varchar(50)  NOT NULL CHECK (LEN(nombreCategoria) > 3), --CHECK
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT Categoria_pk PRIMARY KEY  (idCategoria)
);

-- Table: Cliente
CREATE TABLE Cliente (
    idCliente int  NOT NULL IDENTITY,
    primerNombreCliente varchar(50)  NOT NULL CHECK (LEN(primerNombreCliente) > 2), --CHECK
    segundoNombreCliente varchar(50)  NULL CHECK (LEN(segundoNombreCliente) > 2), --CHECK
    primerApellidoCliente varchar(50)  NOT NULL CHECK (LEN(primerApellidoCliente) > 2), --CHECK
    segundoApellidoCliente varchar(50)  NULL CHECK (LEN(segundoApellidoCliente) > 2), --CHECK
    duiCliente varchar(10)  NULL CHECK ([duiCliente] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][-][0-9]'), --CHECK
    nitCliente varchar(20)  NULL,
    telefonoCliente int  NULL CHECK (telefonoCliente like '[2-7][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), --CHECK
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT Cliente_pk PRIMARY KEY  (idCliente)
);

-- Table: ClienteUsuario
CREATE TABLE ClienteUsuario (
    idClienteUsuario int  NOT NULL IDENTITY,
    nombreClienteUsuario varchar(25)  NOT NULL,
    correoClienteUsuario varchar(50)  NOT NULL,
    fechaNacimientoClienteUsuario int  NOT NULL,
    contraseniaClienteUsuario varchar(25)  NOT NULL,
    CONSTRAINT ClienteUsuario_pk PRIMARY KEY  (idClienteUsuario)
);

-- Table: ComentarioProducto
CREATE TABLE ComentarioProducto (
    idComentario int  NOT NULL IDENTITY,
    idClienteUsuario int  NOT NULL,
    idProducto int  NOT NULL,
    descripcionComentario varchar(100)  NOT NULL,
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT ComentarioProducto_pk PRIMARY KEY  (idComentario)
);

-- Table: Compra
CREATE TABLE Compra (
    idCompra int  NOT NULL IDENTITY,
    idProveedor int  NOT NULL,
    idUsuario int  NOT NULL,
    fechaCompra date  NOT NULL,
    horaCompra time(0)  NOT NULL,
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT Compra_pk PRIMARY KEY  (idCompra)
);

-- Table: DetalleCompra
CREATE TABLE DetalleCompra (
    idDetalleCompra int  NOT NULL IDENTITY,
    idCompra int  NOT NULL,
    idProducto int  NOT NULL,
    cantidadProductoComprado int  NOT NULL,
    precioCompraUnidad decimal(6,2)  NOT NULL,
    precioVentaUnidad decimal(6,2)  NOT NULL,
    observaciones varchar(100)  NULL,
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT DetalleCompra_pk PRIMARY KEY  (idDetalleCompra)
);

-- Table: DetalleVenta
CREATE TABLE DetalleVenta (
    idDetalleVenta int  NOT NULL IDENTITY,
    idProducto int  NOT NULL,
    cantidadProducto int  NOT NULL,
    descuentoProducto decimal(6,2)  NOT NULL DEFAULT 0,
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT DetalleVenta_pk PRIMARY KEY  (idDetalleVenta)
);

-- Table: Empleado
CREATE TABLE Empleado (
    idEmpleado int  NOT NULL IDENTITY,
    idCargo int  NOT NULL,
    primerNombreEmpleado varchar(50)  NOT NULL,
    segundoNombreEmpleado varchar(50)  NOT NULL,
    primerApellidoEmpleado varchar(50)  NOT NULL,
    segundoApellidoEmpleado varchar(50)  NOT NULL,
    duiEmpleado varchar(10)  NOT NULL,
    nitEmpleado varchar(14)  NOT NULL,
    fotografiaEmpleado varbinary(MAX)  NULL,
    fechaNacimientoEmpleado date  NOT NULL,
    fechaContrato date  NOT NULL,
    telefonoEmpleado int  NULL,
    correoEmpleado varchar(50)  NULL,
    sexoEmpleado char(1)  NOT NULL CHECK (sexoEmpleado = 'M' OR sexoEmpleado = 'S'), --CHECK
    departamentoEmpleado int  NOT NULL,
    municipioEmpleado int  NOT NULL,
    detallesDireccionEmpleado int  NOT NULL,
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT Empleado_pk PRIMARY KEY  (idEmpleado)
);

-- Table: Marca
CREATE TABLE Marca (
    idMarca int  NOT NULL IDENTITY,
    nombreMarca varchar(50)  NOT NULL,
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT Marca_pk PRIMARY KEY  (idMarca)
);

-- Table: Producto
CREATE TABLE Producto (
    idProducto int  NOT NULL IDENTITY,
    idCategoria int  NOT NULL,
    idMarca int  NOT NULL,
    nombreProducto varchar(100)  NOT NULL,
    descripcionProducto varchar(MAX)  NULL,
    imagenProducto varbinary(MAX)  NULL,
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT Producto_pk PRIMARY KEY  (idProducto)
);

-- Table: Proveedor
CREATE TABLE Proveedor (
    idProveedor int  NOT NULL IDENTITY,
    primerNombreProveedor varchar(50)  NOT NULL,
    segundoNombreProveedor varchar(50)  NULL,
    primerApellidoProveedor varchar(50)  NOT NULL,
    segundoApellidoProveedor varchar(50)  NULL,
    telefonoProveedor int  NULL,
    empresaProveedor varchar(50)  NOT NULL,
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT Proveedor_pk PRIMARY KEY  (idProveedor)
);

-- Table: Provision
CREATE TABLE Provision (
    idProvision int  NOT NULL IDENTITY,
    idProducto int  NOT NULL,
    cantidadProductoDisponible int  NOT NULL DEFAULT 0,
    cantidadProductoVendido int  NOT NULL DEFAULT 0,
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT Provision_pk PRIMARY KEY  (idProvision)
);

-- Table: TipoUsuario
CREATE TABLE TipoUsuario (
    idTipoUsuario int  NOT NULL IDENTITY,
    nombreTipoUsuario varchar(25)  NOT NULL,
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT TipoUsuario_pk PRIMARY KEY  (idTipoUsuario)
);

-- Table: Usuario
CREATE TABLE Usuario (
    idUsuario int  NOT NULL IDENTITY,
    idEmpleado int  NOT NULL,
    idTipoUsuario int  NOT NULL,
    nombreUsuario varchar(25)  NOT NULL,
    contraseniaUsuario varchar(25)  NOT NULL,
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT Usuario_pk PRIMARY KEY  (idUsuario)
);

-- Table: Venta
CREATE TABLE Venta (
    idVenta int  NOT NULL IDENTITY,
    idDetalleVenta int  NOT NULL,
    idCliente int  NOT NULL,
    idEmpleado int  NOT NULL,
    fechaVenta date  NOT NULL,
    horaVenta time(0)  NOT NULL,
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT Venta_pk PRIMARY KEY  (idVenta)
);

-- Table: VentaOnline
CREATE TABLE VentaOnline (
    idVentaOnline int  NOT NULL IDENTITY,
    idDetalleVenta int  NOT NULL,
    idClienteUsuario int  NOT NULL,
    horaVentaCliente time(0)  NOT NULL,
    fechaVentaCliente date  NOT NULL,
    estado bit  NOT NULL DEFAULT 1,
    CONSTRAINT VentaOnline_pk PRIMARY KEY  (idVentaOnline)
);

-- foreign keys
-- Reference: ComentarioProducto_ClienteUsuario (table: ComentarioProducto)
ALTER TABLE ComentarioProducto ADD CONSTRAINT ComentarioProducto_ClienteUsuario
    FOREIGN KEY (idClienteUsuario)
    REFERENCES ClienteUsuario (idClienteUsuario);

-- Reference: ComentarioProducto_Producto (table: ComentarioProducto)
ALTER TABLE ComentarioProducto ADD CONSTRAINT ComentarioProducto_Producto
    FOREIGN KEY (idProducto)
    REFERENCES Producto (idProducto);

-- Reference: Compra_Proveedor (table: Compra)
ALTER TABLE Compra ADD CONSTRAINT Compra_Proveedor
    FOREIGN KEY (idProveedor)
    REFERENCES Proveedor (idProveedor);

-- Reference: Compra_Usuario (table: Compra)
ALTER TABLE Compra ADD CONSTRAINT Compra_Usuario
    FOREIGN KEY (idUsuario)
    REFERENCES Usuario (idUsuario);

-- Reference: DetalleVenta_Producto (table: DetalleVenta)
ALTER TABLE DetalleVenta ADD CONSTRAINT DetalleVenta_Producto
    FOREIGN KEY (idProducto)
    REFERENCES Producto (idProducto);

-- Reference: DetallesCompra_Compra (table: DetalleCompra)
ALTER TABLE DetalleCompra ADD CONSTRAINT DetallesCompra_Compra
    FOREIGN KEY (idCompra)
    REFERENCES Compra (idCompra);

-- Reference: DetallesCompra_Producto (table: DetalleCompra)
ALTER TABLE DetalleCompra ADD CONSTRAINT DetallesCompra_Producto
    FOREIGN KEY (idProducto)
    REFERENCES Producto (idProducto);

-- Reference: Empleado_Cargo (table: Empleado)
ALTER TABLE Empleado ADD CONSTRAINT Empleado_Cargo
    FOREIGN KEY (idCargo)
    REFERENCES Cargo (idCargo);

-- Reference: Marca_Producto (table: Producto)
ALTER TABLE Producto ADD CONSTRAINT Marca_Producto
    FOREIGN KEY (idMarca)
    REFERENCES Marca (idMarca);

-- Reference: Producto_Categoria (table: Producto)
ALTER TABLE Producto ADD CONSTRAINT Producto_Categoria
    FOREIGN KEY (idCategoria)
    REFERENCES Categoria (idCategoria);

-- Reference: Provision_Producto (table: Provision)
ALTER TABLE Provision ADD CONSTRAINT Provision_Producto
    FOREIGN KEY (idProducto)
    REFERENCES Producto (idProducto);

-- Reference: Usuario_Empleado (table: Usuario)
ALTER TABLE Usuario ADD CONSTRAINT Usuario_Empleado
    FOREIGN KEY (idEmpleado)
    REFERENCES Empleado (idEmpleado);

-- Reference: Usuario_TipoUsuario (table: Usuario)
ALTER TABLE Usuario ADD CONSTRAINT Usuario_TipoUsuario
    FOREIGN KEY (idTipoUsuario)
    REFERENCES TipoUsuario (idTipoUsuario);

-- Reference: VentaOnline_ClienteUsuario (table: VentaOnline)
ALTER TABLE VentaOnline ADD CONSTRAINT VentaOnline_ClienteUsuario
    FOREIGN KEY (idClienteUsuario)
    REFERENCES ClienteUsuario (idClienteUsuario);

-- Reference: VentaOnline_DetalleVenta (table: VentaOnline)
ALTER TABLE VentaOnline ADD CONSTRAINT VentaOnline_DetalleVenta
    FOREIGN KEY (idDetalleVenta)
    REFERENCES DetalleVenta (idDetalleVenta);

-- Reference: Venta_Cliente (table: Venta)
ALTER TABLE Venta ADD CONSTRAINT Venta_Cliente
    FOREIGN KEY (idCliente)
    REFERENCES Cliente (idCliente);

-- Reference: Venta_DetalleVenta (table: Venta)
ALTER TABLE Venta ADD CONSTRAINT Venta_DetalleVenta
    FOREIGN KEY (idDetalleVenta)
    REFERENCES DetalleVenta (idDetalleVenta);

-- Reference: Venta_Empleado (table: Venta)
ALTER TABLE Venta ADD CONSTRAINT Venta_Empleado
    FOREIGN KEY (idEmpleado)
    REFERENCES Empleado (idEmpleado);

-- End of file.

