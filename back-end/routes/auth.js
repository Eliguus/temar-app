const authRoutes = require('express').Router()
const {signup,signin,signout,isAdmin,isAuth,requireSignin }= require('../controller/auth')

const { userSignupValidator } = require('../validator')

authRoutes .post('/signup',userSignupValidator,signup)
authRoutes .post('/signin',signin)
authRoutes .get('/signout',signout)

module.exports=authRoutes 