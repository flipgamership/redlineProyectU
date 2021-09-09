const express = require('express');
const router = express.Router();

const customerController=require('../controllers/customerController')
//login
router.get('/login', customerController.login);
router.post('/loginAuth', customerController.loginAuth);
router.get('/loginAut', customerController.logAut)
//inicial 
router.get('/', customerController.inicialPage);
router.get('/contact', customerController.inicialPageContact);
//register
router.get('/register', customerController.register)
router.get('/usuario', customerController.registerUsers)
router.post('/sendRegister' , customerController.sendRegister)
router.get('/registerUsersEdit/:id', customerController.registerUEdit)
router.get('/registerUsersDelate/:id', customerController.deleteUser)
router.post('/sendUpdateUser', customerController.sendUpdateUser)
//update passwore
router.get('/password/:id', customerController.passwordNew)
router.post('/sendPassword', customerController.savePasssword)
//principal menu
router.get('/home', customerController.home)
router.get('/welcome', customerController.welcome)
//telecomunicaciones
router.get('/telecomunicaciones', customerController.tele)
router.get('/telecomunicacionesTableClientsP', customerController.teleTableCP)
router.post('/newUserClientTeleSend', customerController.teleTableNewClientSendCP)
router.get('/newUserClientTele', customerController.teleTableNewClientCP)
router.get('/editTeletrabajoClient/:id', customerController.teleTableEdit)
router.post('/editTeletrabajoClientSend', customerController.teleTableEditSend)
//codigo reutilizable
// router.get('/agregar', customerController.agregar);
// router.post('/add', customerController.save);
// router.get('/delate/:ID', customerController.delate);
// router.get('/update/:ID', customerController.edit);
// router.post('/update/:ID', customerController.update);
// router.post('/auth', customerController.auth)
// router.get('/listrestring', customerController.list2);

module.exports = router; 