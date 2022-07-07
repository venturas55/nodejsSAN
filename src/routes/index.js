const express = require('express');
const router = express.Router();

const helpers = require('../lib/helpers');

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
    console.log(req.user.usuario+".jpg");
    const tieneFoto = helpers.existeFotoPerfil(req.user);
    console.log("Tiene foto:"+tieneFoto);
    res.render('profile', { tieneFoto: tieneFoto });
});
router.get('/profile/edit', helpers.isAuthenticated, (req, res) => {
    res.render('profileEdit');
});
router.post('/profile/edit/', helpers.isAuthenticated, async (req, res) => {
    const newUser = {
        usuario: req.body.usuario,
        contrasena: req.body.contrasena,
        email: req.body.email,
        full_name: req.body.fullname,
        privilegio: "san",
    };
    //newUser.contrasena = await helpers.encryptPass(password);
    console.log("guardando en la BBDD");
    //console.log(user);
    res.render('profile');
});

//GESTION actualizar foto perfil
router.post('/upload/:usuario', helpers.isAuthenticated, (req, res) => {
    console.log("Subiendo foto usuario");
    const { user } = req.body;
    console.log(req.params);
    console.log(req.body);
    //const oldUser = await pool.query("SELECT * FROM usuarios WHERE usuario=?", user);
    // var newUser=oldUser;
    //newUser.profilePicture = 
    // await db.query("UPDATE usuarios set ? WHERE usuario = ?", [ newUser,  oldUser, ]);
    req.flash("success", "La foto del perfil de usuario ha sido actualizada con exito");
    res.redirect("/profile");
});


module.exports = router;