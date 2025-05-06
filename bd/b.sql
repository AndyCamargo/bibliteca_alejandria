/*
SQLyog Enterprise - MySQL GUI v8.1 
MySQL - 5.6.17 : Database - biblioteca
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`biblioteca` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `biblioteca`;

/*Table structure for table `autor` */

DROP TABLE IF EXISTS `autor`;

CREATE TABLE `autor` (
  `id_autor` int(3) NOT NULL AUTO_INCREMENT,
  `nombre_autor` text,
  `resena_autor` text,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `autor` */

insert  into `autor`(id_autor,nombre_autor,resena_autor,fecha_nacimiento) values (1,'gabriel garcia marques','se murio en mexico y colombia lo queria pero no los presidentes que eran unos petardos','1889-12-29'),(2,'Ivan Monje','jdkfnsjkldfnkjsldfn','2016-01-01'),(3,'Ivan Monje','prueba','2016-03-08');

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `id_categoria` int(3) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `categoria` */

insert  into `categoria`(id_categoria,descripcion) values (1,'literatura'),(2,'matematicas'),(3,'geografia');

/*Table structure for table `estado` */

DROP TABLE IF EXISTS `estado`;

CREATE TABLE `estado` (
  `id_estado` int(2) NOT NULL,
  `nombre_estado` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `estado` */

insert  into `estado`(id_estado,nombre_estado) values (1,'activo'),(2,'inactivo');

/*Table structure for table `etiquetas` */

DROP TABLE IF EXISTS `etiquetas`;

CREATE TABLE `etiquetas` (
  `id_etiqueta` int(3) NOT NULL,
  `nombre_etiqueta` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_etiqueta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `etiquetas` */

insert  into `etiquetas`(id_etiqueta,nombre_etiqueta) values (1,'fabuloso'),(2,'encantador'),(3,'sexo');

/*Table structure for table `genero` */

DROP TABLE IF EXISTS `genero`;

CREATE TABLE `genero` (
  `id_genero` int(3) NOT NULL AUTO_INCREMENT,
  `nombre_genero` text,
  `descripcion` text,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `genero` */

insert  into `genero`(id_genero,nombre_genero,descripcion) values (1,'Lirico',' Los textos líricos expresan el mundo subjetivo del autor, sus emociones y sentimientos, o una profunda reflexión. Suele escribirse en verso pero también se utiliza la prosa.'),(2,'terror','dsfdsfsdf');

/*Table structure for table `libro_autores` */

DROP TABLE IF EXISTS `libro_autores`;

CREATE TABLE `libro_autores` (
  `id_libro` int(3) DEFAULT NULL,
  `id_autor` int(3) DEFAULT NULL,
  KEY `FK_libro_autores` (`id_libro`),
  KEY `FK_libro_autores1` (`id_autor`),
  CONSTRAINT `FK_libro_autores` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`),
  CONSTRAINT `FK_libro_autores1` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `libro_autores` */

insert  into `libro_autores`(id_libro,id_autor) values (1,1),(2,1),(2,1),(3,1),(3,1),(4,1),(4,2);

/*Table structure for table `libros` */

DROP TABLE IF EXISTS `libros`;

CREATE TABLE `libros` (
  `id_libro` int(4) NOT NULL AUTO_INCREMENT,
  `nombre_libro` text,
  `descripcion_libro` text,
  `id_genero` int(3) DEFAULT NULL,
  `cantidad` int(3) DEFAULT NULL,
  `id_categoria` int(3) DEFAULT NULL,
  `url` text,
  `id_etiqueta_libros` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `FK_libros1` (`id_genero`),
  KEY `FK_libros2` (`id_categoria`),
  KEY `FK_libros5` (`id_etiqueta_libros`),
  CONSTRAINT `FK_libros1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`),
  CONSTRAINT `FK_libros2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `FK_libros5` FOREIGN KEY (`id_etiqueta_libros`) REFERENCES `etiquetas` (`id_etiqueta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `libros` */

insert  into `libros`(id_libro,nombre_libro,descripcion_libro,id_genero,cantidad,id_categoria,url,id_etiqueta_libros) values (1,'cien  años de soledad','es un libro que espresa una historia de una famila que hace muchas cosas en el transcurso de la historia ',1,2,1,NULL,1),(2,'100años de soledad nuevo','esto es nuevo',1,3,1,'kshadsahkjdhjk.jpg',1),(3,'100 años de soledad','libre de gabriel garcias marques',1,3,2,'~\\imagenes\\9788497592208.jpg',2),(4,'prueba','idsjfñsdjfkdsjflkj',2,56,2,'~\\imagenes\\',1);

/*Table structure for table `notificaciones` */

DROP TABLE IF EXISTS `notificaciones`;

CREATE TABLE `notificaciones` (
  `id_notificaciones` int(5) NOT NULL,
  `texto` text,
  `url_imagen` text,
  `fecha` date DEFAULT NULL,
  `id_usuario` int(3) DEFAULT NULL,
  `titulo` text,
  PRIMARY KEY (`id_notificaciones`),
  KEY `FK_notificaciones` (`id_usuario`),
  CONSTRAINT `FK_notificaciones` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `notificaciones` */

/*Table structure for table `prestamo` */

DROP TABLE IF EXISTS `prestamo`;

CREATE TABLE `prestamo` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `id_libro` int(3) DEFAULT NULL,
  `id_usuario` int(3) DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `multa` int(10) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `cantidad_prestamo_multas` varchar(10) DEFAULT NULL,
  `detalles_prestamo` text,
  PRIMARY KEY (`id`),
  KEY `FK_prestamo` (`id_libro`),
  KEY `FK_prestamo1` (`id_usuario`),
  CONSTRAINT `FK_prestamo` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`),
  CONSTRAINT `FK_prestamo1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `prestamo` */

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `id_rol` int(3) NOT NULL,
  `nombre_rol` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rol` */

insert  into `rol`(id_rol,nombre_rol) values (1,'administrador'),(2,'bibliotecario'),(3,'usuario');

/*Table structure for table `seguridad` */

DROP TABLE IF EXISTS `seguridad`;

CREATE TABLE `seguridad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NULL DEFAULT NULL,
  `usuario_id` int(100) DEFAULT NULL,
  `tabla` text,
  `pk` int(10) DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `mac` varchar(100) DEFAULT NULL,
  `campos` varchar(200) DEFAULT NULL,
  `antes` varchar(200) DEFAULT NULL,
  `ahora` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `seguridad` */

insert  into `seguridad`(id,fecha,usuario_id,tabla,pk,accion,ip,mac,campos,antes,ahora) values (1,NULL,0,'usuarios',10,'inssert','127.0.0.1','080027003469','nombres,apellidos,cedula,direccion,telefono,fecha_nacimiento,correo,id_rol,clave','   ','camilo,nada,12345654,la calle ,3213274509,2001-02-15,pepito@hotmail.com,3,125689'),(2,NULL,0,'usuarios',11,'inssert','127.0.0.1','080027003469','nombres,apellidos,cedula,direccion,telefono,fecha_nacimiento,correo,id_rol,clave','   ','sef,pedraza,1002934863,barrio villa,3218574849,1999-04-19,alalal@dfjds.com,3,1234'),(3,NULL,0,'usuarios',12,'inssert','127.0.0.1','080027003469','nombres,apellidos,cedula,direccion,telefono,fecha_nacimiento,correo,id_rol,clave,id_estado','   ','andy,leandro,1014210492,la calle,3115567635,1990-05-08,apanda_3@hotmail.com,3,1234'),(4,NULL,0,'usuarios',2,'inssert','127.0.0.1','080027003469','nombres,apellidos,cedula,direccion,telefono,fecha_nacimiento,correo,id_rol,clave,id_estado','   ','camilo,riaño,1014210492,facatativa,3115567635,1999-04-19,apanda_3@hotmail.com,2,1234'),(5,NULL,0,'usuarios',14,'inssert','127.0.0.1','080027003469','nombres,apellidos,cedula,direccion,telefono,fecha_nacimiento,correo,id_rol,clave,id_estado','   ','carmen,perez,1014210434,corzo,3435676578,1989-12-31,apanda_3@hotmail.com,3,123456'),(6,NULL,0,'genero',NULL,'inssert','127.0.0.1','080027003469','nombre_genero,descripcion','   ','Lirico, Los textos líricos expresan el mundo subjetivo del autor, sus emociones y sentimientos, o una profunda reflexión. Suele escribirse en verso pero también se utiliza la prosa.'),(7,NULL,0,'autor',NULL,'inssert','127.0.0.1','E0B9A5FA9221','nombre_autor,resena_autor,fecha_nacimiento','   ','gabriel garcia marques,se murio en mexico y colombia lo queria pero no los presidentes que eran unos petardos,1889-12-29'),(8,NULL,0,'libro_autores',2,'insert','127.0.0.1','E0B9A5FA9221','id_libro,id_autor','   ','2,1'),(9,NULL,0,'libro_autores',2,'insert','127.0.0.1','E0B9A5FA9221','id_libro,id_autor','   ','2,1'),(10,NULL,0,'libros',2,'insert','127.0.0.1','E0B9A5FA9221','nombre_libro,descripcion_libro,id_genero,cantidad,id_categoria,url,id_etiqueta_libros','   ','100años de soledad nuevo,esto es nuevo,1,3,1,kshadsahkjdhjk.jpg,1'),(11,NULL,0,'libro_autores',3,'insert','127.0.0.1','E0B9A5FA9221','id_libro,id_autor','   ','3,1'),(12,NULL,0,'libro_autores',3,'insert','127.0.0.1','E0B9A5FA9221','id_libro,id_autor','   ','3,1'),(13,NULL,0,'libros',3,'insert','127.0.0.1','E0B9A5FA9221','nombre_libro,descripcion_libro,id_genero,cantidad,id_categoria,url,id_etiqueta_libros','   ','100 años de soledad,libre de gabriel garcias marques,1,3,2,~\\imagenes\\9788497592208.jpg,2'),(14,NULL,0,'usuarios',15,'inssert','127.0.0.1','080027003469','nombres,apellidos,cedula,direccion,telefono,fecha_nacimiento,correo,id_rol,clave,id_estado','   ','Ivan,Monje,1234567890,calle 123,54654564,2016-01-01,prueba@prueba.com,3,prueba'),(15,NULL,0,'genero',2,'inssert','127.0.0.1','080027003469','nombre_genero,descripcion','   ','terror,dsfdsfsdf'),(16,NULL,0,'autor',2,'inssert','127.0.0.1','080027003469','nombre_autor,resena_autor,fecha_nacimiento','   ','Ivan Monje,jdkfnsjkldfnkjsldfn,2016-01-01'),(17,NULL,0,'autor',3,'inssert','127.0.0.1','080027003469','nombre_autor,resena_autor,fecha_nacimiento','   ','Ivan Monje,prueba,2016-03-08'),(18,NULL,0,'libro_autores',4,'insert','127.0.0.1','080027003469','id_libro,id_autor','   ','4,1'),(19,NULL,0,'libro_autores',4,'insert','127.0.0.1','080027003469','id_libro,id_autor','   ','4,2'),(20,NULL,0,'libros',4,'insert','127.0.0.1','080027003469','nombre_libro,descripcion_libro,id_genero,cantidad,id_categoria,url,id_etiqueta_libros','   ','prueba,idsjfñsdjfkdsjflkj,2,56,2,~\\imagenes\\,1');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usuario` int(10) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(30) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `cedula` int(13) DEFAULT NULL,
  `direccion` text,
  `telefono` text,
  `fecha_nacimiento` date DEFAULT NULL,
  `correo` text,
  `id_rol` int(3) DEFAULT NULL,
  `clave` varchar(30) DEFAULT NULL,
  `id_estado` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `FK_usuarios` (`id_rol`),
  KEY `FK_usuarios3` (`id_estado`),
  CONSTRAINT `FK_usuarios` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `FK_usuarios3` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `usuarios` */

insert  into `usuarios`(id_usuario,nombres,apellidos,cedula,direccion,telefono,fecha_nacimiento,correo,id_rol,clave,id_estado) values (1,'alejandra','morales',1070966478,'transver 5 nu. 1-75','3143924382','1993-02-14','alenyi2@hotmail.com',1,'3214',1),(13,'camilo','riaño',1014210492,'facatativa','3115567635','1999-04-19','apanda_3@hotmail.com',2,'1234',1),(14,'carmen','perez',1014210434,'corzo','3435676578','1989-12-31','apanda_3@hotmail.com',3,'123456',1),(15,'Ivan','Monje',1234567890,'calle 123','54654564','2016-01-01','prueba@prueba.com',3,'prueba',1);

/* Procedure structure for procedure `SP_admin_consul` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_admin_consul` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_admin_consul`()
BEGIN
    SELECT nombres,apellidos,cedula,direccion,telefono,fecha_nacimiento,correo FROM usuarios WHERE id_rol='1';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_autor` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_autor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_autor`(IN nom TEXT,IN res TEXT,in fec date,IN ip_usu VARCHAR(100),IN mac_usu VARCHAR(100))
BEGIN   
    
    DECLARE acc VARCHAR(50);
    DECLARE tab TEXT;
    DECLARE camp VARCHAR(200);
    DECLARE ante VARCHAR(200);
    DECLARE aho VARCHAR(200);
    DECLARE p INT;
    SET acc='inssert';
    SET tab='autor';
    SET camp='nombre_autor,resena_autor,fecha_nacimiento';
    SET ante='   ';
    SET aho=(SELECT CONCAT(nom,',',res,',',fec));
    SET p=(SELECT MAX(id_autor) FROM autor)+1; 
INSERT INTO autor (nombre_autor,resena_autor,fecha_nacimiento) VALUES(nom,res,fec);
CALL SP_seguridad(acc,0,tab,p,ip_usu,mac_usu,camp,ante,aho);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_biblio_consul` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_biblio_consul` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_biblio_consul`()
BEGIN
    SELECT nombres,apellidos,cedula,direccion,telefono,fecha_nacimiento,correo FROM usuarios WHERE id_rol='2';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_consulta_autor` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_consulta_autor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_consulta_autor`()
BEGIN
SELECT id_autor,nombre_autor FROM autor;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_consulta_categoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_consulta_categoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_consulta_categoria`()
BEGIN
SELECT * FROM categoria;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_consulta_etiqueta` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_consulta_etiqueta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_consulta_etiqueta`()
BEGIN
SELECT * FROM etiquetas;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_consulta_genero` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_consulta_genero` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_consulta_genero`()
BEGIN
SELECT id_genero,nombre_genero FROM genero;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_eliminar_usu` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_eliminar_usu` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_eliminar_usu`(in id int)
BEGIN
DELETE FROM usuarios WHERE id_usuario=id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_genero` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_genero` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_genero`(IN gen text,IN des text,IN ip_usu VARCHAR(100),IN mac_usu VARCHAR(100))
BEGIN   
    
    DECLARE acc VARCHAR(50);
    DECLARE tab TEXT;
    DECLARE camp VARCHAR(200);
    DECLARE ante VARCHAR(200);
    DECLARE aho VARCHAR(200);
    DECLARE p INT;
    SET acc='inssert';
    SET tab='genero';
    SET camp='nombre_genero,descripcion';
    SET ante='   ';
    SET aho=(SELECT CONCAT(gen,',',des));
    SET p=(SELECT MAX(id_genero) FROM genero)+1; 
INSERT INTO genero (nombre_genero,descripcion) VALUES(gen,des);
CALL SP_seguridad(acc,0,tab,p,ip_usu,mac_usu,camp,ante,aho);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_libros` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_libros` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_libros`(in nom_lib text,in des_lib text,in gen int ,in can int,in cate int,in ur text,in eti int,IN ip_usu VARCHAR(100),IN mac_usu VARCHAR(100),in aut1 int,in aut2 int)
BEGIN
    DECLARE acc VARCHAR(50);
    DECLARE tab TEXT;
    DECLARE camp VARCHAR(200);
    DECLARE ante VARCHAR(200);
    DECLARE aho VARCHAR(200);
    DECLARE p INT;
    SET acc='insert';
    SET tab='libros';
    SET camp='nombre_libro,descripcion_libro,id_genero,cantidad,id_categoria,url,id_etiqueta_libros';
    SET ante='   ';
    SET aho=(SELECT CONCAT(nom_lib,',',des_lib,',',gen,',',can,',',cate,',',ur,',',eti));
    SET p=(SELECT MAX(id_libro) FROM libros)+1; 
INSERT  INTO `libros`(nombre_libro,descripcion_libro,id_genero,cantidad,id_categoria,url,id_etiqueta_libros) 
VALUES(nom_lib,des_lib,gen,can,cate,ur,eti);
call SP_Libro_autor(p,aut1,ip_usu,mac_usu);
call SP_Libro_autor(p,aut2,ip_usu,mac_usu);
CALL SP_seguridad(acc,0,tab,p,ip_usu,mac_usu,camp,ante,aho);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_Libro_autor` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_Libro_autor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Libro_autor`(IN id_lib INT,IN id_au INT,IN ip_usu VARCHAR(100),IN mac_usu VARCHAR(100))
BEGIN
DECLARE acc VARCHAR(50);
    DECLARE tab TEXT;
    DECLARE camp VARCHAR(200);
    DECLARE ante VARCHAR(200);
    DECLARE aho VARCHAR(200);
    DECLARE p INT;
    SET acc='insert';
    SET tab='libro_autores';
    SET camp='id_libro,id_autor';
    SET ante='   ';
    SET aho=(SELECT CONCAT(id_lib,',',id_au));
    SET p=id_lib; 
    INSERT INTO libro_autores (id_libro,id_autor) VALUES (id_lib,id_au);
    CALL SP_seguridad(acc,0,tab,p,ip_usu,mac_usu,camp,ante,aho);
    
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_login`(in nom text,in cla varchar (30))
BEGIN
  
  /*consulta tabla usuario y filtro correo y clave*/
  /*CREADO:ALEJANDRAMORALES
  VERSION:1
  FECHA CREACION 14/08/2016*/  
SELECT id_rol,nombres,id_usuario,id_estado FROM usuarios WHERE correo=nom AND clave=cla; 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_M_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_M_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_M_usuario`(in id int,in nom varchar (30),in ape varchar (30),in ced int,in dir text,in tel text,in cor text)
BEGIN
    update usuarios set nombres=nom,apellidos=ape,cedula=ced,direccion=dir,telefono=tel,correo=cor where id_usuario=id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_registro`(IN nom VARCHAR(30),IN ape VARCHAR (30), IN ced INT, IN dir TEXT, IN tel TEXT, IN fec DATE, IN cor TEXT, IN id_r INT,IN cla VARCHAR (30),IN ip_usu VARCHAR(100),in mac_usu varchar(100))
BEGIN
DECLARE acc VARCHAR(50);
    DECLARE tab TEXT;
    DECLARE camp VARCHAR(200);
    DECLARE ante VARCHAR(200);
    DECLARE aho VARCHAR(200);
    DECLARE p INT;
    SET acc='inssert';
    SET tab='usuarios';
    SET camp='nombres,apellidos,cedula,direccion,telefono,fecha_nacimiento,correo,id_rol,clave,id_estado';
    SET ante='   ';
    SET aho=(SELECT CONCAT(nom,',',ape,',',ced,',',dir,',',tel,',',fec,',',cor,',',id_r,',',cla));
    SET p=(SELECT MAX(id_usuario) FROM usuarios)+1;  
iNSERT INTO usuarios (nombres,apellidos,cedula,direccion,telefono,fecha_nacimiento,correo,id_rol,clave) VALUES 
(nom,ape,ced,dir,tel,fec,cor,id_r,cla);
CALL SP_seguridad(acc,0,tab,p,ip_usu,mac_usu,camp,ante,aho);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_rol` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_rol` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_rol`()
BEGIN
    SELECT * FROM rol;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_seguridad` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_seguridad` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_seguridad`(in acc varchar(50),in id_usu int,in tab text,in p int,in ip_usu varchar(100),in mac_usu varchar(100),in camp varchar(200),in ante VARCHAR(200),in aho VARCHAR(200))
BEGIN
    
    INSERT INTO seguridad(fecha,usuario_id,tabla,pk,accion,ip,mac,campos,antes,ahora) VALUES (NOW(),id_usu,tab,p,acc,ip_usu,mac_usu,camp,ante,aho);
   
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_usuario`()
BEGIN
    SELECT a.id_usuario,a.nombres,a.apellidos,a.cedula,a.direccion,a.telefono,a.correo,b.nombre_estado FROM usuarios a,estado b WHERE a.id_estado=b.id_estado;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_usua_consul` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_usua_consul` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_usua_consul`()
BEGIN
    SELECT nombres,apellidos,cedula,direccion,telefono,fecha_nacimiento,correo FROM usuarios WHERE id_rol='3';
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
