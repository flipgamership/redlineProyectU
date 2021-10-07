const bcryptjs = require('bcryptjs');
const nodemailer = require('nodemailer')
const { render } = require('ejs');
const session = require('express-session');
const express = require('express');
const moment = require('moment');
const { text } = require('express');


const controller = {}



controller.inicialPage = (req, res) => {
    res.render('index')
}
controller.inicialPageContact = (req, res) => {
    res.render('contact')
}
controller.logAut = (req, res) => {
    req.session.destroy(() => {
        res.redirect('/')
    })
}
//vistas login 
controller.login = (req, res) => {
    res.render('login')
}
controller.loginAuth = async (req, res) => {
    const user = req.body.user;
    const pass = req.body.pass;
    let passwordHaash = await bcryptjs.hash(pass, 8);
    if (user && pass) {
        req.getConnection((error, conn) => {
            conn.query("SELECT * FROM usuarios WHERE user=?", [user], async (error, results) => {
                console.log(results)
                if (results.length === 0 || !(await bcryptjs.compare(pass, results[0].password))) {
                    res.render('login', {
                        alert: true,
                        alertTitle: 'Ups los datos no coinciden',
                        alertMessage: 'por favor revise correctamente la informacion y si este error continua vuelve a intentarlo mas tarde',
                        alertIcon: 'error',
                        showConfirmButton: true,
                        ruta: 'login',
                        timer: 10000
                    })
                } else {
                    req.session.loggedin = true;
                    req.session.name = results[0].nombre;
                    req.session.role = results[0].cargo;
                    res.render('login', {
                        alert: true,
                        alertTitle: 'acceso consedido',
                        alertMessage: 'acceso valido',
                        alertIcon: 'success',
                        showConfirmButton: false,
                        ruta: 'welcome',
                        timer: 3000
                    })
                }

            })
        })
    } else {
        res.render('login', {
            alert: true,
            alertTitle: 'Ups por favor llene todos los datos',
            alertMessage: 'por favor revise correctamente la informacion y si este error continua vuelve a intentarlo mas tarde',
            alertIcon: 'error',
            showConfirmButton: true,
            ruta: 'login',
            timer: 10000
        })
    }
}
//home y welcome
controller.welcome = (req, res) => {
    if (req.session.loggedin) {
        res.render('welcome', {
            login: true,
            name: req.session.name,
            role: req.session.role
        })
    } else {
        res.render('login', {
            login: false,
        })
    }
}
controller.home = (req, res) => {
    if (req.session.loggedin) {
        res.render('home', {
            login: true,
            name: req.session.name,
            role: req.session.role
        })
    } else {
        res.render('login', {
            login: false,
        })
    }
}
//vistas telecomunicaciones
controller.tele = (req, res) => {
    if (req.session.loggedin) {
        res.render('sdcmenuTele', {
            login: true,
            name: req.session.name,
            role: req.session.role
        })
    } else {
        res.render('login', {
            login: false,
        })
    }
}
controller.reporteTeleMenu = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            res.render('reporteDiaTeleMenu', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })
        } else {
            res.redirect('/home')
        }
    } else {
        res.render('login', {
            login: false,
        })
    }
}
//TABLA 1 USUARIOS CON ESTADO DE LLAMADA NO 
controller.teleTableCP = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            req.getConnection((error, conn) => {
                conn.query("SELECT * FROM telemercadeoclientes WHERE estadoLLamada = 'No' || estadoLLamada = ''", (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('teleTableCP', {
                            results: results,
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        })
                    }
                })
            })
        } else {
            res.render('home', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }
}
//TABLA 2 USUARIOS CON ESTADO DE LLAMADA SI
controller.teleTableCC = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            req.getConnection((error, conn) => {
                conn.query("SELECT * FROM telemercadeoclientes WHERE estadoLLamada = 'Si'", (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('teleTableCC', {
                            results: results,
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        })
                    }
                })
            })
        } else {
            res.render('home', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }
}
//TABLA 3 USUARIOS CON ESTADO DE estadisticas de los usuarios 
controller.teleTableVerificDia = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            req.getConnection((error, conn) => {
                conn.query("SELECT * FROM telemercadoreportediario ", (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('teleTableReport', {
                            results: results,
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        })
                    }
                })
            })
        } else {
            res.render('home', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }
}
//api nuevos usuario telecomunicaciones no confirmados




controller.teleTableNewClientCP = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            res.render('newUserTele', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })

        } else {
            res.render('login', {
                login: false,
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }

}

controller.teleTableNewClientSendCP = async (req, res) => {
    const nombre = req.body.nombre;
    const cedula = req.body.cedula;
    const telefono = req.body.telefono;
    const plan = req.body.plan;
    const estadoLLamada = req.body.estadoLLamada
    req.getConnection((error, conn) => {
        conn.query('INSERT INTO telemercadeoclientes SET ?', { nombre: nombre, cedula: cedula, telefono: telefono, plan: plan, estadoLLamada: estadoLLamada }, async (error, results) => {
            if (error) {
                console.log(error)
                res.render('newUserTele', {
                    alert: true,
                    alertTitle: 'Ups hubo algun problema',
                    alertMessage: 'por favor revise correctamente la informacion y si este error continua vuelve a intentarlo mas tarde ten en cuenta que si el usuario ya esta creado no lo podras agregar',
                    alertIcon: 'error',
                    showConfirmButton: true,
                    ruta: 'newUserTele',
                    timer: 15000

                })
            } else {
                res.render('newUserTele', {
                    alert: true,
                    alertTitle: 'Registrado',
                    alertMessage: 'Registro de usuario Exitoso',
                    alertIcon: 'success',
                    showConfirmButton: true,
                    ruta: 'telecomunicacionesTableClientsP',
                    timer: 15000
                })
            }
        })
    })

}

//api general de telecomunicaciones
controller.teleTableEdit = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            const id = req.params.id;
            req.getConnection((error, conn) => {
                conn.query('SELECT * FROM telemercadeoclientes WHERE id = ?', [id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('editTeleUser', { user: results[0] })
                    }
                })
            })

        } else {
            res.render('login', {
                login: false,
            })
        }
    } else {
        res.redirect('/login')
    }


}

controller.teleTableEditSend = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            const id = req.body.id
            const name = req.body.nombre
            const cedula = req.body.cedula
            const telefono = req.body.telefono
            const plan = req.body.plan
            req.getConnection((error, conn) => {
                conn.query('UPDATE telemercadeoclientes SET ? WHERE id = ?', [{ nombre: name, cedula: cedula, telefono: telefono, plan: plan }, id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.redirect('/telecomunicaciones')
                    }
                })

            })
        } else {
            res.redirect('/home')
        }
    } else {
        res.redirect('/login')
    }
}
controller.teleTableValidUser = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            const id = req.params.id;
            req.getConnection((error, conn) => {
                conn.query('SELECT * FROM telemercadeoclientes WHERE id = ?', [id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('teleTipeficacion', { user: results[0] })
                    }
                })
            })
        }
    }
}
controller.teleTableValidUserSend = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            const id = req.body.id
            const tipificacion = req.body.tipificacion
            const observaciones = req.body.observaciones
            const estadoLLamada = req.body.estado
            req.getConnection((error, conn) => {
                conn.query('UPDATE telemercadeoclientes SET ? WHERE id = ?', [{ tipificacion: tipificacion, observaciones: observaciones, estadoLLamada: estadoLLamada }, id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.redirect('/telecomunicaciones')
                    }
                })

            })
        } else {
            res.redirect('/home')
        }
    } else {
        res.redirect('/login')
    }
}
controller.teleDeleteUser = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            const id = req.params.id
            req.getConnection((error, conn) => {
                conn.query('DELETE FROM telemercadeoclientes WHERE id= ?', [id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.redirect('/telecomunicaciones')
                    }
                })
            })
        }
    }
}
//tabla de datos de llamadas realizadas ese dia insercion
controller.teleReportInsertNewReport = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            res.render('newReportDia', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })

        } else {
            res.render('login', {
                login: false,
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }

}
controller.teleReportInsertNewReportSend = async (req, res) => {
    const fecha = req.body.fecha
    const llamadas = req.body.llamadas;
    const contestadas = req.body.contestadas;
    const noContestadas = req.body.noContestadas;
    const buzon = req.body.buzon;
    const interesados = req.body.interesados
    const soporte = req.body.soporte;
    const observaciones = req.body.observaciones;
    req.getConnection((error, conn) => {
        conn.query('INSERT INTO telemercadoreportediario SET ?', { fecha: fecha, llamadas: llamadas, contestadas: contestadas, noContestadas: noContestadas, buzon: buzon, interesados: interesados, soporte: soporte, observaciones: observaciones }, async (error, results) => {
            if (error) {
                console.log(error)
                res.render('newReportDia', {
                    alert: true,
                    alertTitle: 'Ups hubo algun problema',
                    alertMessage: 'por favor revise correctamente la informacion y si este error continua vuelve a intentarlo mas tarde',
                    alertIcon: 'error',
                    showConfirmButton: true,
                    ruta: 'telecomunicacionesNuevoReportDia',
                    timer: 15000

                })
            } else {
                res.render('newReportDia', {
                    alert: true,
                    alertTitle: 'Registrado',
                    alertMessage: 'Registro de reporte diario Exitoso',
                    alertIcon: 'success',
                    showConfirmButton: true,
                    ruta: 'telecomunicacionesReportTable',
                    timer: 15000
                })
            }
        })
    })

}
controller.reportTeleTableEdit = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            const id = req.params.id;
            req.getConnection((error, conn) => {
                conn.query('SELECT * FROM telemercadoreportediario WHERE id = ?', [id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('editReportDia', { user: results[0] })
                    }
                })
            })

        } else {
            res.render('login', {
                login: false,
            })
        }
    } else {
        res.redirect('/login')
    }


}
controller.reportTeleTableEditSend = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            const id = req.body.id
            const fecha = req.body.fecha
            const llamadas = req.body.llamadas;
            const contestadas = req.body.contestadas;
            const noContestadas = req.body.noContestadas;
            const buzon = req.body.buzon;
            const interesados = req.body.interesados
            const soporte = req.body.soporte;
            const observaciones = req.body.observaciones;
            req.getConnection((error, conn) => {
                conn.query('UPDATE telemercadoreportediario SET ? WHERE id = ?', [{ fecha: fecha, llamadas: llamadas, contestadas: contestadas, noContestadas: noContestadas, buzon: buzon, interesados: interesados, soporte: soporte, observaciones: observaciones }, id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.redirect('/telecomunicacionesReportTable')
                    }
                })

            })
        } else {
            res.redirect('/home')
        }
    } else {
        res.redirect('/login')
    }
}
controller.teleDeleteReport = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            const id = req.params.id
            req.getConnection((error, conn) => {
                conn.query('DELETE FROM telemercadoreportediario WHERE id= ?', [id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.redirect('/telecomunicacionesReportTable')
                    }
                })
            })
        }
    }
}
controller.teleEstadisticasMenu = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            res.render('menuEstadisticasReportDia', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })

        } else {
            res.render('home', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }
}


controller.teleEstadisticasTable1 = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            req.getConnection((error, conn) => {
                conn.query("SELECT * FROM telemercadoreportediario ", (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('teleTableEstadisticas1', {
                            results: results,
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        })
                    }
                })
            })
        } else {
            res.render('home', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }
}
controller.teleEstadisticasTable2 = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            req.getConnection((error, conn) => {
                conn.query("SELECT * FROM telemercadeoclientes WHERE tipificacion = 'Soporte';", (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('teleTableEstadisticas2', {
                            results: results,
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        })
                    }
                })
            })
        } else {
            res.render('home', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }
}
controller.teleEstadisticasTable3 = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            req.getConnection((error, conn) => {
                conn.query("SELECT * FROM telemercadeoclientes WHERE tipificacion = 'Apps y Tv' || tipificacion = 'Interesado apps'|| tipificacion = 'Interesado tv';", (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('teleTableEstadisticas3', {
                            results: results,
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        })
                    }
                })
            })
        } else {
            res.render('home', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }
}
controller.teleEstadisticasTable4 = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            req.getConnection((error, conn) => {
                conn.query("SELECT * FROM telemercadeoclientes WHERE tipificacion = 'Interesado apps';", (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('teleTableEstadisticas3', {
                            results: results,
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        })
                    }
                })
            })
        } else {
            res.render('home', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }
}
controller.teleEstadisticasTable5 = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            req.getConnection((error, conn) => {
                conn.query("SELECT * FROM telemercadeoclientes WHERE tipificacion = 'Interesado tv';", (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('teleTableEstadisticas3', {
                            results: results,
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        })
                    }
                })
            })
        } else {
            res.render('home', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }
}


//data 
controller.seleccionaFechaEstadisticas1 = async (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'servicioCliente') {
            const fecha = req.body.fecha
            req.getConnection((error, conn) => {
                conn.query('SELECT fecha, llamadas, soporte, buzon, interesados FROM telemercadoreportediario WHERE fecha >= ?', [fecha], (error, results) => {
                    if (error) throw error;

                    if (results.length > 0) {
                        console.log(results)
                        res.render('estadisticasReportDiaF', {
                            user: results,
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        });
                    } else {
                        res.redirect('/home')
                    }
                })
            })
        } else {
            res.render('home', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }


}
//vistas register
controller.register = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin') {
            req.getConnection((error, conn) => {
                conn.query('SELECT * FROM usuarios', (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('registerTable', {
                            results: results,
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        })
                    }
                })
            })
        } else {
            res.render('home', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }
}

controller.registerUsers = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin') {
            res.render('registerUser', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })

        } else {
            res.render('login', {
                login: false,
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }

}





//apis register
//envio register
controller.sendRegister = async (req, res) => {
    const nombre = req.body.nombre;
    const email = req.body.email;
    const user = req.body.user;
    const pass = req.body.password;
    const rol = req.body.role
    let passwordHaash = await bcryptjs.hash(pass, 8);
    req.getConnection((error, conn) => {
        conn.query('INSERT INTO usuarios SET ?', { nombre: nombre, email: email, user: user, password: passwordHaash, cargo: rol }, async (error, results) => {
            if (error) {
                console.log(error)
                res.render('registerUser', {
                    alert: true,
                    alertTitle: 'Ups hubo algun problema',
                    alertMessage: 'por favor revise correctamente la informacion y si este error continua vuelve a intentarlo mas tarde ten en cuenta que si el usuario ya esta creado no lo podras agregar',
                    alertIcon: 'error',
                    showConfirmButton: true,
                    ruta: 'usuario',
                    timer: 15000

                })
            } else {
                res.render('registerUser', {
                    alert: true,
                    alertTitle: 'Registrado',
                    alertMessage: 'Registro de cuenta Exitosa',
                    alertIcon: 'success',
                    showConfirmButton: true,
                    ruta: 'register',
                    timer: 15000
                })
            }
        })
    })

}

controller.registerUEdit = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin') {
            const id = req.params.id;
            req.getConnection((error, conn) => {
                conn.query('SELECT * FROM usuarios WHERE id = ?', [id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('editUsers', { user: results[0] })
                    }
                })
            })

        } else {
            res.render('login', {
                login: false,
            })
        }
    } else {
        res.redirect('/login')
    }


}
controller.sendUpdateUser = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin') {
            const id = req.body.id
            const name = req.body.nombre
            const user = req.body.user
            const email = req.body.email
            const role = req.body.cargo
            const password = req.body.cargo
            req.getConnection((error, conn) => {
                conn.query('UPDATE usuarios SET ? WHERE id = ?', [{ nombre: name, user: user, email: email, cargo: role }, id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.redirect('/register')
                    }
                })

            })
        } else {
            res.redirect('/home')
        }
    } else {
        res.redirect('/login')
    }
}
controller.deleteUser = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin') {
            const id = req.params.id
            req.getConnection((error, conn) => {
                conn.query('DELETE FROM usuarios WHERE id= ?', [id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.redirect('/register')
                    }
                })
            })
        }
    }
}

//cambio de contraseña
controller.passwordNew = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin') {
            const id = req.params.id
            req.getConnection((error, conn) => {
                conn.query('SELECT * FROM usuarios WHERE id = ?', [id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('newPassword', { user: results[0] })
                    }
                })
            })
        } else {
            res.redirect('/home')
        }
    } else {
        res.redirect('/login')
    }
}
controller.savePasssword = async (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin') {
            const id = req.body.id
            const pass = req.body.password
            let passwordHaash = await bcryptjs.hash(pass, 8);
            req.getConnection((error, conn) => {
                conn.query('UPDATE usuarios SET ? WHERE id = ?', [{ password: passwordHaash }, id], async (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.redirect('/register')
                    }
                })

            })

        }
    }
}









//tabla de tecnicos para retirar del inventario herramientas 

controller.menuInventoryH1 = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'tecnico') {
            res.render('menu1InventarioHerramientas', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })

        } else {
            res.redirect('/home')
        }
    } else {
        res.render('login', {
            login: false,
        })
    }

}
controller.inventarioH1 = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'tecnico') {
            req.getConnection((error, conn) => {
                conn.query("SELECT * FROM herramienta WHERE estado = 'bodega'", (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('inventario1Herramientas', {
                            results: results,
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        })

                    }

                })

            })
        }
    }
}
controller.inventarioH2 = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'tecnico') {
            req.getConnection((error, conn) => {
                conn.query("SELECT * FROM herramienta WHERE estado = 'prestado'", (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('inventario2Herramientas', {
                            results: results,
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        })

                    }

                })

            })
        }
    }
}
controller.quienMeTieneh1 = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'tecnico') {
            const id = req.body.id
            const nameH1 = req.body.nameH
            const codigoH1 = req.body.codigoH
            console.log(id, nameH1, codigoH1)
            req.getConnection((error, conn) => {
                conn.query("SELECT * FROM `cuadrillas` WHERE id = ?", [id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        console.log(results)
                        res.render('quienMeTieneH1', {
                            results: results,
                            nameH1: nameH1,
                            codigoH1: codigoH1,
                            name: req.session.name,
                            role: req.session.role
                        })
                    }
                })
            })
        } else {
            res.redirect('/home')
        }
    } else {
        res.render('login', {
            login: false,
        })
    }

}
// envio de correos 
controller.sendCorreoH1 = async (req, res) => {
    const correo = req.body.correo
    const name = req.body.nombre
    const name_herramienta = req.body.nombre_herramienta
    const codigoH = req.body.codigo_herramienta
    var transporter = nodemailer.createTransport({
        host: "smtp.gmail.com",
        port: 587,
        secure: false,
        auth: {
            user: "maisanmailer@gmail.com",
            pass: "231215maisanmailer"
        }

    })
    var mailOptions = {
        from: "Remitente",
        to: correo,
        subject: "Por favor debuelva el equipo ",
        html: `<!DOCTYPE html>
        <html lang="es">
        <head>
            <meta charset="utf-8">
            <title>holi</title>
        </head>
        <body style="background-color: white ">
        
        <!--Copia desde aquí-->
        <table style="max-width: 600px; padding: 10px; margin:0 auto; border-collapse: collapse;">
            <tr>
                <td style="background-color: #ecf0f1; text-align: left; padding: 0">
                    <a href="https://redline.net.co/">
                        <img width="20%" style="display:block; margin: 1.5% 3%" src="https://redline.net.co/wp-content/uploads/2020/01/cropped-LOGOREDLINE-2.png">
                    </a>
                </td>
            </tr>
        
            <tr>
                <td style="padding: 0">
                    <img style="padding: 0; display: block" src="https://p4.wallpaperbetter.com/wallpaper/335/895/657/wind-farm-wallpaper-preview.jpg" width="100%">
                </td>
            </tr>
            
            <tr>
                <td style="background-color: #ecf0f1">
                    <div style="color: #34495e; margin: 4% 10% 2%; text-align: justify;font-family: sans-serif">
                        <h2 style="color: #e67e22; margin: 0 0 7px">Hola tecnico de Redline!</h2>
                        <p style="margin: 2px; font-size: 15px">
                            espero que este teniendo un hermoso dia somos el servicio de notificaciones a 
                            correo del sistema de inventario de redline el dia de hoy te escirbimos para solicitar la debolucion de :</p>
                        <ul style="font-size: 15px;  margin: 10px 0">
                            <li>Herramienta: </li>`+ name_herramienta + `
                            <li>Codigo de herramienta: </li>`+ codigoH + `
                            <li>¿Quien me tiene?</li>
                            <li>tecnico que me tiene: </li>`+ name + `
                            <li>Espero que la devuelvas a la bodega y el ingreso en la plataforma</li>
                        </ul>
                        <p style="color: #b3b3b3; font-size: 12px; text-align: center;margin: 30px 0 0">redline || <a href="https://github.com/flipgamership">Juan Felipe Correa Rios</a></p>
                    </div>
                </td>
            </tr>
        </table>
        <!--hasta aquí-->
        
        </body>
        </html>
        
        `

    }
    const info = await transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            console.log(error)
        } else {
            console.log("mail enviado")
            res.redirect("/inventarioHerramientasPRedline")
        }
    })
}

controller.herramientasPrestadasInventario = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'tecnico') {
            req.getConnection((error, conn) => {
                conn.query("SELECT * FROM herramienta WHERE estado = 'prestado'", (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('inventario2Herramientas', {
                            results: results,
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        })

                    }

                })

            })
        } else {
            res.redirect('/home')
        }

    } else {
        res.render('login', {
            login: false,
        })
    }
}
controller.herramientasNoPrestadasInventario = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin' || req.session.role == 'tecnico') {
            req.getConnection((error, conn) => {
                conn.query("SELECT * FROM herramienta WHERE estado = 'bodega'", (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('inventario1Herramientas', {
                            results: results,
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        })

                    }

                })

            })
        } else {
            res.redirect('/home')
        }
    } else {
        res.render('login', {
            login: false,
        })
    }
}
//tecnicos register
controller.registrarTecnico = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin') {
            req.getConnection((error, conn) => {
                conn.query('SELECT * FROM cuadrillas', (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.render('tableTecnicoGeneral', {
                            results: results,
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        })
                    }
                })
            })
        } else {
            res.render('home', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }
}

controller.tecnicoEditTable = (req, res) => {
    const id = req.params.id
    if (req.session.loggedin) {
        if (req.session.role == 'admin') {
            req.getConnection((error, conn) => {
                conn.query('SELECT * FROM cuadrillas WHERE id = ?', [id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        console.log(results)
                        res.render('editTecnicoRegister', {
                            data: results[0],
                            login: true,
                            name: req.session.name,
                            role: req.session.role
                        })


                    }
                })
            })
        } else {
            res.render('home', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }
}
controller.tecnicoEditSendTable = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin') {
            const id = req.body.id
            const name = req.body.nombre
            const correo = req.body.correo
            const cedula = req.body.cedula
            const celular = req.body.celular

            req.getConnection((error, conn) => {
                conn.query('UPDATE cuadrillas SET ? WHERE id = ?', [{ miembro: name, correo: correo, cc: cedula, celular: celular }, id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.redirect('/registerTecnico')
                    }
                })

            })
        } else {
            res.redirect('/home')
        }
    } else {
        res.redirect('/login')
    }
}
controller.TableNewTecnico = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin') {
            res.render('newTecnicoTable', {
                login: true,
                name: req.session.name,
                role: req.session.role
            })

        } else {
            res.render('login', {
                login: false,
            })
        }
    } else {
        res.render('login', {
            login: false,
        })
    }

}

controller.TableNewTecnicoSend = async (req, res) => {
    const name = req.body.nombre
    const correo = req.body.correo
    const cedula = req.body.cedula
    const celular = req.body.celular
    req.getConnection((error, conn) => {
        conn.query('INSERT INTO cuadrillas SET ?', { miembro: name, correo: correo, cc: cedula, celular: celular }, async (error, results) => {
            if (error) {
                console.log(error)
                res.render('newUserTele', {
                    alert: true,
                    alertTitle: 'Ups hubo algun problema',
                    alertMessage: 'por favor revise correctamente la informacion y si este error continua vuelve a intentarlo mas tarde ten en cuenta que si el usuario ya esta creado no lo podras agregar',
                    alertIcon: 'error',
                    showConfirmButton: true,
                    ruta: 'registerNewTecnicoRedline',
                    timer: 15000

                })
            } else {
                res.render('newUserTele', {
                    alert: true,
                    alertTitle: 'Registrado',
                    alertMessage: 'Registro de tecnico Exitoso',
                    alertIcon: 'success',
                    showConfirmButton: true,
                    ruta: 'registerTecnico',
                    timer: 15000
                })
            }
        })
    })
}
controller.TableNewTecnicoDelate = (req, res) => {
    if (req.session.loggedin) {
        if (req.session.role == 'admin') {
            const id = req.params.id
            req.getConnection((error, conn) => {
                conn.query('DELETE FROM cuadrillas WHERE id= ?', [id], (error, results) => {
                    if (error) {
                        console.log(error)
                    } else {
                        res.redirect('/registerTecnico')
                    }
                })
            })
        }
    }
}

// const multer = require('multer')

// var storage = multer.diskStorage({
//     destination: function (req, file, cb){
//         cb (null, './uploads')
//     },
//     filename: function (req, file, cb){
//         cb (null, file.originalname)
//     },
// })

// var upload = multer({ storage })

// controller.subirImange = upload.single('file'), (req, res) =>{
    // if (!req.file) res.status(404).send( {
    //     success: false,
    //     error: 'file not fund'
    // })
    // return res.status(200).send({
    //     success: true,
    //     error: 'file uploaded'
    // })
// }














//zona de pruebas 
controller.pruebas = (req, res) => {
    res.render('pruebas')
}


controller.pruebas2 = (req, res) => {

}


// if(results.length > 0){
//     console.log(results)
//     res.render('pruebas2',{
//         results:results
//     });
// }else{
//     res.send('not result')
// }
controller.uploader = (req, res)=>{
    if (!req.file) res.status(404).send( {
        success: false,
        error: 'file not fund'
    })
    return res.status(200).send({
        success: true,
        error: 'file uploaded'
    })
}



controller.disaing = (req, res) => {
    res.render('menuEstadisticasReportDia', {
        login: true,
        name: req.session.name,
        role: req.session.role
    })

}

module.exports = controller