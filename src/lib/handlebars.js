const {format} = require('timeago.js');
const helpers ={};

helpers.timeago = (timestamp) =>{
    return format(timestamp);
}

helpers.formatearSp = (timestamp) =>{
    mnth = ("0" + (timestamp.getMonth() + 1)).slice(-2),
    day = ("0" + timestamp.getDate()).slice(-2);
  return [day , mnth,timestamp.getFullYear() ].join("/");
}


//Este es el formateo necesario para encajar una fecha en un input de type="date"
helpers.formatearEn = (timestamp) =>{
    mnth = ("0" + (timestamp.getMonth() + 1)).slice(-2),
    day = ("0" + timestamp.getDate()).slice(-2);
  return [timestamp.getFullYear(), mnth,day ].join("-");
}

helpers.ifCond = (v1,v2,options)=>{
  if(v1.fila === v2) {
      return options.fn(this);
    }
    return options.inverse(this);
}

helpers.suma = (balizas)=>{
    var total=0;
    balizas.forEach(element => {
        total++;
    });
    return total;
}


module.exports=helpers;