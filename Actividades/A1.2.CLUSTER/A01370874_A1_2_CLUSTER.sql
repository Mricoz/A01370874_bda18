
-- Comando para master SLAVE

CREATE USER slave@'%' IDENTIFIED BY 'contraseña';
GRANT SELECT,REPLICATION CLIENT, PROCESS, FILE, SUPER, REPLICATION SLAVE, RELOAD ON *.* TO slave@'%';
Flush Privileges;
CHANGE MASTER TO MASTER_USER='slave', MASTER_PASSWORD='contraseña';
START slave;
show slave status;
