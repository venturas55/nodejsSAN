const express= require('express');
const router = express.Router();
var Vue = require('vue');

router.get('/',(req,res)=>{
    res.render('index');
} );

router.get('/calculos',(req,res)=>{
    res.render('calculos',{layout: 'layoutA'});
});
module.exports=router;