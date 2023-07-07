var express = require("express")
var userRoutes = express.Router();
var session = require("../../middleware/sessionMaster")

 // it server all request to user authentication and reistration
var userAuthController = require("../../controller/user/auth");
// import {optimizationAPI} from "../../controller/user/optimization"
var optiController = require("../../controller/user/optimization");

// registration route handler
userRoutes.post("/registration_data",userAuthController.userRegistration); 

// login route
userRoutes.post("/login_credential",userAuthController.userLogin)

// optimazation api
userRoutes.get("/optimization",session.verifyToken,optiController.optimizationAPI)


// export module
module.exports = userRoutes;


