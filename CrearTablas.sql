#En este script se realizara las entidades sin llaves foraneas
CREATE TABLE `platzi_blog`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
  #Crea tabla usuarios
  CREATE TABLE `platzi_blog`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC));
  
  #Crear tabla dependiente 
  CREATE TABLE `platzi_blog`.`post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `fecha_publicacion` TIMESTAMP(6) NULL,
  `contenido` TEXT(255) NOT NULL,
  `estatus` CHAR(8) NOT NULL,
  `usuario_id` INT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`));
  
  ALTER TABLE `platzi_blog`.`post` 
ADD INDEX `post_usuarios_idx` (`usuario_id` ASC);
ALTER TABLE `platzi_blog`.`post` 
ADD CONSTRAINT `post_usuarios`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `platzi_blog`.`usuarios` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

