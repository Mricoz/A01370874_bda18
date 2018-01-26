
-- Trigger para que el sueldo no pase de 30% en aumentos

create trigger sueldo_treinta after update of salary on employee referencing new as new_values old as old_values for each row mode db2sql when (new_values.salary > old_values.salary * 1.3) signal sqlstate '22005' set message_text='ERROR -> SALARIO MAS DE 30%'

-- Trigger para poder hacer una orden cuando si existen suficientes productos

create trigger orden_compra after insert on ordenes referencing new as new_values for each row mode db2sql when ((SELECT QUANTITY FROM inventory where inventory.PID = new_values.PID) < new_values.QUANTITY) signal sqlstate '22005' set message_text='ERROR -> NO HAY SUFICIENTES PRODUCTOS'

-- Trigger para que se reduzca por uno la cantidad de productos cuando el estado es delivered

create trigger quitar_prod after update on ordenes referencing new as new_values for each row mode db2sql when (new_values.status = 'delivered') begin atomic update inventory set quantity = quantity - 1 where PID = new_values.PID; end
