const db = require("../database");
const mysqldump = require('mysqldump');
const {database} = require('../keys'); //traigo el database desde el archivo keys

async function insertarLog(usuario,accion,observacion){
    const log={
        usuario,
        accion,
        observacion
    }
    //db.query( "insert into logs values("+usuario+","+accion+","+observacion+")");
    const a = db.query( "insert into logs SET ?",[log]);
    return a;
}

function consulta() {
    // dump the result straight to a file
    console.log(database);
     mysqldump({
        connection: {
            host: database.host,
            user: database.user,
            password: database.password,
            database: database.database,
        },
        dumpToFile: './src/public/dumpSQL/dumpSAN'+Date.now()+'.sql',
    }); 
} 

module.exports = {insertarLog,consulta};