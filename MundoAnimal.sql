-- -----------------------------------------------------
-- Schema MUNDOANIMAL
-- -----------------------------------------------------
CREATE DATABASE MUNDOANIMAL;
USE MUNDOANIMAL ;
DROP DATABASE mundoanimal;
-- -----------------------------------------------------
-- Table `MUNDOANIMAL`.`Proveedor`
-- -----------------------------------------------------
drop table proveedor;
CREATE TABLE proveedor (
  documento_prov INT PRIMARY KEY NOT NULL,
  nombre_prov VARCHAR(45) NOT NULL,
  apellido_prov VARCHAR(45) NOT NULL,
  telefono_prov VARCHAR(11) NOT NULL,
  correo_prov VARCHAR(45) NOT NULL);
  
  
  select * from proveedor;
  
 -- -----------------------------------------------------
-- Table `MUNDOANIMAL`.`Proveedor-Abastece-Producto`
-- -----------------------------------------------------
drop table prov_prod;

CREATE TABLE prov_prod (
 prov_documento INT NOT NULL,
 producto_id INT NOT NULL);
 
alter table prov_prod add foreign key (prov_documento) REFERENCES proveedor(documento_prov);
alter table prov_prod add foreign key (producto_id) REFERENCES producto(idproducto);

-- -----------------------------------------------------
-- Table `MUNDOANIMAL`.`Empleado`
-- -----------------------------------------------------
drop table empleado;

CREATE TABLE empleado (
  documento_empl INT PRIMARY KEY NOT NULL,
  nombre_empl VARCHAR(45) NOT NULL,
  apellido_empl VARCHAR(45) NOT NULL,
  telefono_empl VARCHAR(45) NOT NULL,
  direccion_empl VARCHAR(45) NOT NULL,
  correo_empl VARCHAR(45) NOT NULL,
  clave_empl VARCHAR(15) NOT NULL,
  cargo_id INT NOT NULL,
  empresa_id INT NOT NULL);
  
alter table empleado add foreign key (cargo_id) REFERENCES cargo(idcargo);
alter table empleado add foreign key (empresa_id) REFERENCES empresa(idempresa);
-- -----------------------------------------------------
-- Table `MUNDOANIMAL`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE categoria (
  idcategoria INT PRIMARY KEY  AUTO_INCREMENT NOT NULL,
  nombre_c VARCHAR(15) NOT NULL);

-- -----------------------------------------------------
-- Table `MUNDOANIMAL`.`Producto`
-- -----------------------------------------------------
CREATE TABLE producto (
  idproducto INT PRIMARY KEY NOT NULL,
  nombre_prod VARCHAR(45) NOT NULL,
  descripcion_prod VARCHAR(80) NOT NULL,
  precio_prod DECIMAL NOT NULL,
  existencias_prod INT NOT NULL,
  categoria_id INT NOT NULL);
select * from categoria;
select * from producto;

insert into producto(idproducto,nombre_prod,descripcion_prod,precio_prod,existencias_prod,categoria_id) values (1545,'Antiparasitante','Mascota', 10000, 2, 1);
alter table producto add foreign key (categoria_id) REFERENCES categoria(idcategoria);
  
 SELECT * FROM producto;
INSERT INTO producto(nombre_prod,descripcion_prod,precio_prod,existencias_prod,categoria_id) VALUES ('Dogchow','Alimento sano para tu mascota', 15000, 5, 1);

-- -----------------------------------------------------
-- Table `MUNDOANIMAL`.`Detalle_Factura`
-- -----------------------------------------------------
CREATE TABLE detalle_factura (
  iddetalle_factura INT PRIMARY KEY  AUTO_INCREMENT,
  iva DECIMAL NOT NULL,
  cantidad INT NOT NULL,
  subtotal DECIMAL NOT NULL,
  factura_id INT NOT NULL,
  producto_id INT NOT NULL);
  
  alter table detalle_factura add foreign key (producto_id) REFERENCES producto(idproducto);
  alter table detalle_factura add foreign key (factura_id) REFERENCES factura(idfactura);
-- -----------------------------------------------------
-- Table `MUNDOANIMAL`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE cargo (
  idcargo INT PRIMARY KEY  AUTO_INCREMENT,
  nombre_car VARCHAR(45) NOT NULL);

SELECT * FROM cargo;
INSERT INTO cargo(nombre_car) VALUES ();

-- -----------------------------------------------------
-- Table `MUNDOANIMAL`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE usuario (
  documento_u INT PRIMARY KEY NOT NULL,
  nombre_u VARCHAR(45) NOT NULL,
  apellido_u VARCHAR(45) NOT NULL,
  telefono_u INT NOT NULL,
  direccion_u VARCHAR(45) NOT NULL,
  correo_u VARCHAR(45) NOT NULL,
  clave_u VARCHAR(15) NOT NULL);
  
select * from usuario;
insert into usuario(documento_u,nombre_u,apellido_u,telefono_u,direccion_u,correo_u,clave_u) VALUES (1000088550, 'Yeison andres','Marin', '317857110', 'Cl 87 # 31-58', 'yeison@gmail.com', 123456);

-- -----------------------------------------------------
-- Table `MUNDOANIMAL`.`Factura`
-- -----------------------------------------------------
CREATE TABLE factura (
  idfactura INT PRIMARY KEY  AUTO_INCREMENT NOT NULL,
  fecha_fac DATE NOT NULL,
  total_fac DECIMAL NOT NULL,
  empl_documento INT NOT NULL,
  u_documento INT NOT NULL);
  
  alter table factura add foreign key (empl_documento) REFERENCES empleado(documento_empl);
  alter table factura add foreign key (u_documento) REFERENCES usuario(documento_u);
  
-- -----------------------------------------------------
-- Table `MUNDOANIMAL`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE empresa (
  idempresa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nombre_empr VARCHAR(30) NOT NULL,
  telefono_empr INT NOT NULL,
  direccion_empr VARCHAR(20) NOT NULL);



- -----------------------------------------------------
-- Stored Procedures `MUNDOANIMAL`.`Proveedor`
-- -----------------------------------------------------
DELIMITER $$

CREATE PROCEDURE sp_insertProveedor (
insert_Documento_prov INT,
insert_Nombre VARCHAR(45),
insert_Apellido VARCHAR(45),
insert_Telefono varchar(11),
insert_Correo VARCHAR(45))
BEGIN
Insert Into proveedor(documento_prov,nombre_prov, apellido_prov, telefono_prov, correo_prov) Values (insert_Documento_prov,insert_Nombre, insert_Apellido, insert_Telefono, insert_Correo);
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_verProveedor ()
BEGIN
SELECT * FROM proveedor;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_updateProveedor (
up_documento_prov int,
up_Nombre varchar (45),
up_Apellido varchar(45),
up_Telefono varchar(11),
up_Correo varchar(45))
BEGIN
UPDATE proveedor SET
documento_prov = up_documento_prov,
nombre_prov = up_Nombre,
apellido_prov = up_Apellido,
telefono_prov = up_Telefono,
correo_prov = up_Correo
   WHERE documento_prov = up_documento_prov;
END$$

DELIMITER ;

describe proveedor;
DELIMITER $$

CREATE PROCEDURE sp_deleteProveedor (
del_documento_prov int)
BEGIN
delete from proveedor where documento_prov=del_documento_prov;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- Call - Stored Procedures MUNDOANIMAL
-- -----------------------------------------------------
call sp_insertProveedor(1000088550, 'Maia', 'Arboleda', '2338369' , 'maia@gmail.com');
call sp_verProveedor;
call sp_updateProveedor(1000088550, 'Yeison', 'Marin', '3178571103', 'Yeison@gmail.com');
call sp_deleteProveedor(1000088550);

- -----------------------------------------------------
-- Stored Procedures `MUNDOANIMAL`.`Categoria`
-- -----------------------------------------------------

DELIMITER $$

CREATE PROCEDURE sp_insertCategoria (
insert_nombre_c VARCHAR(45))
BEGIN
Insert Into categoria (nombre_c) Values (insert_nombre_c);
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_verCategoria()
BEGIN
SELECT * FROM categoria;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_updateCategoria (
up_idcategoria int,
up_nombre_c varchar (45))
BEGIN
UPDATE categoria SET
idcategoria = up_idcategoria,
nombre_c = up_nombre_c
 WHERE idcategoria = up_idcategoria;

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_deleteCategoria (
del_idcategoria int)
BEGIN
delete from categoria where idcategoria=del_idcategoria;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- Call - Stored Procedures MUNDOANIMAL
-- -----------------------------------------------------

call sp_insertCategoria('Snacks');
call sp_verCategoria;
call sp_updateCategoria(1, 'Medicinas');
call sp_deleteCategoria(1);

- -----------------------------------------------------
-- Stored Procedures `MUNDOANIMAL`.`Empresa`
-- -----------------------------------------------------

DELIMITER $$

CREATE PROCEDURE sp_insertEmpresa (
insert_nombre_empr VARCHAR(45),
insert_telefono_empr int,
insert_direccion_empr VARCHAR(45))
BEGIN
Insert Into empresa (nombre_empr,telefono_empr,direccion_empr) Values (insert_nombre_empr,insert_telefono_empr,insert_direccion_empr);
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_verEmpresa()
BEGIN
SELECT * FROM empresa;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_updateEmpresa (
up_idempresa int,
up_nombre_empr varchar (45),
up_telefono_empr int,
up_direccion_empr varchar (45))
BEGIN
UPDATE empresa SET
idempresa = up_idempresa,
nombre_empr = up_nombre_empr,
telefono_empr = up_telefono_empr,
direccion_empr = up_direccion_empr
 WHERE idempresa = up_idempresa;

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_deleteEmpresa (
del_idempresa int)
BEGIN
delete from empresa where idempresa=del_idempresa;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- Call - Stored Procedures MUNDOANIMAL
-- -----------------------------------------------------
call sp_insertEmpresa('Joaquin', 5718754, 'Cl 87 # 31-58');
call sp_verEmpresa;
call sp_updateEmpresa(1, 'Angeline', 89489494, 'Cl 45 # 31-65');
call sp_deleteEmpresa(1);


- -----------------------------------------------------
-- Stored Procedures `MUNDOANIMAL`.`Cargo`
-- -----------------------------------------------------

DELIMITER $$

CREATE PROCEDURE sp_insertCargo (
insert_nombre_car VARCHAR(45))
BEGIN
Insert Into cargo (nombre_car) Values (insert_nombre_car);
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_verCargo()
BEGIN
SELECT * FROM cargo;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_updateCargo (
up_idcargo int,
up_nombre_car varchar (45))
BEGIN
UPDATE cargo SET
idcargo = up_idcargo,
nombre_car = up_nombre_car
 WHERE idcargo = up_idcargo;

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_deleteCargo (
del_idcargo int)
BEGIN
delete from cargo where idcargo=del_idcargo;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- Call - Stored Procedures MUNDOANIMAL
-- -----------------------------------------------------
call sp_insertCargo('Empleado');
call sp_verCargo;
call sp_updateCargo(1, 'Cajero');
call sp_deleteCargo(1);

- -----------------------------------------------------
-- Stored Procedures `MUNDOANIMAL`.`Empleado`
-- -----------------------------------------------------

DELIMITER $$

CREATE PROCEDURE sp_insertEmpleado (
insert_documento_empl INT,
insert_nombre_empl VARCHAR(45),
insert_apellido_empl VARCHAR(45),
insert_telefono_empl VARCHAR(45),
insert_direccion_empl VARCHAR(45),
insert_correo_empl VARCHAR(45),
insert_clave_empl VARCHAR(45),
insert_cargo_id INT,
insert_empresa_id INT)
BEGIN
Insert Into empleado (documento_empl,nombre_empl,apellido_empl,telefono_empl,direccion_empl,correo_empl,clave_empl,cargo_id,empresa_id)
Values (insert_documento_empl,insert_nombre_empl,insert_apellido_empl,insert_telefono_empl,insert_direccion_empl,insert_correo_empl,insert_clave_empl,insert_cargo_id,insert_empresa_id);
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_verEmpleado()
BEGIN
SELECT * FROM empleado;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_updateEmpleado (
up_documento_empl INT,
up_nombre_empl VARCHAR(45),
up_apellido_empl VARCHAR(45),
up_telefono_empl VARCHAR(45),
up_direccion_empl VARCHAR(45),
up_correo_empl  VARCHAR(45),
up_clave_empl VARCHAR(45),
up_cargo_id INT,
up_empresa_id INT )
BEGIN
UPDATE empleado SET
documento_empl = up_documento_empl,
nombre_empl = up_nombre_empl,
apellido_empl = up_apellido_empl,
telefono_empl = up_telefono_empl,
direccion_empl = up_direccion_empl,
correo_empl = up_correo_empl,
clave_empl = up_clave_empl,
cargo_id = up_cargo_id,
empresa_id  = up_empresa_id
 WHERE documento_empl = up_documento_empl;

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_deleteEmpleado (
del_documento_empl int)
BEGIN
delete from empleado where documento_empl = del_documento_empl;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- Call - Stored Procedures MUNDOANIMAL
-- -----------------------------------------------------
call sp_insertEmpleado(1000088550, 'Juan', 'Marin', '5718025' , 'Cl 45 A sur 32', 'Jmarin@gmail.com', '123456', 1, 1);
call sp_verEmpleado;
call sp_updateEmpleado(1015066245, 'Javier', 'Zapata', '5475878' , 'Cl 51 A sur 32', 'Jzapata@gmail.com', '123456', 1, 1);
call sp_deleteEmpleado(1000088550);

- -----------------------------------------------------
-- Stored Procedures `MUNDOANIMAL`.`Usuario`
-- -----------------------------------------------------

DELIMITER $$

CREATE PROCEDURE sp_insertUsuario (
insert_documento_u INT,
insert_nombre_u VARCHAR(45),
insert_apellido_u VARCHAR(45),
insert_telefono_u VARCHAR(45),
insert_direccion_u VARCHAR(45),
insert_correo_u VARCHAR(45),
insert_clave_u VARCHAR(45))
BEGIN
Insert Into usuario (documento_u,nombre_u,apellido_u,telefono_u,direccion_u,correo_u,clave_u)
Values (insert_documento_u,insert_nombre_u,insert_apellido_u,insert_telefono_u,insert_direccion_u,insert_correo_u,insert_clave_u);
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_verUsuario()
BEGIN
SELECT * FROM usuario;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_updateUsuario (
up_documento_u INT,
up_nombre_u VARCHAR(45),
up_apellido_u VARCHAR(45),
up_telefono_u VARCHAR(45),
up_direccion_u VARCHAR(45),
up_correo_u VARCHAR(45),
up_clave_u VARCHAR(45))
BEGIN
UPDATE usuario SET
documento_u = up_documento_u,
nombre_u = up_nombre_u,
apellido_u = up_apellido_u,
telefono_u = up_telefono_u,
direccion_u = up_direccion_u,
correo_u = up_correo_u,
clave_u = up_clave_u
 WHERE documento_u = up_documento_u;

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_deleteUsuario (
del_documento_u int)
BEGIN
delete from usuario where documento_u = del_documento_u;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- Call - Stored Procedures MUNDOANIMAL
-- -----------------------------------------------------
call sp_insertUsuario(43624764, 'Cecilia', 'Restrpo', '3147200163' , 'Cl 45 A sur 32', 'Crestrepo@gmail.com', '123456');
call sp_verUsuario;
call sp_updateUsuario(43624764, 'Javier', 'Zapata', '5475878' , 'Cl 51 A sur 32', 'Jzapata@gmail.com', '123456');
call sp_deleteUsuario(43624764);


USE `mundoanimal`;
CREATE  OR REPLACE VIEW vw_categoriaProducto AS
SELECT idproducto,nombre_prod idcategoria, nombre_c FROM categoria join producto
ON categoria_id = categoria.idcategoria;

call vw_categoriaProducto;
