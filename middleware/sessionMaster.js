const jwt = require('jsonwebtoken'); // session master
require('dotenv/config');

// signing token
exports.signingToken = (data)=>{
    var token = jwt.sign(data,process.env.SECRET,{algorithm:'HS256'});
    return token;
};

exports.verifyToken = (req,res,next)=>{
    var token = req.headers['token'];
    jwt.verify(token,process.env.SECRET,(err,plain)=>{
        if(!err){
            req.user = plain;
            console.log(req.user);
            next();
        }else{
            res.status(401).json({aset:"Token issue",err:err['message']})
            console.log(`Error due to: ${err}`);
        }
    });
};