const express = require('express');
const path= require('path')
const morgan= require('morgan')
const mysql= require("mysql")
const myconnection= require('express-myconnection')
const session = require('express-session')
const app= express()
const bcrypt = require('bcrypt');

app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true
}))


// settings
app.set("port", process.env.PORT || 4000)
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, 'views'))

//middlewares
app.use(morgan('dev'));
app.use(myconnection(mysql,{
    host: 'localhost',
    user: 'root',
    password: '',
    port: 3306,
    database: 'proyectredline'

}))
app.use(express.urlencoded({extended:false}));

//import routes
const customerRoutes = require('./routes/customer');



//routes
app.use('/', customerRoutes);
//static files

app.use(express.static(path.join(__dirname, '/public')));

//START
app.listen(app.get('port'), ()=>{
    console.log("server on port 4000")
});
