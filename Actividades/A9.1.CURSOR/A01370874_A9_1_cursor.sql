-- Mauricio Rico Zavala / A01370874

DELIMITER $$
CREATE PROCEDURE modificarify_titulo()
BEGIN declare id int; declare nombre VARCHAR(25); declare titulo VARCHAR(255); declare temp int default FALSE; DECLARE modificar cursor for SELECT film.title, category.name, film.film_id from category inner join film_category on category.category_id = film_category.category_id inner join film on film_category.film_id = film.film_id;
declare continue handler
	for not found
    set temp = true;
open modificar;
read_loop: loop
	fetch modificar into titulo, nombre, id;
    if temp then
		leave read_loop;
	end if;
    update film set title = concat(nombre, "_", titulo) where film_id = id;
end loop;
close modificar;
END$$
DELIMITER ;
