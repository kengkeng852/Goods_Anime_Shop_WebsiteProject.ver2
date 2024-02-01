var createError = require('http-errors');         //generating error for node.js
var express = require('express');                 //Requires the Express module just 
                                                  //as you require other modules and and puts it in a variable
var path = require('path');
var cookieParser = require('cookie-parser');      //parses cookies attached to the client request object.
var logger = require('morgan');

let flash = require('express-flash');               //flash message
let session = require('express-session');           //returns a function referenc
let mysql = require('mysql');                       //require database mysql
let connection = require('./lib/db');               //create connection

/**import router */
var indexRouter = require('./routes/index');          //index router
var productsRouter = require('./routes/products');    //products router
var adminsRouter = require('./routes/admins');        //admins router

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));                                 //set provides logging functionality for an application
app.use(express.json());                                //set json

// parse application/x-www-form-urlencoded, basically can only parse incoming Request Object if strings or arrays
app.use(express.urlencoded({ extended: false }));       
app.use(cookieParser());              //set cookie parser
app.use(express.static(path.join(__dirname, 'public')));      //set static file
app.use(flash());                       //set, use flash

//use session, 
app.use(session({
  cookie: { maxAge: 60000 },            //set cookie
  store: new session.MemoryStore,       //store
  saveUninitialized: true,              //save
  resave: 'true',                       //resave
  secret: 'secret'                      //secret
}))

//recall and use router
app.use('/', indexRouter);
app.use('/products', productsRouter);
app.use('/admins', adminsRouter);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

//export modules
module.exports = app;
