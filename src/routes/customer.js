const { Router } = require('express');
const express = require ('express');
const router = express.Router();
const multer  = require('multer');
const path = require('path');
const uuid = require('uuid');
const storage = multer.diskStorage({
    destination: path.join(__dirname, '../public/uploads/'),
    filename:(req, file, cb)=>{
        cb(null, uuid.v4() + path.extname(file.originalname));
    }
})
const upload = multer({ storage, dest: path.join(__dirname, '../public/uploads/') }).single('imagen')
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
//img y inventario de herramientas
router.get('/devolverInventarioHerramientasRedline/:id', customerController.devolverInventarioHerramientas)
router.post('/devolverInventarioHerramientasSendRedline', customerController.devolverInventarioHerramientasSend)
router.get('/sacarInventarioHerramientasRedline/:id', customerController.sacarInventarioHerramientas)
router.post('/sacarInventarioHerramientasSendRedline', customerController.sacarInventarioHerramientasSend)
router.post('/newHerramientaInventarioSendRedline', upload, customerController.agregarNewHerramientaInventarioSend)
router.get('/newHerramientaInventarioRedline', customerController.agregarNewHerramientaInventario)
router.get('/editarHerramientaInventarioRedline/:id', customerController.editarHerramientaInventario); 
router.get('/imgInventarioHerramienta/:id',customerController.editarImagenHerramienta);
router.post('/imgInventarioHerramientaSend', upload ,customerController.editarImagenHerramientaSend);
router.post('/editarHerramientaInventarioSendRedline', customerController.editarHerramientaInventarioSend);
router.get('/delateHerramientaInventarioRedline/:id', customerController.delateHerramientaInvetario);
router.get('/inventarioHerramientasRedline', customerController.menuInventoryH1)
router.get('/inventarioHerramientasPRedline', customerController.herramientasPrestadasInventario)
router.get('/inventarioHerramientasNPRedline', customerController.herramientasNoPrestadasInventario)
router.post('/buscarQuienMeTiene', customerController.quienMeTieneh1);
// inventario de consumibles 
router.get('/inventarioConsumiblesRedline', customerController.InventarioCTable1)
router.get('/inventarioConsumiblesnewConsumibleRedline', customerController.newInventoriC)
router.post('/inventarioConsumiblesnewConsumiblesSendRedline', customerController.newInventoriCSend)
router.get('/inventarioConsumiblesnewConsumiblesEditRedline/:id', customerController.editInventarioC1)
router.post('/inventarioConsumiblesnewConsumiblesEditSendRedline', customerController.editInventarioC1Send)
router.get('/inventarioConsumibleDelateRedline/:id', customerController.delateConsumibleInvetario)
router.get('/informacionConsumiblesRedline/:id', customerController.informacionProductoInventarioC)
router.get('/inventarioConsumiblesIngresoConsumiblesRedline/:id', customerController.ingresarInventarioConsumibles)
router.post('/inventarioConsumiblesIngresoConsumiblesSendRedline', customerController.ingresarInventarioConsumiblesSend)
router.get('/inventarioConsumiblesSalidaConsumiblesRedline/:id', customerController.sacarInventarioConsumiblesRedline)
router.post('/inventarioConsumiblesSalidaConsumiblesSendRedline', customerController.sacarInventarioConsumiblesSendRedline)
//correos electronicos
router.post('/QuienMeTieneMail', customerController.sendCorreoH1)
router.post('/QuienMeTieneMailEQ', customerController.sendCorreEQ1)
//inventario de equipo de seguridad
router.get('/menuInventarioEquipoSeduridadRedline', customerController.menuInventoryEQ1)
router.get('/inventoriTableEquipoSeguridadNoPrestadoRedline', customerController.equipoNoPrestadosInventario)
router.get('/inventoriTableEquipoSeguridadPrestadoRedline', customerController.equipoPrestadasInventario)
router.get('/newEquipoDeSeguridadInventarioRedline', customerController.agregarNewEquipoSeguridadNewEInventario)
router.post('/newEquipoDeSeguridadInventarioRedlineSend', upload, customerController.agregarNewEquipoSeguridadInventarioSend)
router.get('/inventarioEquipoDeSeguridadDelateRedline/:id', customerController.delateConsumibleInvetario)
router.get('/EditarInventarioEquipoDeSeguridadRedline/:id', customerController.editarEquipoSeguridadInventario)
router.post('/EditarInventarioEquipoDeSeguridadSendRedline', customerController.editarEquipoSeguridadInventarioSend)
router.get('/editarImagenEquipoDeSeguridadReline/:id', customerController.editarImagenEquipoSeguridad)
router.post('/editarImagenEquipoDeSeguridadSendReline', upload, customerController.editarImagenEquipoSeguridadSend)
router.get('/delateInvetarioEquipoDeSeguridadRedline/:id', customerController.delateEquipoSeguridadInvetario)
router.get('/sacarInventarioEquipoDeSeguridadRedline/:id', customerController.sacarInventarioEquipoSeguridad)
router.post('/sacarInventarioEquipoDeSeguridadSendRedline', customerController.sacarInventarioEquipoSeguridadSend)
router.get('/inventarioEquipoDeSeguridadDevolverRedline/:id', customerController.devolverInventarioEquipoSeguridad)
router.post('/inventarioEquipoDeSeguridadDevolverSendRedline', customerController.devolverInventarioEquipoSeguridadSend)
router.post('/buscarQuienMeTieneEQ', customerController.quienMeTieneEQ1);
// inventario de dispositivos
router.get('/menuDeInventarioDeDispositivos', customerController.menuInventarioDeDispositivos)
router.get('/inventarioDeDispositivosTablaSinFiltros', customerController.inventarioDispositivosSinFiltros)
router.get('/inventarioDispositivosFiltroDeRouters', customerController.inventarioDispositivosFiltro1)
router.get('/inventarioDispositivosFiltroDeOnts', customerController.inventarioDispositivosFiltro2)
router.get('/inventarioDispositivosFiltroDeAntenas', customerController.inventarioDispositivosFiltro3)
router.get('/inventarioDispositivosFiltroDeRouterboards', customerController.inventarioDispositivosFiltro4)
router.get('/inventarioDispositivosFiltroDeSwitch', customerController.inventarioDispositivosFiltro5)
router.get('/newInventarioDispositivosRedline', customerController.newInventarioDispositivos)
router.post('/newInventarioDispositivosRedlineSend', customerController.newInventarioDispositivosSend)
router.get('/inventarioDispositivosEditarRedline/:id', customerController.editInventarioDispositivos)
router.post('/inventarioDispositivosEditarsendRedline', customerController.editInventarioDispositivosSend)
router.get ('/delateInventarioDispositivosRedline/:id', customerController.delateDispositivosInventario)
router.get('/SacarInventarioDispositivosRedline/:id', customerController.sacarInventarioDispositivos)
router.post('/SacarInventarioDispositivosSendRedline', customerController.sacarInventarioDispositivosSend)
router.get ('/inventarioDispositivosVendidosRedline', customerController.inventarioDispositivosVendidos)
//Logs del inventario del dispositivos (los logs son un historiar inmodificable)
router.get('/logsConsumiblesIngreso', customerController.logsConsumiblesIngreso)
router.get('/logsConsumiblesSalida', customerController.logsConsumiblesSalida)
router.get('/logsEquipoSeguridad', customerController.logsEquipoSeguridad)
router.get('/logsHerramientas', customerController.logsHerramientas)
//codigo de pruebas 
router.get('/p', customerController.disaing)
// router.post('/profile-upload-single', customerController.subirImagen)
// router.post('/add', customerController.save);
// router.get('/delate/:ID', customerController.delate);
// router.get('/update/:ID', customerController.edit);
// router.post('/update/:ID', customerController.update); 
// router.post('/auth', customerController.auth)
// router.get('/listrestring', customerController.list2);


module.exports = router; 