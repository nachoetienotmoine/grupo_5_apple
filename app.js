const express = require('express');
const app = express();
const path = require('path');
const session = require('express-session');
const cookies = require('cookie-parser');

const routersRegister = require('./routers/registerApi');
const routersDetalle = require('./routers/detalleApi');
const routersCarrito = require('./routers/carritoApi');
const routersHome = require('./routers/homeApi');
const routersLogin = require('./routers/loginApi');
const routersProdList = require('./routers/prodListApi');
const routersUsers = require('./routers/users');
const routersProductos = require('./routers/productos');
const routersAdmin = require('./routers/admin');
const routersLogout = require('./routers/logoutApi');
const bcrypt =  require ( 'bcryptjs');


const guestMiddleware = require('./middlewares/guestMiddleware');
const authMiddleware = require('./middlewares/authMiddleware');
const userLoggedMiddleware = require('./middlewares/userLoggedMiddleware');


const methodOverride = require('method-override');
const publicPath = path.resolve(__dirname, './public');


app.use(express.static(publicPath));
app.set("view engine", "ejs");
app.set('views', __dirname + '/views-ejs');
app.use(express.urlencoded({extended:false}));
app.use(express.json());
app.use(methodOverride('_method'));
app.use(session({
    secret: "Shhh, It's a secret",
    resave: false,
    saveUninitialized: false,
}));

app.use(cookies());
app.use(userLoggedMiddleware);
 

app.use('/registro', guestMiddleware, routersRegister);
app.use('/detalle', routersDetalle);
app.use('/carrito', routersCarrito);
app.use('/', routersHome);
app.use('/logout', routersLogout);
app.use('/login', guestMiddleware, routersLogin);
app.use('/prodList', routersProdList);
app.use('/productos', routersProductos);
app.use('/productos/:id?',authMiddleware, routersProductos);
app.use('/users', routersUsers);
app.use('/admin',authMiddleware, routersAdmin);
app.listen(process.env.PORT || 3000, function() {
    console.log("Servidor corriendo en el puerto 3000");
});






