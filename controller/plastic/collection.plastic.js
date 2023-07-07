var db = require("../../config/db")

// register collected plastic
exports.registPlastic = (req,res)=>{
    if(req.user){
        plastic_data  = [req.body.uid, req.user["uid"],req.body.plastic_type, req.body.quantity]
        db.query("INSERT INTO plastic_collection(userID,centerID,type,qnty) VALUES(?,?,?,?)",plastic_data,(err)=>{
            if(!err){
                res.status(200).json({aset:"Successfully registered", data:plastic_data});
                console.log(`${req.user['name']} has registered plastic data ot user ${plastic_data[0]}`)
            }else{
                res.status(200).json({aset:"Failed to register plastic data"});
                console.log(`hi ASET, issue is: ${err}`)
            }
        });
    }else{
        res.status(501).json({aset:"Sorry!!, You're not verified"});
        console.log("mmh")
    }
};


// display collected data
exports.displayData = (req,res)=>{
    if(req.user){
        db.query("SELECT type,qnty,name FROM plastic_collection,user WHERE plastic_collection.centerID = user.userID",(err,feedback)=>{
            if(!err && feedback.length > 0){
                var plastic_data = []
                for(i=0; i < feedback.length; i++){
                    plastic_data.push({"type":feedback[i].type,"quantity":feedback[i].qnty,"center":feedback[i].name})
                }
                res.status(200).json({aset:"success!!", data:plastic_data})
            }else{
                res.status(401).json({aset:"failed!!"});
                console.log(`Hi, ASET issue is: ${err}`)
            }
        });
    }else{
        res.status(501).json({aset:"Sorry!! you're not verified"});
    }
};


// export module
module.exports;