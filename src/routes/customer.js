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
//register de tenicos al sistema 
router.get('/registerTecnico', customerController.registrarTecnico)
router.get('/editRegisterTecnicoRedline/:id', customerController.tecnicoEditTable)
router.post('/registerTecnicoSend', customerController.tecnicoEditSendTable)
router.get('/registerNewTecnicoRedline', customerController.TableNewTecnico)
router.post('/registerNewTecnicoRedline', customerController.TableNewTecnicoSend)
router.get('/registerTecnicoDelateRedline/:id', customerController.TableNewTecnicoDelate)
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
router.get('/telecomunicacionesValidarUsuario/:id', customerController.teleTableValidUser)
router.post('/telecomunicacionesValidarUsuarioSend', customerController.teleTableValidUserSend)
router.get('/telecomunicacionesUsersDelate/:id', customerController.teleDeleteUser)
router.get('/telecomunicacionesTableClientsC', customerController.teleTableCC)
router.get('/telecomunicacionesReportDiaMenu', customerController.reporteTeleMenu)
router.get('/telecomunicacionesReportTable', customerController.teleTableVerificDia)
router.get('/telecomunicacionesNuevoReportDia', customerController.teleReportInsertNewReport)
router.post('/telecomunicacionesNuevoReportDiaSend', customerController.teleReportInsertNewReportSend)
router.get('/telecomunicacionesEditReporteDia/:id', customerController.reportTeleTableEdit)
router.post('/telecomunicacionesEditReporteDiaSend', customerController.reportTeleTableEditSend)
router.get('/telecomunicacionesReportDelate/:id', customerController.teleDeleteReport)
router.get ('/telecomunicacionesEstadisticasMenu2', customerController.teleEstadisticasMenu)
router.get('/telecomunicacionesEstadisticasTable1', customerController.teleEstadisticasTable1)
router.get('/telecomunicacionesEstadisticasTable2', customerController.teleEstadisticasTable2)
router.get('/telecomunicacionesEstadisticasTable3', customerController.teleEstadisticasTable3)
router.get('/telecomunicacionesEstadisticasTable4', customerController.teleEstadisticasTable4)
router.get('/telecomunicacionesEstadisticasTable5', customerController.teleEstadisticasTable5)
router.post('/teleEstadisticasReportDiaGraficosSend', customerController.seleccionaFechaEstadisticas1);
//inventarios 
// inventario de herramientas 
router.get('/inventarioHerramientasRedline', customerController.menuInventoryH1)
router.get('/inventarioHerramientasPRedline', customerController.herramientasPrestadasInventario)
router.get('/inventarioHerramientasNPRedline', customerController.herramientasNoPrestadasInventario)
router.post('/buscarQuienMeTiene', customerController.quienMeTieneh1);
//correos electronicos
router.post('/QuienMeTieneMail', customerController.sendCorreoH1)
//codigo de pruebas 
router.get('/pruebas', customerController.pruebas); 
router.post('/imgpruebas', customerController.subirImange)
router.get('/pruebas2', customerController.pruebas2);

// router.post('/profile-upload-single', customerController.subirImagen)
// router.post('/add', customerController.save);
// router.get('/delate/:ID', customerController.delate);
// router.get('/update/:ID', customerController.edit);
// router.post('/update/:ID', customerController.update);
// router.post('/auth', customerController.auth)
// router.get('/listrestring', customerController.list2);

module.exports = router; 