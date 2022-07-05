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



/*   router.post("/uploadprofile/:user",(req,res)=>{
    const { user } = req.params;
    console.log(req.file);
    res.redirect("/profile");
  }); */

module.exports=router;