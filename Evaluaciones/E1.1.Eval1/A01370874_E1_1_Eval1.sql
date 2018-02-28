-- Mauricio Rico Zavala
-- A01370874
-- Primer Examen Parcial

-------- Creacion de Tabla LOG_FILM
CREATE TABLE LOG_FILM (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    tipo VARCHAR(45),
    film_id SMALLINT(5),
    last_value TINYINT(3) UNSIGNED,
    new_value TINYINT(3) UNSIGNED,
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-------- Creacion de Stored Procedure
DELIMITER $$
CREATE PROCEDURE insert_film(
	IN tipo_in VARCHAR(45),
  	IN film_id_in SMALLINT(5),
  	IN last_value_in TINYINT(3) UNSIGNED,
  	IN new_value_in TINYINT(3) UNSIGNED )
  	BEGIN
  	INSERT INTO LOG_FILM (tipo, film_id, last_value, new_value) VALUES (tipo_in, film_id_in, last_value_in, new_value_in);
  	END $$
DELIMITER ;

-------- Creacion de Trigger
DELIMITER $$
CREATE TRIGGER update_film AFTER UPDATE ON film FOR EACH ROW
	BEGIN
    	CALL insert_film(NEW.film_id, OLD.original_language_id, NEW.original_language_id);
  	END;
DELIMITER ;

-------- Procedimiento Almacenado y Cursor
DELIMITER $$
CREATE PROCEDURE update_original_languages()
	BEGIN
    	DECLARE id int;
    	DECLARE done int DEFAULT FALSE;
    	DECLARE cursor CURSOR FOR SELECT film_id FROM film;
    	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;

		OPEN cursor;
		read_loop: LOOP
			FETCH cursor INTO id;
		IF done THEN
			LEAVE read_loop;
		END IF;

		IF (SELECT category_id FROM film_category WHERE film_id = id) = 6 THEN

		END IF;
	    END LOOP;
	    CLOSE cursor;
  END $$
DELIMITER ;

CALL update_original_languages();

--------- Caso Practico DB2
-- Crear tablas
CREATE TABLE mary_gomitas(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY GENERATED ALWAYS AS INDENTITY (START WITH 1 INCREMENT BY 1),
	tipo VARCHAR(50) NOT NULL,
	precio DECIMAL(6,2) NOT NULL,
	inicio TIMESTAMP NOT NULL,
	fin TIMESTAMP NOT NULL,
	period business_time(inicio, fin)
)
-- inserts
INSERT INTO mary_gomitas (tipo, precio, inicio, fin) VALUES ('Gomita1', 10.00, '2018-01-01', '2019-01-01')
INSERT INTO mary_gomitas (tipo, precio, inicio, fin) VALUES ('Gomita2', 11.00, '2018-01-01', '2019-01-01')
INSERT INTO mary_gomitas (tipo, precio, inicio, fin) VALUES ('Gomita3', 12.00, '2018-01-01', '2019-01-01')
INSERT INTO mary_gomitas (tipo, precio, inicio, fin) VALUES ('Gomita4', 13.00, '2018-01-01', '2019-01-01')
INSERT INTO mary_gomitas (tipo, precio, inicio, fin) VALUES ('Gomita5', 14.00, '2018-01-01', '2019-01-01')
INSERT INTO mary_gomitas (tipo, precio, inicio, fin) VALUES ('Gomita6', 15.00, '2018-01-01', '2019-01-01')
INSERT INTO mary_gomitas (tipo, precio, inicio, fin) VALUES ('Gomita7', 16.00, '2018-01-01', '2019-01-01')
INSERT INTO mary_gomitas (tipo, precio, inicio, fin) VALUES ('Gomita8', 17.00, '2018-01-01', '2019-01-01')
INSERT INTO mary_gomitas (tipo, precio, inicio, fin) VALUES ('Gomita9', 18.00, '2018-01-01', '2019-01-01')
INSERT INTO mary_gomitas (tipo, precio, inicio, fin) VALUES ('Gomita10', 19.00, '2018-01-01', '2019-01-01')
INSERT INTO mary_gomitas (tipo, precio, inicio, fin) VALUES ('Gomita11', 20.00, '2018-01-01', '2019-01-01')
INSERT INTO mary_gomitas (tipo, precio, inicio, fin) VALUES ('Gomita12', 25.00, '2018-01-01', '2019-01-01')

-- updates
UPDATE mary_gomitas FOR PORTION OF business_time from '2018-02-01' to '2019-01-01' set precio = (precio * 1.45)
UPDATE mary_gomitas FOR PORTION of business_time from '2018-02-15' to '2019-01-01' set precio = ((precio/1.45) * 1.10)
UPDATE mary_gomitas FOR PORTION of business_time from '2018-04-25' to '2019-01-01' set precio = (precio * 1.45)
UPDATE mary_gomitas FOR PORTION of business_time from '2018-05-05' to '2019-01-01' set precio = ((precio/1.45) * 1.10)
UPDATE mary_gomitas FOR PORTION of business_time from '2018-10-25' to '2019-01-01' set precio = (precio * 1.45)
UPDATE mary_gomitas FOR PORTION of business_time from '2018-11-05' to '2019-01-01' set precio = ((precio/1.45) * 1.10)

-- consultas
SELECT AVG(precio) FROM mary_gomitas WHERE business_time('2018-01-01', '2019-01-01')
SELECT MAX(precio) FROM mary_gomitas
SELECT MIN(precio) FROM mary_gomitas
