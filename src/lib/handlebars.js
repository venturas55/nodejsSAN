const {format} = require('timeago.js');

const helpers ={};

helpers.timeago = (timestamp) =>{
    return format(timestamp);
}

helpers.suma = (balizas)=>{
    var total=0;
    balizas.forEach(element => {
        total++;
    });
    return total;
}


module.exports=helpers;