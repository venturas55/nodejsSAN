const express = require('express');
const router = express.Router();
const path = require('path');
const helpers = require('../lib/helpers');

const db = require("../database"); //db hace referencia a la BBDD
const { unlink } = require('fs-extra');
const { access, constants } = require('node:fs');

//MOSTRAR PAGINA INICIAL
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

//MOSTRAR PERFIL  -RUD  
router.get('/profile', helpers.isAuthenticated, (req, res) => {
    res.render('profile');
});
router.get('/profile/edit', helpers.isAuthenticated, (req, res) => {
    res.render('profileEdit');
});
router.post('/profile/edit/', helpers.isAuthenticated, async (req, res) => {
    const rows = await db.query("SELECT * FROM usuarios WHERE id= ?", [req.body.id]);
    var user = rows[0];

    console.log(req.body.oldcontrasena + " / " + user.contrasena);
    const validPassword = await helpers.verifyPassword(req.body.oldcontrasena, user.contrasena);
    if (validPassword) {
        user.usuario = req.body.usuario;
        user.email = req.body.email;
        user.full_name = req.body.full_name;
        user.contrasena = await helpers.encryptPass(req.body.newcontrasena);
        console.log("guardando en la BBDD");
        //console.log(user);
        const result = await db.query("UPDATE usuarios SET ? where id= ?", [user, req.body.id]);
        res.render('profile');
    } else {
        res.send("Password incorrecto");
    }
});
router.get("/profile/delete/:id", helpers.isAuthenticated, async (req, res) => {
    console.log(req.params);
    const { id } = req.params;
    //borramos foto
    const filePath = path.resolve('src/public/img/profiles/' + user.pictureURL);
    access(filePath, constants.F_OK, async (err) => {
        if (err) {
            console.log("No tiene foto de perfil");
        } else {
            console.log('File exists. Deleting now ...');
            await unlink(filePath);
        }
    });
    //hacemos logout
    req.logOut();
    const user = await db.query("SELECT * FROM usuarios where id=?", [id]);
    //TODO: las putas sesiones parece que hay que borrarlas todas si no empieza a dar errores...
    await db.query("DELETE FROM sessions");
    await db.query("DELETE FROM usuarios WHERE id=?", [id]);

    req.flash("success", "Usuario borrado correctamente");

    res.redirect('/');
});

//GESTION  foto perfil
router.post('/upload/:id', helpers.isAuthenticated, async (req, res) => {
    const { id } = req.params;
    //console.log(req.file);
    var usuarioMod = await db.query("select * from usuarios where id = ?", id);
    usuarioMod = usuarioMod[0];
    usuarioMod.pictureURL = req.file.filename;
    await db.query("UPDATE usuarios set  ? WHERE id=?", [usuarioMod, id]);
    req.flash("success", "La foto del perfil de usuario ha sido actualizada con exito");

    //TODO: borrar foto de perfil anterior???
    res.redirect("/profile");
});
router.get("/profile/borrarfoto/:id/:url", helpers.isAuthenticated, async (req, res) => {
    console.log(req.params);
    const { url } = req.params;
    const { id } = req.params;
    await db.query("UPDATE usuarios set pictureURL = NULL WHERE id=?", [id]);

    const filePath = path.resolve('src/public/img/profiles/' + url);
    access(filePath, constants.F_OK, async (err) => {
        if (err) {
            console.log("No tiene foto de perfil");
        } else {
            console.log('File exists. Deleting now ...');
            await unlink(filePath);
        }
    });

    req.flash("success", "Imagen borrada correctamente");
    res.redirect('/profile');
});

//GESTION INVENTARIO
router.get('/inventario', async (req, res) => {
    const inventario = await db.query("select * from inventario order by fila,columna");
    res.render('inventario/inventario', { inventario });
});
router.get('/inventario/edit/:id', async (req, res) => {
    const { id } = req.params;
    console.log(id);
    const item = await db.query("select * from inventario where id=?", id);
    console.log(item[0]);
    res.render('inventario/edit', { item: item[0] });
});
router.post('/inventario/edit/:id', helpers.isAuthenticated, async (req, res) => {
    var {
        id,
        item,
        descripcion,
        cantidad,
        fila,
        columna
    } = req.body;

    const nuevoItem = {
        id,
        item,
        descripcion,
        cantidad,
        fila,
        columna
    };
    await db.query("update inventario set ? where id=?", [nuevoItem, id]);

    res.redirect("/inventario");
});
router.get("/inventario/delete/:id", helpers.isAuthenticated, async (req, res) => {
    console.log(req.params.idObs);
    const { id } = req.params;
    await db.query("delete from inventario where id=?", [id]);
    req.flash("success", "Item eliminado correctamente.");
    res.redirect("/inventario");
});

//MOSTRAR ERROR
router.get('/error', (req, res) => {
    console.log("Redirect");
    res.redirect('/error');
});


module.exports = router;