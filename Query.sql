CREATE TABLE people (
	person_id int,
    last_name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255)
);

INSERT INTO `platzi_blog`.`people` (`last_name`,
`first_name`,`address`,`city`)VALUES ('Hernandéz',
'Monica','Calle Famosa Num 2','México');
INSERT INTO `platzi_blog`.`people` (`last_name`,
`first_name`,`address`,`city`)VALUES ('Armando',
'Casa','Calle Famosa Num 5','Colombia');
UPDATE people
SET `first_name`='Mario'
WHERE idpeople=4;
# comentario selección
SELECT first_name, last_name
FROM people

