const express = require("express");
const router = express.Router();
const { unlink } = require('fs-extra');
const path = require('path');

const helpers = require("../lib/helpers");

const db = require("../database"); //db hace referencia a la BBDD

//CRUD create
router.get("/add", helpers.isAuthenticated, (req, res) => {
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

//CRUD read
router.get("/list", async (req, res) => {
  const balizas = await db.query(
    "SELECT * FROM balizamiento b left join localizacion l on b.nif=l.nif"
  );
  res.render("balizas/list", { balizas });
  //res.render("balizas/list", { balizas: balizas });
  // NO FUNCIONA CON LA BARRA DELANTE res.render('/links/list');
});
router.get("/list/:busqueda", async (req, res) => {
  var { busqueda } = req.params;
  var balizas;
  if (busqueda === 'Ext') {
    console.log("Externas");
    balizas = await db.query("SELECT * FROM balizamiento b, localizacion l where b.nif=l.nif AND l.puerto not like '%valencia%' and l.puerto not like '%sagunto%' and l.puerto not like '%gandia%' order by l.nif");
  }
  else {
    busqueda = "%" + busqueda + "%";
    balizas = await db.query("SELECT * FROM balizamiento b, localizacion l where b.nif=l.nif AND l.puerto like ? order by l.nif", busqueda);
    //like is case insensitive por defecto. En caso de quererlo sensitivo hay que añadir solo "like binary"
  }
  res.render("balizas/list", { balizas });
  // NO FUNCIONA CON LA BARRA DELANTE res.render('/links/list');
});
router.get("/list/:filtro/:valor", async (req, res) => {
  var obj = req.params;
  var balizas;
  //Añadimos porcentajes para busqueda SQL que contenga 'busqueda' y lo que sea por delante y por detras
  obj.valor = "%" + obj.valor + "%";
  console.log(obj);
  switch (obj.filtro) {
    case 'nif':
      balizas = await db.query("SELECT * FROM balizamiento b, localizacion l where b.nif=l.nif AND l.nif like ? order by l.nif", obj.valor);
      break;
    case 'puerto':
      balizas = await db.query("SELECT * FROM balizamiento b, localizacion l where b.nif=l.nif AND l.puerto like ? order by l.nif", obj.valor);
      break;
    case 'localizacion':
      balizas = await db.query("SELECT * FROM balizamiento b, localizacion l where b.nif=l.nif AND l.localizacion like ? order by l.nif", obj.valor);
      break;
    case 'tipo':
      balizas = await db.query("SELECT * FROM balizamiento b, localizacion l where b.nif=l.nif AND b.tipo like ? order by l.nif", obj.valor);
      break;
    case 'apariencia':
      balizas = await db.query("SELECT * FROM balizamiento b, localizacion l where b.nif=l.nif AND b.apariencia like ? order by l.nif", obj.valor);
      break;
  }
  //like is case insensitive por defecto. En caso de quererlo sensitivo hay que añadir solo "like binary"
  res.render("balizas/list", { balizas });
  // NO FUNCIONA CON LA BARRA DELANTE res.render('/links/list');
});
router.get("/plantilla/:nif", async (req, res) => {
  const { nif } = req.params;

  const baliza = await db.query('SELECT * FROM balizamiento b  LEFT JOIN localizacion lo ON lo.nif=b.nif  LEFT JOIN lampara la ON la.nif=b.nif where b.nif=?', [nif]);
  const observaciones = await db.query('SELECT * FROM observaciones where nif=?', [nif]);
  const mantenimiento = await db.query('SELECT * FROM mantenimiento where nif=? order by fecha DESC', [nif]);

  var fotitos = helpers.listadoFotos(nif);

  res.render("balizas/plantilla", { layout: 'layoutPlantilla', baliza: baliza[0], obs: observaciones, mant: mantenimiento, imagen: fotitos });
  // NO FUNCIONA CON LA BARRA DELANTE res.render('/links/list');
});

//CRUD update
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
  res.redirect("/balizas/plantilla/" + nifviejo);
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
  res.redirect("/balizas/plantilla/" + nifviejo);
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
  res.redirect("/balizas/plantilla/" + nifviejo);
});

//CRUD delete
router.get("/delete/:nif", helpers.isAdmin , async (req, res) => {
  console.log("VOY A BORRAR LA PUTA BALIZA");
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

//GESTION CRUD observaciones
router.post("/observaciones/add", helpers.isAuthenticated, async (req, res) => {
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
  res.redirect("/balizas/plantilla/" + nif);
});
router.get("/observaciones/delete/:idObs", helpers.isAuthenticated, async (req, res) => {
  console.log(req.params.idObs);
  const { idObs } = req.params;
  const resp = await db.query("select nif from observaciones where id_observacion=?", [idObs]);
  const nif = resp[0].nif;
  await db.query("delete from observaciones where id_observacion=?", [idObs]);
  req.flash("success", "Observacion de baliza " + nif + " borrada correctamente.");
  res.redirect("/balizas/plantilla/" + nif);
});
router.get("/observaciones/edit/:idObs", helpers.isAuthenticated, async (req, res) => {
  const { idObs } = req.params;
  console.log("Que id es: " + idObs);
  const observacion = await db.query("SELECT * FROM observaciones WHERE id_observacion=?", [idObs,]);
  //console.log(baliza);
  //console.log(baliza[0]);
  res.render("balizas/editObservaciones", { observacion: observacion[0] });
});
router.post("/observaciones/edit/:idObs", helpers.isAuthenticated, async (req, res) => {

  var {
    id_observacion,
    nif,
    observacionNueva,
  } = req.body;

  const newObservacion = {
    id_observacion,
    nif,
    observaciones: observacionNueva,
  };
  await db.query("UPDATE observaciones set ? WHERE id_observacion = ?", [
    newObservacion,
    id_observacion,
  ]);
  req.flash("success", "Observacion modificada correctamente en la baliza " + nif);
  res.redirect("/balizas/plantilla/" + nif);
});
//GESTION CRUD mantenimiento
router.post("/mantenimiento/add", helpers.isAuthenticated, async (req, res) => {
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
  res.redirect("/balizas/plantilla/" + nif);
});
router.get("/mantenimiento/delete/:idMan", helpers.isAuthenticated, async (req, res) => {
  console.log(req.params.idMan);
  const { idMan } = req.params;
  const resp = await db.query("select nif from mantenimiento where id_mantenimiento=?", [idMan]);
  const nif = resp[0].nif;
  await db.query("delete from mantenimiento where id_mantenimiento=?", [idMan]);
  req.flash("success", "mantenimiento de baliza " + nif + " borrado correctamente ");
  res.redirect("/balizas/plantilla/" + nif);
});
router.get("/mantenimiento/edit/:idMan", helpers.isAuthenticated, async (req, res) => {
  const { idMan } = req.params;
  //console.log("Que id es: "+idMan);
  const mantenimient = await db.query("SELECT * FROM mantenimiento WHERE id_mantenimiento=?", [idMan,]);
  console.log("va");
  console.log(mantenimient[0]);
  res.render("balizas/editMantenimiento", { mant: mantenimient[0] });

});
router.post("/mantenimiento/edit/:idMan", helpers.isAuthenticated, async (req, res) => {
  var {
    id_mantenimiento,
    nif,
    fechaNueva,
    mantenimientoNuevo
  } = req.body;
  console.log("1: " + id_mantenimiento);
  console.log("2: " + nif);
  console.log("3: " + fechaNueva);
  console.log("4: " + mantenimientoNuevo);
  const newObservacion = {
    id_mantenimiento,
    nif,
    fecha: fechaNueva,
    mantenimiento: mantenimientoNuevo,
  };
  await db.query("UPDATE mantenimiento set ? WHERE id_mantenimiento = ?", [
    newObservacion,
    id_mantenimiento,
  ]);
  req.flash("success", "Mantenimiento modificado correctamente en la baliza " + nif);
  res.redirect("/balizas/plantilla/" + nif);
});

//GESTION mapa
router.get("/mapa/:nif", async (req, res) => {
  const { nif } = req.params;
  const baliza = await db.query('SELECT * FROM balizamiento b  LEFT JOIN localizacion lo ON lo.nif=b.nif  LEFT JOIN lampara la ON la.nif=b.nif where b.nif=?', [nif]);
  res.render("mapa", { layout: 'layoutMapa', baliza: baliza[0], });
});

router.get("/mapaGeneral/:valor", (req, res) => {
  const { valor } = req.params;
  console.log("Mapa " + valor);
  switch (valor) {
    case "1":
      res.render("mapaValencia", { layout: 'layoutMapa' });
      break;
    case '2':
      res.render("mapaSagunto", { layout: 'layoutMapa' });
      break;
    case "3":
      res.render("mapaGandia", { layout: 'layoutMapa' });
      break;
  }
});

//GESTION FOTOS
router.get("/fotos/:nif", async (req, res) => {
  const nif = req.params.nif;
  var fotos = helpers.listadoFotos(nif);
  res.render("balizas/fotos", { fotos, nif });
});
router.get("/fotos/:nif/:src/delete", async (req, res) => {
  const nif = req.params.nif;
  const src = req.params.src;
  await unlink(path.resolve('src/public/img/imagenes/' + nif + "/" + src));
  req.flash("success", "Foto de baliza " + nif + " borrada correctamente.");
  res.redirect("/balizas/fotos/" + nif);
});
router.post("/upload/:nif", async (req, res) => {
  console.log("Subiendo foto baliza");
  const { nif } = req.params;
  console.log(req.params);
  console.log(req.body);
  req.flash("success", "Foto de la baliza " + nif + " subida correctamente!");
  res.redirect("/balizas/plantilla/" + nif);
});

module.exports = router;
