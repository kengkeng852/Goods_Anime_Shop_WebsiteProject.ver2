let mysql = require('mysql');
let connection = mysql.createConnection({
    host: "localhost",
    user: "pjweb",
    password: "Pjweb1234",
    database: "webpro"
})

connection.connect((error) => {
    if (!!error) {
        console.log(error);
    } else {
        console.log('Connected...');
    }
})

module.exports = connection;