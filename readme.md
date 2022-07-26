Usando el tutorial de https://www.youtube.com/watch?v=qJ5R9WTW0_E

git clone https://github.com/venturas55/mysqlNODEjsSAN nodeSANfolder

La base de datos creada y poblada con ciertos datos se encuentra en ./database

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


























```sql
CREATE USER 'foo'@'localhost' IDENTIFIED WITH mysql_native_password BY 'bar';
```



```
GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'localhost';
```

GRANT ALL PRIVILEGES ON *.* TO 'venturas2'@'localhost';
