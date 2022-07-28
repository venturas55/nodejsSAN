const express = require("express");
const router = express.Router();
const { unlink } = require('fs-extra');
const path = require('path');
const helpers = require("../lib/helpers");
const db = require("../database"); //db hace referencia a la BBDD
const multer = require('multer');
const fs = require('fs');


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
    cb(null, new Date().getTime() + path.extname(file.originalname).toLowerCase());
  }
});
const uploadDocument = multer({
  storage,
  limits: { fileSize: 10000000, },
/*   fileFilter: (req, file, cb) => {
    const filetypes = /jpeg|jpg|png|bmp|gif/;
    const mimetype = filetypes.test(file.mimetype);
    const extname = filetypes.test(path.extname(file.originalname));
    if (mimetype && extname) {
      return cb(null, true);
    }

    return cb(("Error: Archivo debe ser una imagen valida jpeg,jpg,png,bmp o gif"));
  } */
}).single('documento');


//CRUD read
router.get("/preventivos", async (req, res) => {
  var docs = helpers.listadoDocumentos();
  res.render("documentos/preventivos", { docs });
});

router.post("/preventivos", uploadDocument,async (req, res) => {
/*   var docs = helpers.listadoDocumentos();
  res.render("documentos/preventivos", { docs }); */
  res.redirect("/preventivos");
});






module.exports = router;