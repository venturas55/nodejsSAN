Usando el tutorial de https://www.youtube.com/watch?v=qJ5R9WTW0_E

git clone https://github.com/venturas55/nodejsSAN san
cd san
npm i


La base de datos creada y poblada con ciertos datos se encuentra en ./database

sudo apt install mariadb-server
mysql -u root -p

sudo mysql
-- for MySQL
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
-- for MariaDB
ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('newpass');
create database san;

mysql -u root -p san < san.sql

crear  src/keys.js con las credenciales de la BBDD, por ejemplo:
module.exports ={
    database:{
        host:'localhost',
        user:'myusuario',
        password:'mycontraseña',
        database:'mydatabasename',
        masterPass:'2a$10$.6weXYERL6XMB7nb0xcMTus/Qbi4aotItCWLs3QyBDk7cup4oCOo.'
        }
}

Para correr en modo desarrollo ejecutar:    npm run dev


En caso de recibir el error:
            code: 'EADDRINUSE',
            errno: 'EADDRINUSE',
            syscall: 'listen',
            address: '::',
            port: 4000
checkear si node esta en uso, y acabar con el:

    ps aux | grep node
    kill -9 PROCESS_ID
    killall node



npm install pm2 -g
pm2 start ./src/index.js





















```sql
CREATE USER 'foo'@'localhost' IDENTIFIED WITH mysql_native_password BY 'bar';
```



```
GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'localhost';
```

GRANT ALL PRIVILEGES ON *.* TO 'venturas2'@'localhost';
