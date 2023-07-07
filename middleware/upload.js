// call mr multer the one who accept multiple file type
const multer = require("multer");

// Storage Issue
const multerStorage = multer.diskStorage({
    destination:(req,file,cb)=>{
        cb(null,"assets/images/")
    },
    filename:(req,file,cb)=>{
        cb(null,Date.now()+"~aset~"+file.originalname)
    },
});

exports.upload = multer({storage:multerStorage}); // limits:{fileSize:200}

module.exports;