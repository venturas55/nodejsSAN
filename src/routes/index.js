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
    const { user } = req.body;
    console.log("Ruta: "+nif + " "+ user);
    if (typeof user === 'undefined') {
        res.redirect("/balizas/plantilla/"+nif);
    }else{
        res.redirect("/profile");
    }
 
  });

/*   router.post("/uploadprofile/:user",(req,res)=>{
    const { user } = req.params;
    console.log(req.file);
    res.redirect("/profile");
  }); */

module.exports=router;