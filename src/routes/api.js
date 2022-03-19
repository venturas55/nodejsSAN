const express = require('express');
const { Passport } = require('passport');
const router = express.Router();

const passport=require('passport');
const helpers = require('../lib/helpers');

const pool = require("../database");

router.get('/api/prueba',async (req,res)=>{

      const balizamiento = {
        nif: '25840',
        num_internacional: "",
        tipo: "boya",
        telecontrol: 'no',
        apariencia: '',
        periodo,
        caracteristica,
      };
    console.log(json); 

    res.redirect(json);
});


router.get('/api/baliza/:nif',async (req,res)=>{
    const { json } = req.params;
    console.log(json); 
    //console.log(json.nif);
    //console.log(json.peso);
    //const baliza = await pool.query('SELECT * FROM balizamiento b  LEFT JOIN localizacion lo ON lo.nif=b.nif  LEFT JOIN lampara la ON la.nif=b.nif where b.nif=?',[nif]);
    //const observaciones = await pool.query('SELECT * FROM observaciones where nif=?',[nif]);
    //const mantenimiento = await pool.query('SELECT * FROM mantenimiento where nif=? order by fecha DESC',[nif]);
    res.send(json);
});


module.exports = router;