// call secret server
require('dotenv/config');

exports.DB = {
    USER:process.env.DB_USER,
    PASS:process.env.PASSWORD,
    DBNAME:process.env.DB_NAME,
    HOST:process.env.DB_HOST,
    PORT:process.env.DB_PORT
}

module.exports;
