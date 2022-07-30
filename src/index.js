const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars'); //Para usar plantillas
const path = require('path');               //Para manejar directorios, basicamente unirlos 
const flash = require('connect-flash');  //Para mostar mensajes
const session = require('express-session'); //Lo necesita el flash tb
const  MySQLstore= require('express-mysql-session'); // para poder guardar la sesion en la sql
const passport = require('passport');
const {database} =require('./keys');

//Initialization
const app = express();
require('./lib/passport'); //para que se entere de la autentificacion que se ha crea do 

//Settings
app.set('port',process.env.PORT || 4000);
app.set('views', path.join(__dirname,'views'));
app.engine('.hbs', exphbs.engine({  //con esto se configura el app.engine
    defaultLayout: 'main',
    layoutDir: path.join(app.get('views'),'layouts'),
    partialsDir: path.join(app.get('views'),'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars') //no hay nada aun
}));
app.set('view engine','.hbs'); //Para utilizar el app.engine


//Middleware
app.use(session({
    secret: 'mysesion',
    resave: false,
    saveUninitialized:false,
    store: new MySQLstore(database)
}))
app.use(flash());       // Para poder usar el middleware de enviar mensajes popups
app.use(morgan('dev'));
app.use(express.urlencoded({extended:false})); //aceptar los datos desde los formularios sin aceptar imagenes ni nada raro
app.use(express.json()); //Para enviar y recibir jsons.
app.use(passport.initialize()); //iniciar passport
app.use(passport.session());    //para que sepa donde guardar y como manejar los datos

//Variables globales
app.use((req,res,next) =>{
    app.locals.signupMessage = req.flash('signupMessage');
    app.locals.success = req.flash('success');
    app.locals.message = req.flash('message');
    app.locals.user = req.user;
    req.masterPass='$2a$10$.6weXYERL6XMB7nb0xcMTus/Qbi4aotItCWLs3QyBDk7cup4oCOo.';
    next();
});

//Routes
app.use(require('./routes')); //busca automaticamente el archivo index.js
app.use(require('./routes/authentication'));
app.use('/balizas',require('./routes/balizas')); //ruta de las balizas. siempre precedido por el primer argumento '/balizas' 
app.use(require('./routes/api'));
app.use(require('./routes/documentos'));
app.use(require('./routes/fotos'));

//Public
app.use(express.static(path.join(__dirname,'public')));

//Starting
app.listen(app.get('port'),()=>{
    console.log("Running on http://localhost:4000", app.get('port'));
})