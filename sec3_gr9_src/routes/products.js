
var express = require('express');
var router = express.Router();
let dbCon = require('../lib/db');

/* GET product managementpage, views/product.ejs  page. */
router.get('/', function(req, res, next) {
  let query="SELECT * FROM products";
    dbCon.query(query, (err, results) => {
        //if error, http://localhost:3000/products page
        if (err) {
          console.log('Error searching products:', err);
          res.status(500).render('products', { data: [] });   //no render data at page products
        } else {
          res.render('products', { data: results });
        }
      });
});

//SEARCH Product
router.post('/search', (req, res) => {
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
      res.status(500).render('products', { data: [] });
    } else {
      res.render('products', { data: results });
    }
  });
});


//INSERT PRODUCT
router.post('/add', (req, res, next) => {
  //assign name in the form with variable let
  //from accessed value in form with name of each input
  //insert form in http://localhost:3000//products
  //let x = name in form product.ejs
  let id = req.body.pid;
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
  
  //name in db = (let)x
  // if no error
    // query of table `products` = variable that provided above
    // query name: let id, pname, pprice, quan, ...
  let form_data = {
    Proid:id,
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

//INSERT QUERY
dbCon.query('INSERT INTO products SET ?', form_data, (err, result) => {
  if (err) {
      console.log(err)                //show error
      // console.log(result)
      res.redirect('/products');      //redirect to http://localhost:300/products
  } else {
      //INSERT successfully
      req.flash('success', 'products is Added');  //Unopinionated middleware for creating flash messages of all types for Express apps.
      res.redirect('/products');                  //redirect to http://localhost:300/products
  }
})
  
})


//export modules
module.exports = router;