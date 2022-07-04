const express = require("express");
const router = express.Router();
const fs = require('fs');
const path = require('path'); 
const helpers = require("../lib/helpers");

const db = require("../database"); //db hace referencia a la BBDD

router.get("/add",helpers.isAuthenticated, (req, res) => {
  res.render("balizas/add");
});
router.post("/add", helpers.isAuthenticated, async (req, res) => {
  const {
    nif,
    num_internacional,
    tipo,
    telecontrol,
    apariencia,
    periodo,
    caracteristica,
    puerto,
    num_local,
    localizacion,
    latitud,
    longitud,
    altura,
    elevacion,
    linterna,
    alcanceNom,
    alcanceLum,
    candelasCalc,
    candelasInst
  } = req.body;
  const newBalizamiento = {
    nif,
    num_internacional,
    tipo,
    telecontrol,
    apariencia,
    periodo,
    caracteristica,

  };
  const newBalizamientoLocalizacion = {
    nif,
    puerto,
    num_local,
    localizacion,
    latitud,
    longitud
  };
  const newBalizamientoLampara = {
    nif,
    altura,
    elevacion,
    linterna,
    alcanceNom,
    alcanceLum,
    candelasCalc,
    candelasInst
  };
  await db.query("INSERT INTO balizamiento set ?", [newBalizamiento]);
  await db.query("INSERT INTO localizacion set ?", [newBalizamientoLocalizacion]);
  await db.query("INSERT INTO lampara set ?", [newBalizamientoLampara]);
  req.flash("success", "Baliza insertada correctamente");
  res.redirect("/balizas/list"); //te redirige una vez insertado el item
});
router.get("/delete/:nif", helpers.isAuthenticated, async (req, res) => {
  console.log(req.params.nif);
  const { nif } = req.params;
  await db.query("DELETE FROM mantenimiento WHERE nif=?", [nif]);
  await db.query("DELETE FROM observaciones WHERE nif=?", [nif]);
  await db.query("DELETE FROM localizacion WHERE nif=?", [nif]);
  await db.query("DELETE FROM lampara WHERE nif=?", [nif]);
  await db.query("DELETE FROM balizamiento WHERE nif=?", [nif]);
  //TODO: faltaria borrar la carpeta con las fotos
  req.flash("success", "Baliza borrada correctamente");
  res.redirect("/balizas/list");
});
router.get("/list", async (req, res) => {
  const balizas = await db.query(
    "SELECT * FROM balizamiento b, localizacion l where b.nif=l.nif"
  );
  res.render("balizas/list", { balizas });
  //res.render("balizas/list", { balizas: balizas });
  // NO FUNCIONA CON LA BARRA DELANTE res.render('/links/list');
});
router.get("/list/:busqueda", async (req, res) => {
  var { busqueda } = req.params;
  //Añadimos porcentajes para busqueda SQL que contenga 'busqueda' y lo que sea por delante y por detras
  busqueda = "%" + busqueda + "%";
  const balizas = await db.query(
    "SELECT * FROM balizamiento b, localizacion l where b.nif=l.nif AND l.puerto like ? order by l.nif", busqueda);
  //like is case insensitive por defecto. En caso de quererlo sensitivo hay que añadir solo "like binary"
  res.render("balizas/list", { balizas });
  // NO FUNCIONA CON LA BARRA DELANTE res.render('/links/list');
});
router.get("/plantilla/:nif", async (req, res) => {
  const { nif } = req.params;
  var fotitos=[];
  const baliza = await db.query('SELECT * FROM balizamiento b  LEFT JOIN localizacion lo ON lo.nif=b.nif  LEFT JOIN lampara la ON la.nif=b.nif where b.nif=?',[nif]);
  const observaciones = await db.query('SELECT * FROM observaciones where nif=?',[nif]);
  const mantenimiento = await db.query('SELECT * FROM mantenimiento where nif=? order by fecha DESC',[nif]);
  //console.log(observaciones);
  //console.log(mantenimiento[0]);

  //listar
  var directorio= path.join(__dirname,"../public/img/imagenes",nif);
  fs.readdir(directorio, (err, files) => {
    if(files){
       files.forEach(file => {
        fotitos.push(file);
          console.log("este "+fotitos);
      });
    }
      
  }); 
  //fin listar
  console.log("final "+fotitos);
  res.render("balizas/plantilla", {layout: 'layoutParpadeo', baliza: baliza[0], obs: observaciones,mant:mantenimiento,imagen:fotitos });
  // NO FUNCIONA CON LA BARRA DELANTE res.render('/links/list');
});
router.get("/editCaracteristicas/:nif", helpers.isAuthenticated, async (req, res) => {
  const { nif } = req.params;
  const baliza = await db.query("SELECT * FROM balizamiento WHERE nif=?", [
    nif,
  ]);
  /*console.log(baliza);
console.log(baliza[0]);*/
  res.render("balizas/editCaracteristicas", { baliza: baliza[0] });
});
router.get("/editLocalizacion/:nif", helpers.isAuthenticated, async (req, res) => {
  const { nif } = req.params;
  const baliza = await db.query("SELECT * FROM localizacion WHERE nif=?", [
    nif,
  ]);
  /*console.log(baliza);
console.log(baliza[0]);*/
  res.render("balizas/editLocalizacion", { baliza: baliza[0] });
});
router.get("/editLampara/:nif", helpers.isAuthenticated, async (req, res) => {
  const { nif } = req.params;
  const baliza = await db.query("SELECT * FROM lampara WHERE nif=?", [
    nif,
  ]);
  /*console.log(baliza);
console.log(baliza[0]);*/
  res.render("balizas/editLampara", { baliza: baliza[0] });
});
router.post("/editCaracteristicas/:nif", helpers.isAuthenticated, async (req, res) => {
  const nifviejo = req.params.nif;
  var {
    nif,
    num_internacional,
    tipo,
    telecontrol,
    apariencia,
    periodo,
    caracteristica,
  } = req.body;
  periodo = parseInt(periodo);
  const newBaliza = {
    nif: nifviejo,
    num_internacional,
    tipo,
    telecontrol,
    apariencia,
    periodo,
    caracteristica,
  };
  //console.log(newBaliza);
  console.log("req.params " + req.params.nif);
  await db.query("UPDATE BALIZAMIENTO set ? WHERE nif = ?", [
    newBaliza,
    nifviejo,
  ]);
  req.flash("success", "Baliza modificada correctamente");
  res.redirect("/balizas/plantilla/"+nifviejo);
});
router.post("/editLocalizacion/:nif", helpers.isAuthenticated, async (req, res) => {
  const nifviejo = req.params.nif;
  var {
    puerto,
    num_local,
    localizacion,
    latitud,
    longitud,
  } = req.body;
  const newBaliza = {
    nif: nifviejo,
    puerto,
    num_local,
    localizacion,
    latitud,
    longitud,
  };
  console.log("req.params " + req.params.nif);
  await db.query("UPDATE localizacion set ? WHERE nif = ?", [
    newBaliza,
    nifviejo,
  ]);
  req.flash("success", "Localizacion de baliza modificada correctamente");
  res.redirect("/balizas/plantilla/"+nifviejo);
});
router.post("/editLampara/:nif", helpers.isAuthenticated, async (req, res) => {
  const nifviejo = req.params.nif;
  var {
    altura,
    elevacion,
    alcanceNom,
    linterna,
    candelasCalc,
    alcanceLum,
    candelasInst,
  } = req.body;
  const newBaliza = {
    nif: nifviejo,
    altura,
    elevacion,
    alcanceNom,
    linterna,
    candelasCalc,
    alcanceLum,
    candelasInst,
  };
  //console.log(newBaliza);
  console.log("req.params " + req.params.nif);
  await db.query("UPDATE lampara set ? WHERE nif = ?", [
    newBaliza,
    nifviejo,
  ]);
  req.flash("success", "Lampara del aton modificada correctamente");
  res.redirect("/balizas/plantilla/"+nifviejo);
});

router.post("/observaciones/add",helpers.isAuthenticated, async (req,res)=>{
  const {
    nif,
    observaciones,
  } = req.body;
  const observa = {
    nif,
    observaciones,
  };
  console.log(observa);
  await db.query("INSERT INTO observaciones set ?", [observa]);
  req.flash("success", "Observacion insertada correctamente");
  //res.render("/balizas/plantilla/"+nif);
  res.redirect("/balizas/plantilla/"+nif);
});
router.get("/observaciones/delete/:idObs",helpers.isAuthenticated, async (req,res)=>{
  console.log(req.params.idObs);
  const { idObs } = req.params;
  const resp =   await db.query("select nif from observaciones where id_observacion=?", [idObs]);
  const nif=resp[0].nif;
  await db.query("delete from observaciones where id_observacion=?", [idObs]);
  req.flash("success", "Observacion de baliza borrado correctamente "+ nif);
  res.redirect("/balizas/plantilla/"+nif);
});
router.get("/observaciones/edit/:idObs", helpers.isAuthenticated,async (req,res)=>{
const { idObs } = req.params;
console.log("Que id es: "+idObs);
const observacion = await db.query("SELECT * FROM observaciones WHERE id_observacion=?", [idObs,]);
//console.log(baliza);
//console.log(baliza[0]);
res.render("balizas/editObservaciones", { observacion: observacion[0] });
});
router.post("/observaciones/edit/:idObs",helpers.isAuthenticated, async (req,res)=>{

   var {
    id_observacion,
    nif,
    observacionNueva,
  } = req.body;
  console.log("1: "+id_observacion);
  console.log("2: "+nif);
  console.log("3: "+observacionNueva);
  const newObservacion = {
    id_observacion,
    nif,
    observaciones:observacionNueva,
  };
   await db.query("UPDATE observaciones set ? WHERE id_observacion = ?", [
    newObservacion,
    id_observacion,
  ]); 
  req.flash("success", "Observacion modificada correctamente en la baliza ");
  res.redirect("/balizas/plantilla/"+nif);
});

router.post("/mantenimiento/add", helpers.isAuthenticated,async (req,res)=>{
  const {
    nif,
    fecha,
    mantenimiento,
  } = req.body;
  const mant = {
    nif,
    fecha,
    mantenimiento,
  };
  console.log(mant);
  await db.query("INSERT INTO mantenimiento set ?", [mant]);
  req.flash("success", "Mantenimiento en baliza insertado correctamente");
  res.redirect("/balizas/plantilla/"+nif);
});
router.get("/mantenimiento/delete/:idMan", helpers.isAuthenticated,async (req,res)=>{
  console.log(req.params.idMan);
  const { idMan } = req.params;
  const resp =   await db.query("select nif from mantenimiento where id_mantenimiento=?", [idMan]);
  const nif=resp[0].nif;
  await db.query("delete from mantenimiento where id_mantenimiento=?", [idMan]);
  req.flash("success", "mantenimiento de baliza borrado correctamente "+ nif);
  res.redirect("/balizas/plantilla/"+nif);
});
router.get("/mantenimiento/edit/:idMan", helpers.isAuthenticated,async (req,res)=>{
  const { idMan } = req.params;
  //console.log("Que id es: "+idMan);
  const mantenimient = await db.query("SELECT * FROM mantenimiento WHERE id_mantenimiento=?", [idMan,]);
  console.log("va");
  console.log(mantenimient[0]);
  res.render("balizas/editMantenimiento", { mant: mantenimient[0] });
 
});
router.post("/mantenimiento/edit/:idMan",helpers.isAuthenticated, async (req,res)=>{

  var {
   id_mantenimiento,
   nif,
   fechaNueva,
   mantenimientoNuevo
 } = req.body;
 console.log("1: "+id_mantenimiento);
 console.log("2: "+nif);
 console.log("3: "+fechaNueva);
 console.log("4: "+mantenimientoNuevo);
 const newObservacion = {
    id_mantenimiento,
   nif,
   fecha:fechaNueva,
   mantenimiento:mantenimientoNuevo,
 };
  await db.query("UPDATE mantenimiento set ? WHERE id_mantenimiento = ?", [
   newObservacion,
   id_mantenimiento,
 ]); 
 req.flash("success", "Mantenimiento modificado correctamente en la baliza ");
 res.redirect("/balizas/plantilla/"+nif);
});

router.get("/mapa/:nif", async (req,res)=>{
  const { nif } = req.params;
  const baliza = await db.query('SELECT * FROM balizamiento b  LEFT JOIN localizacion lo ON lo.nif=b.nif  LEFT JOIN lampara la ON la.nif=b.nif where b.nif=?',[nif]);
   res.render("mapa", {layout: 'layoutMapa', baliza: baliza[0],  });
  // NO FUNCIONA CON LA BARRA DELANTE res.render('/links/list');
  
});



module.exports = router;
