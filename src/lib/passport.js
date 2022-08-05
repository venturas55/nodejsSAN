const passport = require("passport");
const LocalStrategy = require("passport-local").Strategy;

const pool = require("../database");
const helpers = require("../lib/helpers");
const funciones = require("../lib/funciones.js");

passport.use(
    "local.signin",
    new LocalStrategy(
        {
            //name del formulario
            usernameField: "usuario",
            passwordField: "password",
            passReqToCallback: true,
        },
        async (req, username, password, done) => {
            const rows = await pool.query("SELECT * FROM usuarios WHERE usuario= ?", [username]);
           
            if (rows.length > 0) {
                const user = rows[0];
                console.log(user);
                const validPassword = await helpers.verifyPassword(password,user.contrasena);
                if (validPassword){
                    funciones.insertarLog(user.usuario,"LOGIN usuario", user.id +" "+ user.usuario + " "+ user.email);
                    done(null, user, req.flash('success', "Welcome " + user.usuario));
                }
                else
                    done(null, false, req.flash('message', "El password introducido es incorrecto"));
            } else {
                return done(null, false, req.flash('message', "Ese usuario no existe"));
            }
        }
    )
);

passport.use(
    "local.signup",
    new LocalStrategy(
        {
            usernameField: "usuario",
            passwordField: "password",
            passReqToCallback: true,
        },
        async (req, username, password, done) => {


            //const { cuerpo } = req.body;
            const newUser = {
                usuario:    username,
                contrasena: password,
                email:      req.body.email,
                full_name:  req.body.fullname,
                privilegio: "san",
            };
            newUser.contrasena = await helpers.encryptPass(password);
            const result = await pool.query("INSERT INTO usuarios SET ?", [newUser]);
            newUser.id = result.insertId;
            funciones.insertarLog(newUser.usuario,"INSERT usuario",newUser.id + " "+newUser.usuario+" "+ newUser.full_name);
            return done(null, newUser); //Es el que se almacena en sesion
             /*const result = await pool.query("SELECT * FROM usuarios WHERE usuario=?", newUser.usuario);
            console.log(result);

            if(result[0]){
                console.log("Ya existe"+result[0].usuario);
                return done(null,false,req.flash('message','El usuario ya existe! Puebe con otro nombre de usuario.'));
            }
            else{
                console.log("newUser"+[newUser]);
                const result = await pool.query("INSERT INTO usuarios SET ?", [newUser]);
                newUser.id = result.insertId;
                console.log(result);
                return done(null, newUser);
            } */

        }
    )
);

//comprobar esto
passport.serializeUser((user, done) => {
    done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
    console.log([id]);
    const rows = await pool.query("SELECT * FROM usuarios WHERE id= ?", [id]);
    //done(new Error('borra la puta sesion'), rows[0]);
    done(null, rows[0]);
});
