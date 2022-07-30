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
  var docs = helpers.listadoDocumentos();
  const docus = db.query("select * from documentos")
  res.render("documentos/preventivos", { docs });
});
router.get("/preventivoUpload", (req, res) => {
  res.render("documentos/preventivoUpload");
});
router.post("/preventivos", uploadDocument, async (req, res) => {
  console.log(req.body);
  console.log(file);
  const { nombre, descripcion } = req.body;
  const archivo = file.filename;
  //await db.query("insert into documentos set ?",[newDoc])

  res.redirect("/preventivos");
});

router.get("/prueba", (req, res) => {
  res.render("documentos/prueba");
});
router.post("/pruebaPost", async (req, res) => {
  var password=req.masterPass;
  userpass = req.body.pass;
  console.log("==>"+req.masterPass);
  const validPassword = await helpers.verifyPassword(userpass,password);
  if (validPassword)
    res.redirect("/balizas/list");
  else
    res.redirect("/error");

});

module.exports = router;