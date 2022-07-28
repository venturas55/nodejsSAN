const bcrypt=require('bcryptjs');
const path=require('path');
const fs = require('fs');
//const res = require('express/lib/response');
const helpers = {};

helpers.encryptPass = async (password) =>{
    const sal = await bcrypt.genSalt(10);
    password = await bcrypt.hash(password,sal);
    return password;
};

helpers.verifyPassword = async(password,hashedPassword)=>{
    try{
       return await bcrypt.compare(password, hashedPassword);
    }catch(e){
        console.log(e);
    }
}

helpers.isAuthenticated = (req,res,next)=>{
    if(req.isAuthenticated()){
        return next();
    }
    return res.redirect('/signin');
}

helpers.isNotAuthenticated = (req,res,next)=>{
    if(!req.isAuthenticated()){
        return next();
    }
    return res.redirect('/profile');
}

helpers.isAdmin = (req,res,next)=>{
    if(req.user.privilegio=="admin"){
        return next();
    }
    return res.redirect('/noperm');
}

helpers.isNotAdmin = (req,res,next)=>{
    if(!req.user.privilegio=="admin"){
        return next();
    }
    return res.redirect('/noperm');
}



helpers.listadoFotos = (req,res,next)=>{
    const nif=req;
    console.log(nif);
    var fotitos = [];
    var directorio = path.join(__dirname, "../public/img/imagenes", nif);
    fs.readdir(directorio, (err, files) => {
      if (files) {
        files.forEach(file => {
          fotitos.push(file);
        });
      }
    });
    return fotitos;
}

helpers.listadoDocumentos = (req,res,next)=>{
    var documentos = [];
    var directorio = path.join(__dirname, "../public/informes");
    fs.readdir(directorio, (err, files) => {
      if (files) {
        files.forEach(file => {
            documentos.push(file);
        });
      }
    });
    return documentos;
}

/* helpers.existeFotoPerfil = (req,res,next)=>{
    var ruta = path.join(__dirname, "../public/img/profiles/",req.pictureURL); 
    var flag=fs.existsSync(ruta);
    return flag;
} */

module.exports = helpers;