const express= require('express');
const router = express.Router();
var Vue = require('vue');

router.get('/',(req,res)=>{
    res.render('index');
} );

router.get('/calculos',(req,res)=>{
    res.render('calculos',{layout: 'layoutCalculos'});
});
router.get('/plan',(req,res)=>{
    res.render('plan',{layout: 'layoutSimple'});
});

router.post("/upload/:nif",(req,res)=>{
    const { nif } = req.params;
    console.log(req.file);
    res.redirect("/balizas/plantilla/"+nif);
  });

module.exports=router;