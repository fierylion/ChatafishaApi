// import db
var db = require("../../config/db");

exports.optimizationAPI = (req,res)=>{
    if(req.user["role_id"] == 1){
        db.query("SELECT count(user.name) as users,role FROM user GROUP BY user.role",(err,result)=>{
            if(!err ){
                optimization_data = []
                roleX = "";
                for(i=0; i<result.length; i++){
                    if(result[i].role == 1){
                        roleX = "Admin"
                    }else if(result[i].role == 2){
                        roleX = "Picker"
                    }else if(result[i].role == 3){
                        roleX = "Student"
                    }else {
                        roleX = "Unknown";
                    }
                    optimization_data.push({'role': roleX, "amount":result[i].users})
                }
                
                res.status(200).json({aset:"Successfull",optimization_data});
            }else if (result.length <= 0){
                res.status(404).json({aset:"No data"});
            }else{
                res.status(500).json({aset:"Unknown Error"});
                console.log(`Oprimization API: ${err}`)
            }
        });
    }else{
        res.status(401).json({aset:"You're not authenticated"});
    }
};

module.exports;