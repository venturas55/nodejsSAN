const mysql = require('mysql');
const {promisify}=require('util');
const {database} = require('./keys');
const pool = mysql.createPool(database);
//const Pool = require('mysql/lib/Pool');


mysql.createPool(database);

pool.getConnection((err, connection)=>{
    if(err){
        if(err.code === 'PROTOCOL_CONNECTION_LOST'){
            console.error('Database connexion was cerrada');
        }
        if(err.code === 'ER_CON_COUNT_ERROR'){
            console.error('Database has too many conexiones');
        }
        if(err.code === 'ECONNREFUSED'){
            console.error('database conexion fue rechazada');
        }
    }

    if(connection) connection.release();
    console.log('DB is Connected');
    return;
});
//promisify pool queries
pool.query=promisify(pool.query);

module.exports = pool;