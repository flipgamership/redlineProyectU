const bcryptjs = require('bcryptjs');
const { render } = require('ejs');
const session = require('express-session');
const express = require('express');
const moment = require('moment')
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
                conn.query("SELECT * FROM telemercadeoclientes WHERE estadoLLamada = 'No'", (error, results) => {
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
//zona de pruebas 
controller.pruebas = async (req, res) => {
    req.getConnection((error, conn) => {
        const sql = "SELECT `fecha`, `llamadas` FROM `telemercadoreportediario` WHERE `fecha`;"
        conn.query(sql, (error, results) => {
            if (error) throw error;
            if (results.length > 0) {
                res.render('pruebas',{
                     user: results[0] 
                });
            } else {
                res.send('not result');
            }
        })
    })
}






controller.pruebas2 = (req, res) => {
    res.render('pruebas')
}

controller.disaing = (req, res) => {
    res.render('menuEstadisticasReportDia', {
        login: true,
        name: req.session.name,
        role: req.session.role
    })
  
}

module.exports = controller