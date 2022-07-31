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
    const { nif } = req.params;
    console.log(nif); 
    //console.log(json.nif);
    //console.log(json.peso);
    const baliza = await pool.query('SELECT * FROM balizamiento where nif=?',[nif]);
    //const observaciones = await pool.query('SELECT * FROM observaciones where nif=?',[nif]);
    //const mantenimiento = await pool.query('SELECT * FROM mantenimiento where nif=? order by fecha DESC',[nif]);
    res.send(baliza);
});

module.exports = router;