var express = require('express');
var router = express.Router();
let dbCon = require('../lib/db');
var user_name; //assign user_name to be global variable because it needs to be exported to show after succesfully admin login

/* GET Admin login page */
router.get('/', function(req, res, next) {
  /** render Index.ejs, 
   * Additionally, title = username will be exported to if(session.id) at page http://localhost:3000/ index.ejs after login at page http://localhost:3000/login was correct*/
  res.render('index', { title: user_name, session : req.session });
});

/* Verification or authentication username and password 'http://localhost:3000/login */
router.post('/login', function(req, res, next) {
  
  user_name = req.body.userName; //get value from login with name form at http://localhost:3000/
                                 //from accessed value in form with name of each input

  var user_password = req.body.passWord; //assign and get value from login with name form at http://localhost:3000/

  //if get the value user_name and user_password
  //when admin press any charactor in the input box
  if(user_name && user_password)
  {
      //Assign query
      let query = `
      SELECT * FROM administrator_login_information 
      WHERE username = "${user_name}"
      `;

      //firstly, check with username 
      dbCon.query(query, function(error, data){
          //if the query has any data, not equal to 0
          if(data.length > 0)
          {
            //check password
              for(var count = 0; count < data.length; count++)
              {
                  /*'correct password'
                    check password in database and password that admin has already input
                    they are equal, then password is correct
                  */
                  if(data[count].password == user_password)
                  {
                      req.session.idlog = data[count].idlog;    //session.idlog = idlog(in database) used idlog log because it is primary key, 
                                                                //session = a variable on the backend server side
                                                                //used in if (session.idlog), for showing data
                      res.redirect("/");                        //redirect to http://localhost:3000/ then provide username that has already assign value, and get session.id

                  }else
                  /**Incorrect 
                   * password in database and password that admin has already input not equal */
                  {
                      res.send('Incorrect Password');
                  }
              }
          }else{
            //no data return, it means that username that admin inputs not found in database
              res.send('Incorrect Username');
          }
          res.end(); //end the respond
      });
  }
  else
  {
    //admin did not put any word in the input box
      res.send('Please Enter username and Password');
      res.end();
  }
});


// LOGOUT index.ejs
router.get('/logout', function(req, res, next){
    req.session.destroy();    //Deletes the session in the database.
    res.redirect("/");        //redirect to http://localhost:3000/

});


/* --------USER SEARCH start----- */
//didnot express search file, using this route file is work properly
/* http://localhost:3000/ */
router.get('/search', function(req, res, next) {

    query="SELECT * FROM products";
    dbCon.query(query, (err, results) => {
        if (err) {
          console.log('Error searching products:', err);
          res.status(500).render('search', { data: [] });
        } else {
          res.render('search', { data: results });
        }
      });

  });


/* http://localhost:3000/search/searchedpro */
// handle search form submission
router.post('/search/searchedpro', (req, res) => {
    const searchTerm = req.body.searchTerm.toLowerCase();
    const anime = req.body.anime.toLowerCase();
    const type = req.body.type.toLowerCase();
    const brand = req.body.brand.toLowerCase();
  
    const query = `
      SELECT * FROM products WHERE LOWER(name) LIKE '%${searchTerm}%'
      ${anime ? `AND LOWER(animename) = '${anime}'` : ''}
      ${type ? `AND LOWER(category) = '${type}'` : ''}
      ${brand ? `AND LOWER(brand) = '${brand}'` : ''}
    `;
  
    dbCon.query(query, (err, results) => {
      if (err) {
        console.log('Error searching products:', err);
        res.status(500).render('search', { data: [] });
      } else {
        res.render('search', { data: results });
      }
    });
  });
  
  // serve the product page
  router.get('/searchedpro/:Proid', (req, res) => {
    const productId = req.params.Proid;
  
    const query = `SELECT * FROM products WHERE Proid = '${productId}'`;
  
    dbCon.query(query, (err, results) => {
      if (err) {
        console.log('Error getting product:', err);
        res.status(500).render('error', { message: 'Error getting product information.' });
      } else if (results.length === 0) {
        res.status(404).render('error', { message: 'Product not found.' });
      } else {
        res.render('productpage', { product: results[0] });
      }
    });
  });
/* --------USER SEARCH end----- */

/*PRODUCT BACKEND start*/
// Product admin detail page
//http://localhost:3000/products/:Proid
router.get('/products/:Proid', (req, res) => {
    const productId = req.params.Proid;       //assign an object that contains the properties which are mapped to the named route "parameters to const productId


    const query = `SELECT * FROM products WHERE Proid = '${productId}'`;
  
    dbCon.query(query, (err, results) => {
      
      if (err) {
        //error
        console.log('Error getting product:', err);
        res.status(500).render('error', { message: 'Error getting product information.' });
      } else if (results.length === 0) {
        //no product founded
        res.status(404).render('error', { message: 'Product not found.' });
      } else {
        res.render('p_detail', { product: results[0] });
      }
    });
  });  

// UPDATE PRODUCT
router.post('/products/update/(:Proid)', (req, res, next) => {

    //assign name in the form with variable let
    //from accessed value in form with name of each input
    //update form in http://localhost:3000//products/:Proid
    let id = req.params.Proid;                //current Proid that won't be changed, used for select where Proid=id
    let pid= req.body.pid;                    //for changing or updating product id
    let pname = req.body.pname;
    let pprice = req.body.pprice;
    let quan = req.body.pquantity;
    let cate = req.body.pcate;
    let animenamee = req.body.panimename;
    let brandd = req.body.pbrand;
    let releasedate = req.body.pdate;
    let piclink = req.body.pimagelink;
    let buy_url = req.body.pwebbuy;
    let ori = req.body.porigin;
    let info = req.body.pinfo;

    // query of table `products` = variable that provided above
    // query name: let pid, pname, pprice,...,info
    //name in db = (let)x
    let form_data = {
      Proid:pid,
      name:pname,
      price: pprice,
      quantity: quan,
      category: cate,
      animename: animenamee,
      brand: brandd,
      release_date: releasedate,
      image_url:piclink,
      buyurl:buy_url,
      origin:ori,
      information: info
  }

  //UPDATE product query
  //use id because it is current primarykey of products table
    dbCon.query('UPDATE products SET ? WHERE `Proid` = "' + id + '"', form_data, (err, result) => {
        if (err) {
            console.log(err)
            console.log(result)
            res.redirect('/products');
        } else {
          //successfully updated
            console.log(result)
            req.flash('success', 'Products is Edited');
          //back to current product detail edit, http://localhost:3000/products/:pid
            res.redirect('/products/'+ pid);
        }
    })
    
})

// DELETE Product
//http://localhost:3000/products/delete/(:Proid)
router.post('/products/delete/(:Proid)', (req, res, next) => {
  let id = req.params.Proid;          //assign an object that contains the properties which are mapped to the named route "parameters to const productId


  //DELETE Product
  dbCon.query('DELETE FROM products WHERE `Proid` = "' + id + '"', (err, result) => {
      //error
      if (err) {
          console.log(err)
          console.log(result)
          res.redirect('/products');
      } else {
        //successfully deleted
          req.flash('success', 'Person Deleted ID = ' + id);
          res.redirect('/products');    //redirect to product management page, http://localhost:3000/products
      }
  })
})
/*--------PRODUCT BACKEND end--------*/

//export modules
module.exports = router;
