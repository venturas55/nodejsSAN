const db = require("../database");

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


module.exports = {insertarLog};