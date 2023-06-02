// const check = require('express-validator')
exports.userSignupValidator = (req,res,next) =>{
    req.check("name","Name is required").notEmpty()
    req.check('email').isLength({
        min:4,
        max:40
    }).withMessage('Email has length 3 to 40')
    req.check('password').isLength({
        min:8,
        max:40
    }).withMessage('password has length greater than 10')

    const errors = req.validationErrors()

    if (errors){
        const FirstError = errors.map((error)=>error.msg)[0]
        return res.status(400).json({error:FirstError})
    }
    next()
}