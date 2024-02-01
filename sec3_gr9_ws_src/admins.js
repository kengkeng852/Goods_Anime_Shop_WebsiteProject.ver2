let express = require('express');
let router = express.Router();
let dbCon = require('../lib/db');
// const ejsLint = require('ejs-lint');


// display admin management page
router.get('/', (req, res, next) => {
    dbCon.query('SELECT * FROM administrator_information ORDER BY id asc', (err, rows) => {
        //if error, sent to page admins
        if (err) {
            console.log(err)                    //display error
            // console.log(result)
            res.render('admins', { data: '' }); //no render data
        } else {
            res.render('admins', { data: rows }); //render page admins.ejs in follder view with rows = query
                                                  // ex. data=rows
        }
    })
})

// admin management search
router.post('/s', (req, res, next) => {
    // search in views/admins/index.ejs
    let id = req.body.id;               //id = name(id) in search admin form
    let first = req.body.first_name;    //first = name(firstname) in search admin form
    let role = req.body.role;           //role = name(role) in search admin form

    let sql=""; //initial variable sql to collect query

    //search admin check value in the input box that admin type
    if(id=='' && first=='' && role==''){
        //no criteria return all admins
        sql = "SELECT * FROM administrator_information";
    }else if(id=='' && first==''){
        //without input id and first, then search with role
        sql = "SELECT * FROM administrator_information WHERE role LIKE +'%"+role+"%'";
    }else if(first=='' && role==''){
        //without input first and first, then search with id
        sql = "SELECT * FROM administrator_information WHERE id = "+id;
    }else if(id=='' && role==''){
        //without input id and role, then search with first
        sql = "SELECT * FROM administrator_information WHERE first_name LIKE '%"+first+"%'";
    }else if(id==''){
        //without input id, then search with first or role
        sql = "SELECT * FROM administrator_information WHERE '%"+first+"%' OR role LIKE +'%"+role+"%'";
    }else if(first==''){
        //without input first, then search with id or role
        sql = "SELECT * FROM administrator_information WHERE id = "+id+"%' OR role LIKE +'%"+role+"%'";
    }else if(role==''){
         //without input role, then search with id or first
        sql = "SELECT * FROM administrator_information WHERE id = "+id+" OR first_name LIKE '%"+first+"%'";
    }else {
         //with all search input
        sql = "SELECT * FROM administrator_information WHERE id = "+id+" OR first_name LIKE '%"+first+"%' OR role LIKE +'%"+role+"%'";
    }


    //query
    dbCon.query(sql, (err, rows) => {
        if (err) {
            console.log(err)
            console.log(result)
            res.render('admins', { data: rows });
        } else {
            //if no error, return admins data with rows
            //data is parameter that will provide in ejs file
            res.render('admins', { data: rows });
        }
    })
})

// INSERT admin
router.post('/add', (req, res, next) => {
    // form in views/admins/index.ejs
    let id = req.body.id;           //id = name(id) in insert admin form
    let Fname = req.body.Fname;     //Fname = name(Fname) in insert admin form
    let Lname = req.body.Lname;     //Lname = name(Lname) in insert admin form
    let Role = req.body.Role;       //Role = name(Role) in insert admin form
    let mail = req.body.email;      //mail = name(Email) in insert admin form
    
    // if no error
    // query of table `administrator_information` = variable that provided above
    // query name: let id, Fname, Lname, Role, mail
    let form_data = {
        id:id,
        first_name: Fname,
        last_name: Lname,
        role: Role,
        email: mail
    }

    // insert query
    dbCon.query('INSERT INTO administrator_information SET ?', form_data, (err, result) => {
        if (err) {
            console.log(err)            //show error
            // console.log(result)
            res.redirect('/admins');    //redirect to http://localhost:300/admins
        } else {
            req.flash('success', 'Admin is Added');     //Unopinionated middleware for creating flash messages of all types for Express apps.
            res.redirect('/admins');                    //redirect to http://localhost:300/admins
        }
    })
})

// UPDATE admin
router.post('/update/(:id)', (req, res, next) => {
    /**from in views/admins/edit_popup.js */
    let id = req.params.id;             //id = name(id) in insert admin form        
    let Fname = req.body.Fname;         //Fname = name(Fname) in insert admin form
    let Lname = req.body.Lname;         //Lname = name(Lname) in insert admin form
    let role = req.body.role;           //Role = name(Role) in insert admin form
    let mail = req.body.email;          //mail = name(Email) in insert admin form

    // if no error
    // query of table `administrator_information` = variable that provided above
    let form_data = {
        first_name: Fname,
        last_name: Lname,
        role: role,
        email: mail
    }

    // UPDATE QUERY
    dbCon.query("UPDATE administrator_information SET ? WHERE id = " + id, form_data, (err, result) => {
        if (err) {
            console.log(err)                        //show error
            // console.log(result)
            res.redirect('/admins');                //redirect to http://localhost:300/admins
        } else {
            req.flash('success', 'Admin is Edited');        //Unopinionated middleware for creating flash messages of all types for Express apps.
            res.redirect('/admins');                        //redirect to http://localhost:300/admins
        }
    })
    
})

// DELETE admin
router.get('/delete/(:id)', (req, res, next) => {
    //let id =id of admin row
    let id = req.params.id;

    //DELETE QUERY
    dbCon.query('DELETE FROM administrator_information WHERE id = ' + id, (err, result) => {
        if (err) {
            console.log(err)                    //show error
            // console.log(result)
            res.redirect('/admins');            //redirect to http://localhost:300/admins
        } else {
            req.flash('success', 'Person Deleted from the world!!! ID = ' + id);    //Unopinionated middleware for creating flash messages of all types for Express apps
            res.redirect('/admins');                                                //redirect to http://localhost:300/admins
        }
    })
})

//export modules
module.exports = router;