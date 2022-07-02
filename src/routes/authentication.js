const express = require('express');
const { Passport } = require('passport');
const router = express.Router();
const passport=require('passport');

const helpers = require('../lib/helpers');

router.get('/signup',helpers.isNotLoggedIn,(req,res)=>{
    res.render('auth/signup')
});

router.post('/signup', passport.authenticate('local.signup',{
        successRedirect: '/profile',
        failureRedirect: '/signup',
        failureFlash: true
    })
);

router.get('/signin',helpers.isNotLoggedIn,(req,res)=>{
    res.render('auth/signin');
});

router.post('/signin',(req,res,next)=>{
   passport.authenticate('local.signin',{
       successRedirect: '/profile',
       failureRedirect: '/signin',
       failureFlash:true

   })(req,res,next);
});

router.get('/profile',helpers.isLoggedIn ,(req,res)=>{
    res.render('profile');
});

router.get('/logout',helpers.isLoggedIn ,(req,res)=>{
    req.logOut();
    res.redirect('/balizas/list');
})

module.exports = router;