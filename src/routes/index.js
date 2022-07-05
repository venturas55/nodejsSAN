const express= require('express');
const router = express.Router();

router.get('/',(req,res)=>{
    res.render('index');
} );

router.get('/calculos',(req,res)=>{
    res.render('calculos',{layout: 'layoutCalculos'});
});
router.get('/plan',(req,res)=>{
    res.render('plan',{layout: 'layoutSimple'});
});

module.exports=router;