const express = require("express");
const router = express.Router();
const { unlink } = require('fs-extra');
const path = require('path');
const helpers = require("../lib/helpers");
const db = require("../database"); //db hace referencia a la BBDD
const multer = require('multer');
const fs = require('fs');
const { v4: uuidv4 } = require('uuid');

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    const dir = path.join(__dirname, '../public/informes');
    fs.exists(dir, exist => {
      if (!exist) {
        return fs.mkdir(dir, error => cb(error, dir));
      }
      return cb(null, dir);
    })
  },
  filename: (req, file, cb) => {
    cb(null, (uuidv4() + path.extname(file.originalname)).toLowerCase());
  }
});
const uploadDocument = multer({
  storage,
  limits: { fileSize: 10000000, },
}).single('documento');

//CRUD read
router.get("/preventivos", async (req, res) => {
  const docus = await db.query("select * from documentos")
  console.log(docus);
  res.render("documentos/preventivos", { docus });
});
router.get("/preventivoUpload", (req, res) => {
  res.render("documentos/preventivoUpload");
});
router.post("/preventivos", uploadDocument, async (req, res) => {
  console.log(req.body);
  console.log(req.file);
  const { nombre, descripcion } = req.body;
  const archivo = req.file.filename;
  const newDoc={'id_archivo':archivo,nombre,descripcion,}
  await db.query("insert into documentos set ?",[newDoc])
  req.flash("success", "Documento subido correctamente");
  res.redirect("/preventivos");
});
router.get("/preventivoDelete/:id", async (req, res) => {
  const id_archivo = req.params.id;
  const filePath = path.resolve('src/public/informes/' + id_archivo);
  await unlink(filePath);
  await db.query("delete from documentos where id_archivo = ?",[id_archivo]);
  req.flash("success", "Documento borrado correctamente");
  res.render("documentos/preventivos");
});
router.get("/preventivoEdit/:id", async (req, res) => {
  const id_archivo = req.params.id;
  //console.log(">"+id_archivo);
  const doc= await db.query("select * from documentos where id_archivo=?",[id_archivo]);
  res.render("documentos/preventivoEdit",{documento: doc[0]});
});
router.post("/preventivoEdit/:id", async (req, res) => {
  //console.log(req.body);
  const id_archivo = req.params.id;
  const nombre = req.body.nombre;
  const descripcion= req.body.descripcion;
  const newDoc={id_archivo,nombre,descripcion};
  console.log(">"+id_archivo);
  console.log(">>"+nombre);
  console.log(">>>"+descripcion);
  await db.query("update documentos set ? where id_archivo=?",[newDoc,id_archivo]);
  req.flash("success", "Documento editado correctamente");
  res.redirect("/preventivos");
});

router.get("/prueba", (req, res) => {
  req.flash("success", "Prueba ejecutada correctamente");
  res.render("documentos/prueba");
});
router.post("/pruebaPost", async (req, res) => {
  var password=req.masterPass;
  userpass = req.body.pass;
  console.log("==>"+req.masterPass);
  const validPassword = await helpers.verifyPassword(userpass,password);
  if (validPassword){
    req.flash("success", "Prueba ejecutada correctamente");
    res.redirect("/balizas/list");
  }
  else{
    req.flash("warning", "Sucedió algun error!");
    res.redirect("/error");
  }

});

module.exports = router;