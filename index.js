const express = require("express")
const cors = require("cors")
var app = express();


app.use(cors())
const bp = require('body-parser');

require("dotenv/config")

var db = require("./config/db")
db

app.use(bp.json())
app.use(bp.urlencoded({extended:true}))

app.use('/api/',require("./routes/routes"));

// file management
app.use('/assets', express.static('assets'))





// start server
app.listen(process.env.PORT,()=>{console.log(`app listen on port: ${process.env.PORT}`)})