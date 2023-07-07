var express = require("express");
var mainRoute = express.Router();


// user routes
var userRoutes = require("./user/user.routes");

// project routes
var project_Route = require("./project/project.routes")

// plastic route
var plastic_routes = require("./plastic/plastic.routes")

// blog route
var blog_routes = require("./blog/blog.routes");

// Directs all routes relate to users.
mainRoute.use("/user/", userRoutes);

// Directs all routes relate to project requests
mainRoute.use("/project/",project_Route)

// Directs all routes relate to plastic requests
mainRoute.use("/plastic/",plastic_routes)

// direct all routes related to blog
mainRoute.use("/blog/",blog_routes);

// export module
module.exports = mainRoute;