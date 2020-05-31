## Buscar con From 
SELECT *
FROM usuarios
	INNER JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;
    
SELECT *
FROM usuarios
	LEFT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;

SELECT *
FROM usuarios
	RIGHT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;
##Trae Todo
SELECT *
FROM usuarios
	LEFT JOIN posts ON usuarios.id = posts.usuario_id
    
UNION 
SELECT *
FROM usuarios
	RIGHT JOIN posts ON usuarios.id = posts.usuario_id;
    
##Selecciona lo que no esta interseptado en ninguna 
SELECT *
FROM usuarios
	LEFT JOIN posts ON usuarios.id = posts.usuario_id
    WHERE posts.usuario_id IS NULL
UNION 
SELECT *
FROM usuarios
	RIGHT JOIN posts ON usuarios.id = posts.usuario_id
    WHERE posts.usuario_id IS NULL;
    
    
##Seleccionar usuarios que tengan post

##Selecciona post activos 
SELECT *
FROM posts
WHERE estatus != 'activo';

##Selecciona post activos 
SELECT *
FROM posts
WHERE titulo LIKE '%escandalo%'; ##Busca por palabra escandalo

## filtra por añor
SELECT *
FROM posts
WHERE fecha_publicacion BETWEEN '2023-01-01' AND '2026-01-01';
##Filtra por año sin especificar lo demas
SELECT *
FROM posts
WHERE YEAR(fecha_publicacion) BETWEEN '2023' AND '2026';

##JUntar criterios

SELECT *
FROM posts
WHERE usuario_id IS NOT NULL
	AND estatus = 'activo';




SELECT COUNT(nickname) 
FROM usuarios
    WHERE email IS NOT NULL;

## Contar cuantos registros hay 

SELECT nickname, id, COUNT(*) post_quanitity 
FROM usuarios
    GROUP BY id;
## Ordena por categoria y año de post   y cuenta cuantos post fueron en cada año
SELECT categoria_id,YEAR(fecha_publicacion) AS post_year,COUNT(*) AS post_quantity
FROM posts
group by post_year,categoria_id;


# Cantidad de post por año
SELECT YEAR(fecha_publicacion) AS post_year,COUNT(*) AS post_quantity
FROM posts
	group by post_year;
    
##  Traer datos de tablas muchos a muchos

SELECT posts.titulo, count(*) numero_de_etiquetas
FROM posts
	INNER JOIN posts_etiquetas ON posts.id = posts_etiquetas.post_id # une tabla post con posts-etiquetas
    #INNER JOIN etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
    group by posts.id
    order by numero_de_etiquetas DESC;

## Cuales son las etiquetas que no tiene post
SELECT posts.titulo, group_concat(nombre_etiqueta)
FROM posts
	INNER JOIN posts_etiquetas ON posts.id = posts_etiquetas.post_id
    INNER JOIN etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
    group by posts.id;
 
 #Une la tabla de etiquetas con información como nombre con la tabla nombre etiquetas con informacion cde las etiquetas usadas
  
 SELECT *
 FROM etiquetas
	LEFT JOIN posts_etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
WHERE posts_etiquetas.etiqueta_id IS NULL;

#Trae categoria de post y ordena segun post

SELECT c.nombre_categoria, count(*) AS cantidad_de_post
	FROM categorias AS c
		INNER JOIN posts AS p ON c.id = p.categoria_id
	group by c.id # es importante por que determina la cantidad de datos que se ven 
	order by cantidad_de_post DESC
    LIMIT 1;
    
#que usuario escribe mas post 
 SELECT u.nickname, count(*) AS cantidad_de_post
	FROM usuarios AS u
		INNER JOIN posts AS p ON u.id = p.usuario_id
	group by u.id # es importante por que determina la cantidad de datos que se ven 
	order by cantidad_de_post DESC;

  
#que usuario escribe mas post 
 SELECT u.nickname, count(*) AS cantidad_de_post, group_concat(nombre_categoria) as categorias_que_escribe
	FROM usuarios AS u
		INNER JOIN posts AS p ON u.id = p.usuario_id
        INNER JOIN categorias AS c On c.id = p.categoria_id 
	group by u.id # es importante por que determina la cantidad de datos que se ven 
