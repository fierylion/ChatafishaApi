var db = require("../../config/db")
const bcpt = require("bcrypt");
var session = require("../../middleware/sessionMaster")
require("dotenv/config")


// Main method for user registration.
exports.userRegistration = (req, res) => {

    /**
     * 
     * role {
     * "admin":1
     * "picker":2
     * "student":3
     * }
     */

    bcpt.hash(req.body.password, 15).then(hashed => {
        var user_info = [req.body.u_name, req.body.reg_no, req.body.location, req.body.email, req.body.phone, req.body.role == "admin" ? 1 : req.body.role == "student" ? 3 : 2, hashed, req.body.uniID, req.body.collegeID, req.body.department]

        db.query("INSERT INTO user(name,registration_no,location,email,phone_no,role,password,universityID,collegeID,department) VALUES(?,?,?,?,?,?,?,?,?,?)", user_info, (err) => {

            if (!err) {

                res.status(200).json({ aset: "successfully registered" })

            } else {

                res.status(401).json({ aset: "Failed to register", err: err["message"] })
                console.log(`Failed to register due to: ${err}`)
            }
        });
    });


};



// Authenticate user
exports.userLogin = (req, res) => {

    db.query("SELECT userID,name,location,registration_no,role,password FROM user where email=?", req.body.email, (err, feedback) => {

        if (!err && feedback.length > 0) {

            bcpt.compare(req.body.password, feedback[0].password).then(validit => {
                if (validit == true) {
                    user_data = { 'uid': feedback[0].userID, 'name': feedback[0].name, 'location': feedback[0].location, 'reg_no': feedback[0].registration_no, "role_id": feedback[0].role }
                    var token = session.signingToken(user_data)

                    // check user role
                    feedback[0].role == 1 ?
                        user_data["role_id"] = "Admin" : feedback[0].role == 2 ? user_data["role_id"] = "Picker" : feedback[0].role == 3 ? user_data["role_id"] = "Student" : user_data["role_id"] = "Unknown"

                    res.status(200).json({ aset: "Successfully Login", user_data, "token": token, })
                } else {
                    res.status(401).json({ aset: "Wrong email or password" })
                }
            });


        } else if (!err && feedback.length < 1) {

            res.status(402).json({ aset: "Failed to Login due to wrong credentials" })

        } else {

            res.status(501).json({ aset: "Server issue!" })
            console.log(`Hello ASET there's server issue due to: ${err}`);
        }
    });
};

module.exports;