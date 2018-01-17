CREATE DEFINER=`root`@`%` PROCEDURE `show_products`(
	IN linea_producto varchar(50))
BEGIN
			declare line varchar(50);

            set line = concat(linea_producto, "%");
			select * from products
            where productLine like line;

END


CREATE DEFINER=`root`@`%` PROCEDURE `count_customers`(
	IN letra varchar(10))
BEGIN
			declare nombre varchar(50);

            set nombre = concat(letra, "%");

			select count(*) from customers
            where customerName like nombre;

END


CREATE DEFINER=`root`@`%` PROCEDURE `cheap_expensive`()
BEGIN
			select * from products as prod,
			(select min(buyPrice) as min, max(buyPrice) as max from products)
            as temp where temp.max = prod.buyPrice or temp.min = prod.buyPrice;

END
