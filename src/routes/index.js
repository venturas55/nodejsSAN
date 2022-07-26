const express = require('express');
const router = express.Router();
const path = require('path');
const helpers = require('../lib/helpers');

const db = require("../database"); //db hace referencia a la BBDD
const { unlink } = require('fs-extra');

router.get('/', (req, res) => {
    res.render('index');
});

//MOSTRAR CALCULOS
router.get('/calculos', (req, res) => {
    res.render('calculos', { layout: 'layoutCalculos' });
});

//MOSTRAR PLAN
router.get('/plan', (req, res) => {
    res.render('plan', { layout: 'layoutSimple' });
});

//MOSTRAR PERFIL  -RUD  //TODO: poder borrar perfil
router.get('/profile', helpers.isAuthenticated, (req, res) => {
    console.log(req.user.usuario + ".jpg");
    const tieneFoto = helpers.existeFotoPerfil(req.user);
    res.render('profile', { tieneFoto: tieneFoto });
});
router.get('/profile/edit', helpers.isAuthenticated, (req, res) => {
    res.render('profileEdit');
});
router.post('/profile/edit/', helpers.isAuthenticated, async (req, res) => {
    const rows = await db.query("SELECT * FROM usuarios WHERE usuario= ?", [req.body.oldusuario]);
    var user = rows[0];

    console.log(req.body.oldcontrasena + " / " + user.contrasena);
    const validPassword = await helpers.verifyPassword(req.body.oldcontrasena, user.contrasena);
    if (validPassword){
        user.usuario = req.body.usuario;
        user.email = req.body.email;
        user.full_name = req.body.full_name;
        user.contrasena = await helpers.encryptPass(req.body.newcontrasena);
        console.log("guardando en la BBDD");
        //console.log(user);
        const result = await db.query("UPDATE usuarios SET ? where id= ?", [user,user.id]);
        const tieneFoto = helpers.existeFotoPerfil(req.user);
        res.render('profile', { tieneFoto: tieneFoto });
    }else{
        res.send("Password incorrecto");
    }

});
router.get("/profile/delete/:usuario", helpers.isAuthenticated, async (req, res) => {
    console.log(req.params);
    const { usuario } = req.params;
    req.logOut();
    await db.query("DELETE FROM usuarios WHERE usuario=?", [usuario]);
    await unlink(path.resolve('src/public/img/profiles/' + usuario + ".jpg")); //TODO: faltaria gestionar extension
    req.flash("success", "Usuario borrado correctamente");

    res.redirect('/');
});

//GESTION actualizar foto perfil
router.post('/upload/:usuario', helpers.isAuthenticated, (req, res) => {
    console.log("Subiendo foto usuario");
    const { user } = req.body;
    console.log(req.params);
    console.log(req.body);
    //const oldUser = await db.query("SELECT * FROM usuarios WHERE usuario=?", user);
    // var newUser=oldUser;
    //newUser.profilePicture = 
    // await db.query("UPDATE usuarios set ? WHERE usuario = ?", [ newUser,  oldUser, ]);
    req.flash("success", "La foto del perfil de usuario ha sido actualizada con exito");
    res.redirect("/profile");
});

router.get('/error', (req, res) => {
    console.log("Redirect");
    res.redirect('/error');
});


module.exports = router;