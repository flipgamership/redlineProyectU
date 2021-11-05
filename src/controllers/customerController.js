const bcryptjs = require("bcryptjs");
const nodemailer = require("nodemailer");
const { render } = require("ejs");
const session = require("express-session");
const express = require("express");
const moment = require("moment");
const { text } = require("express");
const controller = {};
//SELECT SUM(cantidad) AS total FROM consumibles WHERE id_consumibles = 'GUL02';
//SELECT * FROM logs_inventario_consumibles WHERE id=(SELECT max(id) FROM logs_inventario_consumibles WHERE id_consumibles = 'GUL70');
//SELECT SUM(cantidad_nueva_ingresada) FROM logs_inventario_consumibles WHERE id_consumibles = 'GUL70';
//SELECT fecha FROM logs_inventario_consumibles WHERE id=(SELECT max(id) FROM logs_inventario_consumibles WHERE id_consumibles = 'GUL70');
controller.inicialPage = (req, res) => {
  res.render("index");
};
controller.inicialPageContact = (req, res) => {
  res.render("contact");
};
controller.logAut = (req, res) => {
  req.session.destroy(() => {
    res.redirect("/");
  });
};
//vistas login
controller.login = (req, res) => {
  res.render("login");
};
controller.loginAuth = async (req, res) => {
  const user = req.body.user;
  const pass = req.body.pass;
  let passwordHaash = await bcryptjs.hash(pass, 8);
  if (user && pass) {
    req.getConnection((error, conn) => {
      conn.query(
        "SELECT * FROM usuarios WHERE user=?",
        [user],
        async (error, results) => {
          console.log(results);
          if (
            results.length === 0 ||
            !(await bcryptjs.compare(pass, results[0].password))
          ) {
            res.render("login", {
              alert: true,
              alertTitle: "Ups los datos no coinciden",
              alertMessage:
                "por favor revise correctamente la informacion y si este error continua vuelve a intentarlo mas tarde",
              alertIcon: "error",
              showConfirmButton: true,
              ruta: "login",
              timer: 10000,
            });
          } else {
            req.session.loggedin = true;
            req.session.name = results[0].nombre;
            req.session.role = results[0].cargo;
            res.render("login", {
              alert: true,
              alertTitle: "acceso consedido",
              alertMessage: "acceso valido",
              alertIcon: "success",
              showConfirmButton: false,
              ruta: "welcome",
              timer: 3000,
            });
          }
        }
      );
    });
  } else {
    res.render("login", {
      alert: true,
      alertTitle: "Ups por favor llene todos los datos",
      alertMessage:
        "por favor revise correctamente la informacion y si este error continua vuelve a intentarlo mas tarde",
      alertIcon: "error",
      showConfirmButton: true,
      ruta: "login",
      timer: 10000,
    });
  }
};
//home y welcome
controller.welcome = (req, res) => {
  if (req.session.loggedin) {
    res.render("welcome", {
      login: true,
      name: req.session.name,
      role: req.session.role,
    });
  } else {
    res.render("login", {
      login: false,
    });
  }
};
controller.home = (req, res) => {
  if (req.session.loggedin) {
    res.render("home", {
      login: true,
      name: req.session.name,
      role: req.session.role,
    });
  } else {
    res.render("login", {
      login: false,
    });
  }
};
//vistas telecomunicaciones
controller.tele = (req, res) => {
  if (req.session.loggedin) {
    res.render("sdcmenuTele", {
      login: true,
      name: req.session.name,
      role: req.session.role,
    });
  } else {
    res.render("login", {
      login: false,
    });
  }
};
controller.reporteTeleMenu = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      res.render("reporteDiaTeleMenu", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
//TABLA 1 USUARIOS CON ESTADO DE LLAMADA NO
controller.teleTableCP = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM telemercadeoclientes WHERE estadoLLamada = 'No' || estadoLLamada = ''",
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("teleTableCP", {
                results: results,
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
//TABLA 2 USUARIOS CON ESTADO DE LLAMADA SI
controller.teleTableCC = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM telemercadeoclientes WHERE estadoLLamada = 'Si'",
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("teleTableCC", {
                results: results,
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
//TABLA 3 USUARIOS CON ESTADO DE estadisticas de los usuarios
controller.teleTableVerificDia = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM telemercadoreportediario ",
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("teleTableReport", {
                results: results,
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
//api nuevos usuario telecomunicaciones no confirmados

controller.teleTableNewClientCP = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      res.render("newUserTele", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    } else {
      res.render("login", {
        login: false,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.teleTableNewClientSendCP = async (req, res) => {
  const nombre = req.body.nombre;
  const cedula = req.body.cedula;
  const telefono = req.body.telefono;
  const plan = req.body.plan;
  const estadoLLamada = req.body.estadoLLamada;
  req.getConnection((error, conn) => {
    conn.query(
      "INSERT INTO telemercadeoclientes SET ?",
      {
        nombre: nombre,
        cedula: cedula,
        telefono: telefono,
        plan: plan,
        estadoLLamada: estadoLLamada,
      },
      async (error, results) => {
        if (error) {
          console.log(error);
          res.render("newUserTele", {
            alert: true,
            alertTitle: "Ups hubo algun problema",
            alertMessage:
              "por favor revise correctamente la informacion y si este error continua vuelve a intentarlo mas tarde ten en cuenta que si el usuario ya esta creado no lo podras agregar",
            alertIcon: "error",
            showConfirmButton: true,
            ruta: "newUserTele",
            timer: 15000,
          });
        } else {
          res.render("newUserTele", {
            alert: true,
            alertTitle: "Registrado",
            alertMessage: "Registro de usuario Exitoso",
            alertIcon: "success",
            showConfirmButton: true,
            ruta: "telecomunicacionesTableClientsP",
            timer: 15000,
          });
        }
      }
    );
  });
};

//api general de telecomunicaciones
controller.teleTableEdit = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM telemercadeoclientes WHERE id = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("editTeleUser", { user: results[0] });
            }
          }
        );
      });
    } else {
      res.render("login", {
        login: false,
      });
    }
  } else {
    res.redirect("/login");
  }
};

controller.teleTableEditSend = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      const id = req.body.id;
      const name = req.body.nombre;
      const cedula = req.body.cedula;
      const telefono = req.body.telefono;
      const plan = req.body.plan;
      req.getConnection((error, conn) => {
        conn.query(
          "UPDATE telemercadeoclientes SET ? WHERE id = ?",
          [
            { nombre: name, cedula: cedula, telefono: telefono, plan: plan },
            id,
          ],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.redirect("/telecomunicaciones");
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.redirect("/login");
  }
};
controller.teleTableValidUser = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM telemercadeoclientes WHERE id = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("teleTipeficacion", { user: results[0] });
            }
          }
        );
      });
    }
  }
};
controller.teleTableValidUserSend = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      const id = req.body.id;
      const tipificacion = req.body.tipificacion;
      const observaciones = req.body.observaciones;
      const estadoLLamada = req.body.estado;
      req.getConnection((error, conn) => {
        conn.query(
          "UPDATE telemercadeoclientes SET ? WHERE id = ?",
          [
            {
              tipificacion: tipificacion,
              observaciones: observaciones,
              estadoLLamada: estadoLLamada,
            },
            id,
          ],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.redirect("/telecomunicaciones");
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.redirect("/login");
  }
};
controller.teleDeleteUser = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "DELETE FROM telemercadeoclientes WHERE id= ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.redirect("/telecomunicaciones");
            }
          }
        );
      });
    }
  }
};
//tabla de datos de llamadas realizadas ese dia insercion
controller.teleReportInsertNewReport = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      res.render("newReportDia", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    } else {
      res.render("login", {
        login: false,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
controller.teleReportInsertNewReportSend = async (req, res) => {
  const fecha = req.body.fecha;
  const llamadas = req.body.llamadas;
  const contestadas = req.body.contestadas;
  const noContestadas = req.body.noContestadas;
  const buzon = req.body.buzon;
  const interesados = req.body.interesados;
  const soporte = req.body.soporte;
  const observaciones = req.body.observaciones;
  req.getConnection((error, conn) => {
    conn.query(
      "INSERT INTO telemercadoreportediario SET ?",
      {
        fecha: fecha,
        llamadas: llamadas,
        contestadas: contestadas,
        noContestadas: noContestadas,
        buzon: buzon,
        interesados: interesados,
        soporte: soporte,
        observaciones: observaciones,
      },
      async (error, results) => {
        if (error) {
          console.log(error);
          res.render("newReportDia", {
            alert: true,
            alertTitle: "Ups hubo algun problema",
            alertMessage:
              "por favor revise correctamente la informacion y si este error continua vuelve a intentarlo mas tarde",
            alertIcon: "error",
            showConfirmButton: true,
            ruta: "telecomunicacionesNuevoReportDia",
            timer: 15000,
          });
        } else {
          res.render("newReportDia", {
            alert: true,
            alertTitle: "Registrado",
            alertMessage: "Registro de reporte diario Exitoso",
            alertIcon: "success",
            showConfirmButton: true,
            ruta: "telecomunicacionesReportTable",
            timer: 15000,
          });
        }
      }
    );
  });
};
controller.reportTeleTableEdit = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM telemercadoreportediario WHERE id = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("editReportDia", { user: results[0] });
            }
          }
        );
      });
    } else {
      res.render("login", {
        login: false,
      });
    }
  } else {
    res.redirect("/login");
  }
};
controller.reportTeleTableEditSend = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      const id = req.body.id;
      const fecha = req.body.fecha;
      const llamadas = req.body.llamadas;
      const contestadas = req.body.contestadas;
      const noContestadas = req.body.noContestadas;
      const buzon = req.body.buzon;
      const interesados = req.body.interesados;
      const soporte = req.body.soporte;
      const observaciones = req.body.observaciones;
      req.getConnection((error, conn) => {
        conn.query(
          "UPDATE telemercadoreportediario SET ? WHERE id = ?",
          [
            {
              fecha: fecha,
              llamadas: llamadas,
              contestadas: contestadas,
              noContestadas: noContestadas,
              buzon: buzon,
              interesados: interesados,
              soporte: soporte,
              observaciones: observaciones,
            },
            id,
          ],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.redirect("/telecomunicacionesReportTable");
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.redirect("/login");
  }
};
controller.teleDeleteReport = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "DELETE FROM telemercadoreportediario WHERE id= ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.redirect("/telecomunicacionesReportTable");
            }
          }
        );
      });
    }
  }
};
controller.teleEstadisticasMenu = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      res.render("menuEstadisticasReportDia", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.teleEstadisticasTable1 = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM telemercadoreportediario ",
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("teleTableEstadisticas1", {
                results: results,
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
controller.teleEstadisticasTable2 = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM telemercadeoclientes WHERE tipificacion = 'Soporte';",
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("teleTableEstadisticas2", {
                results: results,
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
controller.teleEstadisticasTable3 = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM telemercadeoclientes WHERE tipificacion = 'Apps y Tv' || tipificacion = 'Interesado apps'|| tipificacion = 'Interesado tv';",
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("teleTableEstadisticas3", {
                results: results,
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
controller.teleEstadisticasTable4 = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM telemercadeoclientes WHERE tipificacion = 'Interesado apps';",
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("teleTableEstadisticas3", {
                results: results,
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
controller.teleEstadisticasTable5 = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM telemercadeoclientes WHERE tipificacion = 'Interesado tv';",
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("teleTableEstadisticas3", {
                results: results,
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

//data
controller.seleccionaFechaEstadisticas1 = async (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "servicioCliente") {
      const fecha = req.body.fecha;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT fecha, llamadas, soporte, buzon, interesados FROM telemercadoreportediario WHERE fecha >= ?",
          [fecha],
          (error, results) => {
            if (error) throw error;

            if (results.length > 0) {
              console.log(results);
              res.render("estadisticasReportDiaF", {
                user: results,
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            } else {
              res.redirect("/home");
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
//vistas register
controller.register = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin") {
      req.getConnection((error, conn) => {
        conn.query("SELECT * FROM usuarios", (error, results) => {
          if (error) {
            console.log(error);
          } else {
            res.render("registerTable", {
              results: results,
              login: true,
              name: req.session.name,
              role: req.session.role,
            });
          }
        });
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.registerUsers = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin") {
      res.render("registerUser", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    } else {
      res.render("login", {
        login: false,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

//apis register
//envio register
controller.sendRegister = async (req, res) => {
  const nombre = req.body.nombre;
  const email = req.body.email;
  const user = req.body.user;
  const pass = req.body.password;
  const rol = req.body.role;
  let passwordHaash = await bcryptjs.hash(pass, 8);
  req.getConnection((error, conn) => {
    conn.query(
      "INSERT INTO usuarios SET ?",
      {
        nombre: nombre,
        email: email,
        user: user,
        password: passwordHaash,
        cargo: rol,
      },
      async (error, results) => {
        if (error) {
          console.log(error);
          res.render("registerUser", {
            alert: true,
            alertTitle: "Ups hubo algun problema",
            alertMessage:
              "por favor revise correctamente la informacion y si este error continua vuelve a intentarlo mas tarde ten en cuenta que si el usuario ya esta creado no lo podras agregar",
            alertIcon: "error",
            showConfirmButton: true,
            ruta: "usuario",
            timer: 15000,
          });
        } else {
          res.render("registerUser", {
            alert: true,
            alertTitle: "Registrado",
            alertMessage: "Registro de cuenta Exitosa",
            alertIcon: "success",
            showConfirmButton: true,
            ruta: "register",
            timer: 15000,
          });
        }
      }
    );
  });
};

controller.registerUEdit = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM usuarios WHERE id = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("editUsers", { user: results[0] });
            }
          }
        );
      });
    } else {
      res.render("login", {
        login: false,
      });
    }
  } else {
    res.redirect("/login");
  }
};
controller.sendUpdateUser = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin") {
      const id = req.body.id;
      const name = req.body.nombre;
      const user = req.body.user;
      const email = req.body.email;
      const role = req.body.cargo;
      const password = req.body.cargo;
      req.getConnection((error, conn) => {
        conn.query(
          "UPDATE usuarios SET ? WHERE id = ?",
          [{ nombre: name, user: user, email: email, cargo: role }, id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.redirect("/register");
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.redirect("/login");
  }
};
controller.deleteUser = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "DELETE FROM usuarios WHERE id= ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.redirect("/register");
            }
          }
        );
      });
    }
  }
};

//cambio de contraseña
controller.passwordNew = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM usuarios WHERE id = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("newPassword", { user: results[0] });
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.redirect("/login");
  }
};
controller.savePasssword = async (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin") {
      const id = req.body.id;
      const pass = req.body.password;
      let passwordHaash = await bcryptjs.hash(pass, 8);
      req.getConnection((error, conn) => {
        conn.query(
          "UPDATE usuarios SET ? WHERE id = ?",
          [{ password: passwordHaash }, id],
          async (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.redirect("/register");
            }
          }
        );
      });
    }
  }
};

//tabla de tecnicos para retirar del inventario herramientas

controller.menuInventoryH1 = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      res.render("menu1InventarioHerramientas", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.quienMeTieneh1 = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.body.id;
      const nameH1 = req.body.nameH;
      const codigoH1 = req.body.codigoH;
      console.log(id, nameH1, codigoH1);
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM `cuadrillas` WHERE id = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              console.log(results);
              res.render("quienMeTieneH1", {
                results: results,
                nameH1: nameH1,
                codigoH1: codigoH1,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
// envio de correos
controller.sendCorreoH1 = async (req, res) => {
  const correo = req.body.correo;
  const name = req.body.nombre;
  const name_herramienta = req.body.nombre_herramienta;
  const codigoH = req.body.codigo_herramienta;
  var transporter = nodemailer.createTransport({
    host: "smtp.gmail.com",
    port: 587,
    secure: false,
    auth: {
      user: "maisanmailer@gmail.com",
      pass: "231215maisanmailer",
    },
  });
  var mailOptions = {
    from: "Remitente",
    to: correo,
    subject: "Por favor debuelva el equipo ",
    html:
      `<!DOCTYPE html>
        <html lang="es">
        <head>
            <meta charset="utf-8">
            <title>holi</title>
        </head>
        <body style="background-color: white ">
        
        <!--Copia desde aquí-->
        <table style="max-width: 600px; padding: 10px; margin:0 auto; border-collapse: collapse;">
            <tr>
            <td style="background-color: #ecf0f1; text-align: left; padding: 0; display: inline-block; ">
            <div style="display: inline-block;" >
                <a href="https://redline.net.co/" >
                    <img width="20%" style="display:inline-block; margin: 1.5% 3%" src="https://redline.net.co/wp-content/uploads/2020/01/cropped-LOGOREDLINE-2.png">
                </a>
                <a href="https://github.com/flipgamership" >
                    <img width="10%" style="display:inline-block; margin: 2% 3%" src="https://lh3.googleusercontent.com/Qm964MvlThDWpO2G8sD2B339Z3Y1WPUuddC4dJpWjwhlrleLdxVmRypBTLxuXOtWofe6lopRd4r1BiBf_bHf1ZBweMLrBaP-jiHwWEulIRre_47CRDS4Anx2-JX0NMZLMLsNK5EO6Ztfd9ywb1ZsGYtF_oCFrZAikAUH3hj8OXD2V4jwFE4HZwj-m4NgDN7kYgSrSGH7M4TjaXuvmLcHAETa_x8kkBR7P8A2i3UQbBNVVGJeLN9mEOqWKcw2dGatg19-9CD-FNRaTBYi8sLLKybKP2ptpXnCfIbs2n1IW2LAEthVuZP-I3hlbpVw4LgJjXvxVvsgPn09DdotCahjMcGeuDjHJC7ZQFxRJZyvPM5g4ZOKGV8GzolzQdUFXuGFOyFqMpNAxQjcKdofi-J1RALPD9FAn4qRP47LNPdreMCwFwWITFDRGtrLO6qnPUPNjFjGFFGklVTcw67qtvw1WWLG7yeUjipm2j1wlTwz6v3zy3EXLLfzNWEOW9QkQ-wIOQe1C5-wbZ6Yt4eaCkIz0P4zLB58fkMt_2SNJJ6rRyfqvor58owEAxobsOlo8txPNE-Ck3_cVoCMpizPbSC57xe1rOEqrHE8C-M6CwT4RKlXBCIoxV32SHRD40hkVvmiELJIOW-F72zNow2vYtNAjnmYCxz6kglFZY70iR5OaBkzPtNqYnu9s-iKHqtdM2swmAdi63TXdBfrZ8LT4ghQAks=w603-h438-no?authuser=0">
                </a>
            </div>
            
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
                            <li>Herramienta: </li>
                            <p style="color: #eebbf8; margin-top: 3px; margin-left: 2px; text-align: center;">
                            ` +
                            name_herramienta +
                            `
                            
                            
                            <li>Codigo de herramienta: </li>
                            <p style="color: #eebbf8; margin-top: 3px; margin-left: 2px; text-align: center;">
                            ` +
                            codigoH +
                            `
                            </p>
                            <li>¿Quien me tiene?</li>
                            <li>tecnico que me tiene: </li>
                            <p style="color: #eebbf8; margin-top: 3px; margin-left: 2px; text-align: center;">
                            ` +
                            name +
                            `
                            </p>
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
        
        `,
  };
  const info = await transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.log(error);
    } else {
      console.log("mail enviado");
      res.redirect("/inventarioHerramientasPRedline");
    }
  });
};

controller.herramientasPrestadasInventario = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM herramienta WHERE estado = 'P'",
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("inventario2Herramientas", {
                results: results,
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
controller.herramientasNoPrestadasInventario = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM herramienta WHERE estado = 'B'",
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("inventario1Herramientas", {
                results: results,
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.agregarNewHerramientaInventario = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "tecnico" || req.session.role == "admin") {
      res.render("newHerramientaInventario", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.agregarNewHerramientaInventarioSend = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "tecnico" || req.session.role == "admin") {
      const file = req.file;
      const imgName = file.filename;
      const name = req.body.nombre;
      const codigoH = req.body.codigoH;
      const estado = req.body.estado;
      const descripcion = req.body.descripcion;
      const fecha = req.body.fecha;
      const id_tecnico = req.body.id_tecnico;
      req.getConnection((error, conn) => {
        conn.query(
          "INSERT INTO herramienta SET ?",
          {
            codigo_herramienta: codigoH,
            img: imgName,
            nombre: name,
            estado: estado,
            descripcion: descripcion,
            fecha: fecha,
            id_tecnico: id_tecnico,
          },
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              console.log("ingreso correcto");
              res.render("menu1InventarioHerramientas", {
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.editarHerramientaInventario = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role) {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM herramienta WHERE codigo_herramienta = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("editInventarioHerrramientas", {
                data: results[0],
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.editarHerramientaInventarioSend = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "tecnico" || req.session.role == "admin") {
      const name = req.body.nombre;
      const codigoH = req.body.codigoH;
      const estado = req.body.estado;
      const descripcion = req.body.descripcion;
      const fecha = req.body.fecha;
      const id_tecnico = req.body.id_tecnico;
      const id = codigoH;
      req.getConnection((error, conn) => {
        conn.query(
          "UPDATE herramienta SET ? WHERE codigo_herramienta = ?;",
          [{ nombre: name, descripcion: descripcion }, id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("menu1InventarioHerramientas", {
                data: results[0],
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.editarImagenHerramienta = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM herramienta WHERE codigo_herramienta = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("editImgInventarioHerramientas", {
                login: true,
                name: req.session.name,
                role: req.session.role,
                data: results[0],
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.editarImagenHerramientaSend = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const imgName = req.file.filename;
      const codigoH = req.body.codigoH;
      const id = codigoH;
      req.getConnection((error, conn) => {
        conn.query(
          " UPDATE herramienta SET ? WHERE codigo_herramienta = ? ",
          [
            {
              img: imgName,
            },
            id,
          ],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              console.log("ingreso correcto", results);
              res.render("menu1InventarioHerramientas", {
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
controller.delateHerramientaInvetario = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "DELETE FROM herramienta WHERE codigo_herramienta= ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.redirect("/inventarioHerramientasRedline");
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
// pasar a a salida de herramientas o entrada

controller.sacarInventarioHerramientas = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM herramienta WHERE codigo_herramienta = ? ;",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              const dataH = results[0];
              req.getConnection((error, conn) => {
                conn.query(
                  "SELECT id, miembro FROM cuadrillas;",
                  (error, results) => {
                    if (error) {
                      console.log(error);
                    } else {
                      console.log({
                        data: results[0],
                        dataH: dataH,
                        login: true,
                        name: req.session.name,
                        role: req.session.role,
                      });
                      res.render("sacarInventarioPHerraminetas", {
                        data: results,
                        dataH: dataH,
                        login: true,
                        name: req.session.name,
                        role: req.session.role,
                      });
                    }
                  }
                );
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.sacarInventarioHerramientasSend = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const estado = "P";
      const codigoH = req.body.codigoH;
      const descripcion = req.body.descripcion;
      const nombreH = req.body.nombre;
      const id_tecnico = req.body.id_tecnico;
      const fecha = req.body.fecha;
      const id = codigoH;
      req.getConnection((error, conn) => {
        conn.query(
          "UPDATE herramienta SET ? WHERE codigo_herramienta = ? ",
          [
            {
              id_tecnico: id_tecnico,
              estado: estado,
              fecha: fecha,
            },
            id,
          ],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              req.getConnection((error, conn) => {
                conn.query(
                  "INSERT INTO logs_inventario_herramientas SET ?",
                  {
                    id_herramienta: id,
                    herramienta: nombreH,
                    descripción_reportada: descripcion,
                    fecha: fecha,
                    tecnico: id_tecnico,
                  },
                  (error, results) => {
                    if (error) {
                      console.log(error);
                    } else {
                      res.redirect("/inventarioHerramientasPRedline");
                    }
                  }
                );
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.redirect("/login");
  }
};

controller.devolverInventarioHerramientasSend = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const estado = "B";
      const codigoH = req.body.codigoH;
      const descripcion = req.body.descripcion;
      const nombreH = req.body.nombre;
      const id_tecnico = req.body.id_tecnico;
      const fecha = req.body.fecha;
      const id = codigoH;
      req.getConnection((error, conn) => {
        conn.query(
          "UPDATE herramienta SET ? WHERE codigo_herramienta = ? ",
          [
            {
              id_tecnico: 999999999,
              estado: estado,
              descripcion: descripcion,
              fecha: fecha,
            },
            id,
          ],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              req.getConnection((error, conn) => {
                conn.query(
                  "INSERT INTO logs_inventario_herramientas SET ?",
                  {
                    id_herramienta: id,
                    herramienta: nombreH,
                    descripción_reportada: descripcion,
                    fecha: fecha,
                    tecnico: id_tecnico,
                  },
                  (error, results) => {
                    if (error) {
                      console.log(error);
                    } else {
                      res.redirect("/inventarioHerramientasNPRedline");
                    }
                  }
                );
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.redirect("/login");
  }
};

controller.devolverInventarioHerramientas = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM herramienta WHERE codigo_herramienta = ? ;",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              const dataH = results[0];
              req.getConnection((error, conn) => {
                conn.query(
                  "SELECT id, miembro FROM cuadrillas;",
                  (error, results) => {
                    if (error) {
                      console.log(error);
                    } else {
                      console.log({
                        data: results[0],
                        dataH: dataH,
                        login: true,
                        name: req.session.name,
                        role: req.session.role,
                      });
                      res.render("devolverInventarioH", {
                        data: results,
                        dataH: dataH,
                        login: true,
                        name: req.session.name,
                        role: req.session.role,
                      });
                    }
                  }
                );
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

//tecnicos register
controller.registrarTecnico = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin") {
      req.getConnection((error, conn) => {
        conn.query("SELECT * FROM cuadrillas", (error, results) => {
          if (error) {
            console.log(error);
          } else {
            res.render("tableTecnicoGeneral", {
              results: results,
              login: true,
              name: req.session.name,
              role: req.session.role,
            });
          }
        });
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.tecnicoEditTable = (req, res) => {
  const id = req.params.id;
  if (req.session.loggedin) {
    if (req.session.role == "admin") {
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM cuadrillas WHERE id = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              console.log(results);
              res.render("editTecnicoRegister", {
                data: results[0],
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
controller.tecnicoEditSendTable = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin") {
      const id = req.body.id;
      const name = req.body.nombre;
      const correo = req.body.correo;
      const cedula = req.body.cedula;
      const celular = req.body.celular;

      req.getConnection((error, conn) => {
        conn.query(
          "UPDATE cuadrillas SET ? WHERE id = ?",
          [{ miembro: name, correo: correo, cc: cedula, celular: celular }, id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.redirect("/registerTecnico");
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.redirect("/login");
  }
};
controller.TableNewTecnico = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin") {
      res.render("newTecnicoTable", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    } else {
      res.render("login", {
        login: false,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.TableNewTecnicoSend = async (req, res) => {
  const name = req.body.nombre;
  const correo = req.body.correo;
  const cedula = req.body.cedula;
  const celular = req.body.celular;
  req.getConnection((error, conn) => {
    conn.query(
      "INSERT INTO cuadrillas SET ?",
      { miembro: name, correo: correo, cc: cedula, celular: celular },
      async (error, results) => {
        if (error) {
          console.log(error);
          res.render("newUserTele", {
            alert: true,
            alertTitle: "Ups hubo algun problema",
            alertMessage:
              "por favor revise correctamente la informacion y si este error continua vuelve a intentarlo mas tarde ten en cuenta que si el usuario ya esta creado no lo podras agregar",
            alertIcon: "error",
            showConfirmButton: true,
            ruta: "registerNewTecnicoRedline",
            timer: 15000,
          });
        } else {
          res.render("newUserTele", {
            alert: true,
            alertTitle: "Registrado",
            alertMessage: "Registro de tecnico Exitoso",
            alertIcon: "success",
            showConfirmButton: true,
            ruta: "registerTecnico",
            timer: 15000,
          });
        }
      }
    );
  });
};
controller.TableNewTecnicoDelate = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "DELETE FROM cuadrillas WHERE id= ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.redirect("/registerTecnico");
            }
          }
        );
      });
    }
  }
};
// inventario de consumibles

controller.InventarioCTable1 = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      req.getConnection((error, conn) => {
        conn.query("SELECT * FROM consumibles ", (error, results) => {
          if (error) {
            console.log(error);
          } else {
            res.render("inventarioc1", {
              results: results,
              login: true,
              name: req.session.name,
              role: req.session.role,
            });
          }
        });
      });
    } else {
      res.render("home", {
        login: true,
      });
    }
  } else {
    res.redirect("/login");
  }
};

controller.newInventoriC = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      res.render("newInventarioC1", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    } else {
      res.render("home", {
        login: true,
      });
    }
  } else {
    res.redirect("/login");
  }
};

controller.newInventoriCSend = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id_consumibles = req.body.id_consumibles;
      const name = req.body.nombre;
      const cantidad = req.body.cantidad;
      const cantidad_min = req.body.cantidad_min;
      const precio_compra = req.body.precio_compra;
      const medida = req.body.metrajeTotal;
      const unidad_paquete = req.body.unidad_paquete;
      const tipo_medida = req.body.tipo_medida;
      const cantidad_semanal = req.body.cantidad_semanal;
      const fecha = req.body.fecha;

      if (tipo_medida == "U") {
        const precio_unida = precio_compra / cantidad;
        console.log(precio_unida);
        req.getConnection((error, conn) => {
          conn.query(
            "INSERT INTO consumibles SET ?",
            {
              id_consumibles: id_consumibles,
              nombre: name,
              cantidad: cantidad,
              cantidad_min: cantidad_min,
              precio_compra: precio_compra,
              precio_unidad: precio_unida,
              tipo_unidad: tipo_medida,
            },
            async (error, results) => {
              if (error) {
                console.log(error);
                res.render("newInventarioC1", {
                  alert: true,
                  alertTitle: "Ups hubo algun problema",
                  alertMessage:
                    "por favor revise correctamente la informacion y si este error continua vuelve a intentarlo mas tarde ten en cuenta que si el id del producto ya esta creado no lo podras agregar",
                  alertIcon: "error",
                  showConfirmButton: true,
                  ruta: "inventarioConsumiblesnewConsumibleRedline",
                  timer: 15000,
                });
              } else {
                req.getConnection(() => {
                  conn.query(
                    "INSERT INTO logs_inventario_consumibles SET ? ",
                    {
                      objeto: name,
                      fecha: fecha,
                      cantidad_anterior: cantidad,
                      cantidad_actual: cantidad,
                      cantidad_nueva_ingresada: cantidad,
                      id_consumibles: id_consumibles,
                    },
                    (error, results) => {
                      if (error) {
                        console.log(error);
                      } else {
                        res.render("newInventarioC1", {
                          alert: true,
                          alertTitle: "Registrado",
                          alertMessage:
                            "Registro de nuevo producto exitoso Exitosa",
                          alertIcon: "success",
                          showConfirmButton: true,
                          ruta: "inventarioConsumiblesRedline",
                          timer: 15000,
                        });
                      }
                    }
                  );
                });
              }
            }
          );
        });
      } else if (tipo_medida == "M") {
        const cantidad2 = medida * cantidad;
        const precio_unida = precio_compra / cantidad2;
        console.log(precio_unida);
        req.getConnection((error, conn) => {
          conn.query(
            "INSERT INTO consumibles SET ?",
            {
              id_consumibles: id_consumibles,
              nombre: name,
              cantidad: cantidad2,
              cantidad_min: cantidad_min,
              precio_compra: precio_compra,
              precio_unidad: precio_unida,
              tipo_unidad: tipo_medida,
            },
            async (error, results) => {
              if (error) {
                console.log(error);
                res.render("newInventarioC1", {
                  alert: true,
                  alertTitle: "Ups hubo algun problema",
                  alertMessage:
                    "por favor revise correctamente la informacion y si este error continua vuelve a intentarlo mas tarde ten en cuenta que si el id del producto ya esta creado no lo podras agregar",
                  alertIcon: "error",
                  showConfirmButton: true,
                  ruta: "inventarioConsumiblesnewConsumibleRedline",
                  timer: 15000,
                });
              } else {
                req.getConnection(() => {
                  conn.query(
                    "INSERT INTO logs_inventario_consumibles SET ? ",
                    {
                      objeto: name,
                      fecha: fecha,
                      cantidad_anterior: cantidad2,
                      cantidad_actual: cantidad2,
                      cantidad_nueva_ingresada: cantidad2,
                      id_consumibles: id_consumibles,
                    },
                    (error, results) => {
                      if (error) {
                        console.log(error);
                      } else {
                        res.render("newInventarioC1", {
                          alert: true,
                          alertTitle: "Registrado",
                          alertMessage:
                            "Registro de nuevo producto exitoso Exitosa",
                          alertIcon: "success",
                          showConfirmButton: true,
                          ruta: "inventarioConsumiblesRedline",
                          timer: 15000,
                        });
                      }
                    }
                  );
                });
              }
            }
          );
        });
      } else if (tipo_medida == "P") {
        const precio_unida = precio_compra / (cantidad * unidad_paquete);
        const cantidad2 = cantidad * unidad_paquete;
        console.log(precio_unida);
        req.getConnection((error, conn) => {
          conn.query(
            "INSERT INTO consumibles SET ?",
            {
              id_consumibles: id_consumibles,
              nombre: name,
              cantidad: cantidad * unidad_paquete,
              cantidad_min: cantidad_min,
              precio_compra: precio_compra,
              precio_unidad: precio_unida,
              tipo_unidad: tipo_medida,
            },
            async (error, results) => {
              if (error) {
                console.log(error);
                res.render("newInventarioC1", {
                  alert: true,
                  alertTitle: "Ups hubo algun problema",
                  alertMessage:
                    "por favor revise correctamente la informacion y si este error continua vuelve a intentarlo mas tarde ten en cuenta que si el id del producto ya esta creado no lo podras agregar",
                  alertIcon: "error",
                  showConfirmButton: true,
                  ruta: "inventarioConsumiblesnewConsumibleRedline",
                  timer: 15000,
                });
              } else {
                req.getConnection(() => {
                  conn.query(
                    "INSERT INTO logs_inventario_consumibles SET ? ",
                    {
                      objeto: name,
                      fecha: fecha,
                      cantidad_anterior: cantidad2,
                      cantidad_actual: cantidad2,
                      cantidad_nueva_ingresada: cantidad2,
                      id_consumibles: id_consumibles,
                    },
                    (error, results) => {
                      if (error) {
                        console.log(error);
                      } else {
                        res.render("newInventarioC1", {
                          alert: true,
                          alertTitle: "Registrado",
                          alertMessage:
                            "Registro de nuevo producto exitoso Exitosa",
                          alertIcon: "success",
                          showConfirmButton: true,
                          ruta: "inventarioConsumiblesRedline",
                          timer: 15000,
                        });
                      }
                    }
                  );
                });
              }
            }
          );
        });
      } else {
        res.render("newInventarioC1", {
          alert: true,
          alertTitle: "Ups hubo algun problema",
          alertMessage:
            "no ingresaste ningun tipo de metrica lo que causo que sus datos no se puedan ingresar",
          alertIcon: "error",
          showConfirmButton: true,
          ruta: "inventarioConsumiblesnewConsumibleRedline",
          timer: 15000,
        });
      }
    }
  }
};

controller.ingresarInventarioConsumibles = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM consumibles WHERE id = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              console.log(results);
              res.render("ingresarInventarioConsumibles1", {
                data: results[0],
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    }
  }
};

controller.ingresarInventarioConsumiblesSend = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const nombre = req.body.nombre;
      const id = req.body.id;
      const id_consumibles = req.body.id_consumibles;
      const cantidad_vieja = parseFloat(req.body.cantidad);
      const precio_compra_viejo = parseFloat(req.body.precio_compra);
      const precio_compra_nuevo = parseFloat(req.body.precio_compra_nuevo);
      const cantidad_nueva = parseFloat(req.body.cantidad_nueva);
      const tipo_unidad = req.body.tipo_unidad;
      const metraje = parseFloat(req.body.metraje);
      const unidad_paquete = parseFloat(req.body.unidades_paquetes);
      const fecha = req.body.fecha;

      if (tipo_unidad == "U") {
        const cantidad = cantidad_vieja + cantidad_nueva;
        const precio_compra = precio_compra_viejo + precio_compra_nuevo;
        const precio_unida = precio_compra / cantidad;
        req.getConnection((error, conn) => {
          conn.query(
            "UPDATE consumibles SET ? WHERE id = ?",
            [
              {
                cantidad: cantidad,
                precio_compra: precio_compra,
                precio_unidad: precio_unida,
              },
              id,
            ],
            (error, results) => {
              if (error) {
                console.log(error);
              } else {
                req.getConnection(() => {
                  conn.query(
                    "INSERT INTO logs_inventario_consumibles SET ? ",
                    {
                      objeto: nombre,
                      fecha: fecha,
                      cantidad_anterior: cantidad_vieja,
                      cantidad_actual: cantidad,
                      cantidad_nueva_ingresada: cantidad_nueva,
                      id_consumibles: id_consumibles,
                    },
                    (error, results) => {
                      if (error) {
                        console.log(error);
                      } else {
                        res.redirect("/inventarioConsumiblesRedline");
                      }
                    }
                  );
                });
              }
            }
          );
        });
      } else if (tipo_unidad == "M") {
        const precio_compra = precio_compra_viejo + precio_compra_nuevo;
        const cantidad = cantidad_nueva * metraje + cantidad_vieja;
        const precio_unida = precio_compra / cantidad;
        const cantidad_ingreso = cantidad_nueva * metraje;
        console.log(precio_unida);
        req.getConnection((error, conn) => {
          conn.query(
            "UPDATE consumibles SET ? WHERE id = ?",
            [
              {
                cantidad: cantidad,
                precio_compra: precio_compra,
                precio_unidad: precio_unida,
              },
              id,
            ],
            (error, results) => {
              if (error) {
                console.log(error);
              } else {
                req.getConnection(() => {
                  conn.query(
                    "INSERT INTO logs_inventario_consumibles SET ? ",
                    {
                      objeto: nombre,
                      fecha: fecha,
                      cantidad_anterior: cantidad_vieja,
                      cantidad_actual: cantidad,
                      cantidad_nueva_ingresada: cantidad_ingreso,
                      id_consumibles: id_consumibles,
                    },
                    (error, results) => {
                      if (error) {
                        console.log(error);
                      } else {
                        res.redirect("/inventarioConsumiblesRedline");
                      }
                    }
                  );
                });
              }
            }
          );
        });
      } else if (tipo_unidad == "P") {
        const precio_compra = precio_compra_viejo + precio_compra_nuevo;
        const cantidad = cantidad_nueva * unidad_paquete + cantidad_vieja;
        const precio_unida = precio_compra / cantidad;
        const cantidad_ingreso = cantidad_nueva * unidad_paquete;
        req.getConnection((error, conn) => {
          conn.query(
            "UPDATE consumibles SET ? WHERE id = ?",
            [
              {
                cantidad: cantidad,
                precio_compra: precio_compra,
                precio_unidad: precio_unida,
              },
              id,
            ],
            (error, results) => {
              if (error) {
                console.log(error);
              } else {
                req.getConnection(() => {
                  conn.query(
                    "INSERT INTO logs_inventario_consumibles SET ? ",
                    {
                      objeto: nombre,
                      fecha: fecha,
                      cantidad_anterior: cantidad_vieja,
                      cantidad_actual: cantidad,
                      cantidad_nueva_ingresada: cantidad_ingreso,
                      id_consumibles: id_consumibles,
                    },
                    (error, results) => {
                      if (error) {
                        console.log(error);
                      } else {
                        res.redirect("/inventarioConsumiblesRedline");
                      }
                    }
                  );
                });
              }
            }
          );
        });
      }
    } else {
      res.redirect("/home");
    }
  } else {
    res.redirect("/login");
  }
};

controller.sacarInventarioConsumiblesRedline = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM consumibles WHERE id = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              console.log(results);
              res.render("sacarInvemtarioConsumibles1", {
                data: results[0],
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.redirect("/login");
  }
};

controller.sacarInventarioConsumiblesSendRedline = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      //nombre de la cuenta del usuario que inicio seccion y qie tiene aceso a este apartado
      const nameUser = req.body.name;
      //id de los productos
      const nombre = req.body.nombre;
      const id = req.body.id;
      const id_consumibles = req.body.id_consumibles;
      //precio de los productos
      const precio_venta = parseFloat(req.body.precio_compra);
      const precio_unidad = parseFloat(req.body.precio_unidad);
      // unidades
      const cantidad_vieja = parseFloat(req.body.cantidad);
      const cantidad_retirada = parseFloat(req.body.cantidad_retirada);
      const metraje = parseFloat(req.body.metraje);
      const unidad_paquete = parseFloat(req.body.unidades_paquetes);
      //inportante
      const tipo_unidad = req.body.tipo_unidad;
      const fecha = req.body.fecha;

      if (tipo_unidad == "U") {
        const precio_total_retiro = precio_unidad * cantidad_retirada;
        const precio_actual = precio_venta - precio_total_retiro;
        console.log(precio_total_retiro);
        console.log(precio_actual);
        const cantidad = cantidad_vieja - cantidad_retirada;
        const precio_unidad_nuevo = unidad(precio_actual, cantidad);
        req.getConnection((error, conn) => {
          conn.query(
            "UPDATE consumibles SET ? WHERE id = ?",
            [
              {
                cantidad: cantidad,
                precio_compra: precio_actual,
                precio_unidad: precio_unidad_nuevo,
              },
              id,
            ],
            (error, results) => {
              if (error) {
                console.log(error);
              } else {
                req.getConnection(() => {
                  conn.query(
                    "INSERT INTO logs_inventario_consumibles_2 SET ? ",
                    {
                      objeto: nombre,
                      fecha: fecha,
                      cantidad_anterior: cantidad_vieja,
                      cantidad_actual: cantidad,
                      cantidad_retirada: cantidad_retirada,
                      id_consumibles: id_consumibles,
                      precio_total_antes: precio_venta,
                      precio_total_despues: precio_actual,
                      precio_gasto: precio_total_retiro,
                      quien_retiro: nameUser,
                    },
                    (error, results) => {
                      if (error) {
                        console.log(error);
                      } else {
                        res.redirect("/inventarioConsumiblesRedline");
                      }
                    }
                  );
                });
              }
            }
          );
        });
      } else if (tipo_unidad == "M") {
        const precio_total_retiro = precio_unidad * metraje;
        const precio_actual = precio_venta - precio_total_retiro;
        console.log(precio_total_retiro);
        console.log(precio_actual);
        const cantidad = cantidad_vieja - metraje;
        const precio_unidad_nuevo = unidad(precio_actual, cantidad);
        req.getConnection((error, conn) => {
          conn.query(
            "UPDATE consumibles SET ? WHERE id = ?",
            [
              {
                cantidad: cantidad,
                precio_compra: precio_actual,
                precio_unidad: precio_unidad_nuevo,
              },
              id,
            ],
            (error, results) => {
              if (error) {
                console.log(error);
              } else {
                req.getConnection(() => {
                  conn.query(
                    "INSERT INTO logs_inventario_consumibles_2 SET ? ",
                    {
                      objeto: nombre,
                      fecha: fecha,
                      cantidad_anterior: cantidad_vieja,
                      cantidad_actual: cantidad,
                      cantidad_retirada: metraje,
                      id_consumibles: id_consumibles,
                      precio_total_antes: precio_venta,
                      precio_total_despues: precio_actual,
                      precio_gasto: precio_total_retiro,
                      quien_retiro: nameUser,
                    },
                    (error, results) => {
                      if (error) {
                        console.log(error);
                      } else {
                        res.redirect("/inventarioConsumiblesRedline");
                      }
                    }
                  );
                });
              }
            }
          );
        });
      } else if (tipo_unidad == "P") {
        const precio_total_retiro = precio_unidad * unidad_paquete;
        const precio_actual = precio_venta - precio_total_retiro;
        console.log(precio_total_retiro);
        console.log(precio_actual);
        const cantidad = cantidad_vieja - unidad_paquete;
        const precio_unidad_nuevo = unidad(precio_actual, cantidad);
        req.getConnection((error, conn) => {
          conn.query(
            "UPDATE consumibles SET ? WHERE id = ?",
            [
              {
                cantidad: cantidad,
                precio_compra: precio_actual,
                precio_unidad: precio_unidad_nuevo,
              },
              id,
            ],
            (error, results) => {
              if (error) {
                console.log(error);
              } else {
                req.getConnection(() => {
                  conn.query(
                    "INSERT INTO logs_inventario_consumibles_2 SET ? ",
                    {
                      objeto: nombre,
                      fecha: fecha,
                      cantidad_anterior: cantidad_vieja,
                      cantidad_actual: cantidad,
                      cantidad_retirada: unidad_paquete,
                      id_consumibles: id_consumibles,
                      precio_total_antes: precio_venta,
                      precio_total_despues: precio_actual,
                      precio_gasto: precio_total_retiro,
                      quien_retiro: nameUser,
                    },
                    (error, results) => {
                      if (error) {
                        console.log(error);
                      } else {
                        res.redirect("/inventarioConsumiblesRedline");
                      }
                    }
                  );
                });
              }
            }
          );
        });
      }
    } else {
      res.redirect("/home");
    }
  } else {
    res.redirect("/login");
  }
};

controller.informacionProductoInventarioC = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM consumibles WHERE id = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              const data = results[0];
              console.log(results);
              const id_consumibles = results[0].id_consumibles;
              console.log(results[0].id_consumibles);
              function compararHoras(fecha1, fecha2) {
                var now = moment(fecha1); //todays date
                var end = moment(fecha2); // another date
                var duration = moment.duration(now.diff(end));
                var days = duration.asDays();
                return days;
              }
              req.getConnection((error, conn) => {
                conn.query(
                  "SELECT fecha FROM logs_inventario_consumibles WHERE id=(SELECT max(id) FROM logs_inventario_consumibles WHERE id_consumibles = ?);",
                  [id_consumibles],
                  (error, results) => {
                    if (error) {
                      console.log(error);
                    } else {
                      const fecha_max = results[0].fecha;

                      req.getConnection((error, conn) => {
                        conn.query(
                          "SELECT fecha FROM logs_inventario_consumibles WHERE id=(SELECT min(id) FROM logs_inventario_consumibles WHERE id_consumibles = ?);",
                          [id_consumibles],
                          (error, results) => {
                            if (error) {
                              console.log(error);
                            } else {
                              const fecha_min = results[0].fecha;
                              console.log(compararHoras(fecha_max, fecha_min));

                              const fecha_new = compararHoras(
                                fecha_max,
                                fecha_min
                              );
                              req.getConnection((error, conn) => {
                                conn.query(
                                  "SELECT SUM(cantidad_nueva_ingresada)AS suma FROM logs_inventario_consumibles WHERE id_consumibles = ?;",
                                  [id_consumibles],
                                  (error, results) => {
                                    if (error) {
                                      console.log(error);
                                    } else {
                                      const diasApro =
                                        results[0].suma / fecha_new;
                                      // const diasApro = diasApro1.toFixed(0)
                                      console.log(diasApro.toFixed(0));
                                      res.render(
                                        "informacionProductoInventarioC",
                                        {
                                          data: data,
                                          login: true,
                                          name: req.session.name,
                                          role: req.session.role,
                                          dias: diasApro,
                                        }
                                      );
                                    }
                                  }
                                );
                              });
                            }
                          }
                        );
                      });
                    }
                  }
                );
              });
            }
          }
        );
      });
    }
  }
};

controller.editInventarioC1 = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM consumibles WHERE id = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              console.log(results);
              res.render("editInventoriConsumible", {
                data: results[0],
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    }
  }
};
function unidad(precio_compra, cantidad) {
  if (cantidad == 0) {
    let precio_unidad = 0;
    return precio_unidad;
  } else if (cantidad > 0) {
    let precio_unidad = precio_compra / cantidad;
    return precio_unidad;
  }
  return precio_unidad;
}

controller.editInventarioC1Send = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.body.id;
      const id_consumibles = req.body.id_consumibles;
      const name = req.body.nombre;
      const cantidad = req.body.cantidad;
      const cantidad_min = req.body.cantidad_min;
      const precio_compra = req.body.precio_compra;

      req.getConnection((error, conn) => {
        conn.query(
          "UPDATE consumibles SET ? WHERE id = ?",
          [
            {
              nombre: name,
              id_consumibles: id_consumibles,
              cantidad: cantidad,
              cantidad_min: cantidad_min,
              precio_compra: precio_compra,
              precio_unidad: unidad(precio_compra, cantidad),
            },
            id,
          ],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              console.log("se realizo el envio de datos ");
              res.redirect("/inventarioConsumiblesRedline");
            }
          }
        );
      });
    }
  }
};

controller.delateConsumibleInvetario = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "DELETE FROM consumibles WHERE id= ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.redirect("/inventarioConsumiblesRedline");
            }
          }
        );
      });
    }
  }
};

//zona de pruebas
controller.pruebas = (req, res) => {
  function compararHoras(fecha1, fecha2) {
    var now = moment(fecha1); //todays date
    var end = moment(fecha2); // another date
    var duration = moment.duration(now.diff(end));
    var days = duration.asDays();
    return days;
  }
  req.getConnection((error, conn) => {
    conn.query(
      "SELECT fecha FROM logs_inventario_consumibles WHERE id=(SELECT max(id) FROM logs_inventario_consumibles WHERE id_consumibles = 'GUL70')",
      (error, results) => {
        if (error) {
          console.log(error);
        } else {
          const fecha_max = results[0].fecha;

          req.getConnection((error, conn) => {
            conn.query(
              "SELECT fecha FROM logs_inventario_consumibles WHERE id=(SELECT min(id) FROM logs_inventario_consumibles WHERE id_consumibles = 'GUL70')",
              (error, results) => {
                if (error) {
                  console.log(error);
                } else {
                  const fecha_min = results[0].fecha;
                  console.log(compararHoras(fecha_max, fecha_min));

                  const fecha_new = compararHoras(fecha_max, fecha_min);
                  req.getConnection((error, conn) => {
                    conn.query(
                      "SELECT SUM(cantidad_nueva_ingresada)AS suma FROM logs_inventario_consumibles WHERE id_consumibles = 'GUL70';",
                      (error, results) => {
                        if (error) {
                          console.log(error);
                        } else {
                          const diasApro1 = results[0].suma / fecha_new;
                          const diasApro = diasApro1.toFixed(0);
                          console.log(diasApro.toFixed(0));
                          res.render("pruebas2", {
                            dias: diasApro,
                          });
                        }
                      }
                    );
                  });
                }
              }
            );
          });
        }
      }
    );
  });
};

//inventario de equipo de seguridad
controller.menuInventoryEQ1 = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      res.render("menu1InventarioEquipoSeguridad", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.equipoPrestadasInventario = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM equipo_seguridad WHERE estado = 'P'",
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("inventario2EquipoSeguridad", {
                results: results,
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
controller.equipoNoPrestadosInventario = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM equipo_seguridad WHERE estado = 'B'",
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("inventario1EquipoSeguridad", {
                results: results,
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
controller.quienMeTieneEQ1 = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.body.id;
      const nameE1 = req.body.nameEQ;
      const codigoE1 = req.body.codigoEQ;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM `cuadrillas` WHERE id = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              console.log(results);
              res.render("quienMeTieneES1", {
                results: results,
                nameE1: nameE1,
                codigoE1: codigoE1,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
// envio de correos
controller.sendCorreEQ1 = async (req, res) => {
  const correo = req.body.correo;
  const name = req.body.nombre;
  const name_equipo = req.body.nombre_equipo;
  const codigoEQ = req.body.codigo_equipo;
  var transporter = nodemailer.createTransport({
    host: "smtp.gmail.com",
    port: 587,
    secure: false,
    auth: {
      user: "maisanmailer@gmail.com",
      pass: "231215maisanmailer",
    },
  });
  var mailOptions = {
    from: "Remitente",
    to: correo,
    subject: "Por favor debuelva el equipo ",
    html:
      `<!DOCTYPE html>
        <html lang="es">
        <head>
            <meta charset="utf-8">
            <title>holi</title>
        </head>
        <body style="background-color: white ">
        
        <!--Copia desde aquí-->
        <table style="max-width: 600px; padding: 10px; margin:0 auto; border-collapse: collapse;">
            <tr>
            <td style="background-color: #ecf0f1; text-align: left; padding: 0; display: inline-block; ">
            <div style="display: inline-block;" >
                <a href="https://redline.net.co/" >
                    <img width="20%" style="display:inline-block; margin: 1.5% 3%" src="https://redline.net.co/wp-content/uploads/2020/01/cropped-LOGOREDLINE-2.png">
                </a>
                <a href="https://github.com/flipgamership" >
                    <img width="10%" style="display:inline-block; margin: 2% 3%" src="https://lh3.googleusercontent.com/Qm964MvlThDWpO2G8sD2B339Z3Y1WPUuddC4dJpWjwhlrleLdxVmRypBTLxuXOtWofe6lopRd4r1BiBf_bHf1ZBweMLrBaP-jiHwWEulIRre_47CRDS4Anx2-JX0NMZLMLsNK5EO6Ztfd9ywb1ZsGYtF_oCFrZAikAUH3hj8OXD2V4jwFE4HZwj-m4NgDN7kYgSrSGH7M4TjaXuvmLcHAETa_x8kkBR7P8A2i3UQbBNVVGJeLN9mEOqWKcw2dGatg19-9CD-FNRaTBYi8sLLKybKP2ptpXnCfIbs2n1IW2LAEthVuZP-I3hlbpVw4LgJjXvxVvsgPn09DdotCahjMcGeuDjHJC7ZQFxRJZyvPM5g4ZOKGV8GzolzQdUFXuGFOyFqMpNAxQjcKdofi-J1RALPD9FAn4qRP47LNPdreMCwFwWITFDRGtrLO6qnPUPNjFjGFFGklVTcw67qtvw1WWLG7yeUjipm2j1wlTwz6v3zy3EXLLfzNWEOW9QkQ-wIOQe1C5-wbZ6Yt4eaCkIz0P4zLB58fkMt_2SNJJ6rRyfqvor58owEAxobsOlo8txPNE-Ck3_cVoCMpizPbSC57xe1rOEqrHE8C-M6CwT4RKlXBCIoxV32SHRD40hkVvmiELJIOW-F72zNow2vYtNAjnmYCxz6kglFZY70iR5OaBkzPtNqYnu9s-iKHqtdM2swmAdi63TXdBfrZ8LT4ghQAks=w603-h438-no?authuser=0">
                </a>
            </div>
            
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
                            <li>Equipo de seguridad: </li>
                            <p style="color: #eebbf8; margin-top: 3px; margin-left: 2px; text-align: center;">
                            ` +
                            name_equipo +
                            `
                            </p>
                            
                            <li>Codigo del equipo de seguridad: </li>
                            <p style="color: #eebbf8; margin-top: 3px; margin-left: 2px; text-align: center;">
                            ` +
                            codigoEQ +
                            `
                            </p>
                            
                            <li>¿Quien me tiene?</li>
                            <p style="color: #eebbf8; margin-top: 3px; margin-left: 2px; text-align: center;">
                            ` +
                            name +
                            `
                            </p>
                            
      
      
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
        
        `,
  };
  const info = await transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.log(error);
    } else {
      console.log("mail enviado");
      res.redirect("/inventoriTableEquipoSeguridadPrestadoRedline");
    }
  });
};
controller.agregarNewEquipoSeguridadNewEInventario = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "tecnico" || req.session.role == "admin") {
      res.render("newEquipoSeguridadInventario", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.agregarNewEquipoSeguridadInventarioSend = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "tecnico" || req.session.role == "admin") {
      const file = req.file;
      const imgName = file.filename;
      const name = req.body.nombre;
      const codigoEQ = req.body.codigoEQ;
      const estado = req.body.estado;
      const descripcion = req.body.descripcion;
      const fecha = req.body.fecha;
      const id_tecnico = req.body.id_tecnico;
      req.getConnection((error, conn) => {
        conn.query(
          "INSERT INTO equipo_seguridad SET ?",
          {
            id: codigoEQ,
            img: imgName,
            nombre: name,
            estado: estado,
            descripcion: descripcion,
            fecha: fecha,
            id_tecnico: id_tecnico,
          },
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              console.log("ingreso correcto");
              res.redirect("/inventoriTableEquipoSeguridadNoPrestadoRedline");
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.editarEquipoSeguridadInventario = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role) {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM equipo_seguridad WHERE id = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("editInventorioEquipoSeguridad", {
                data: results[0],
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.editarEquipoSeguridadInventarioSend = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "tecnico" || req.session.role == "admin") {
      const name = req.body.nombre;
      const id = req.body.codigoEQ;
      const estado = req.body.estado;
      const descripcion = req.body.descripcion;
      const fecha = req.body.fecha;
      const id_tecnico = req.body.id_tecnico;
      req.getConnection((error, conn) => {
        conn.query(
          "UPDATE equipo_seguridad SET ? WHERE id = ?;",
          [{ nombre: name, descripcion: descripcion, estado: estado }, id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("menu1InventarioEquipoSeguridad", {
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.redirect("/home");
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.editarImagenEquipoSeguridad = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM equipo_seguridad WHERE id = ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.render("editImgInventarioEquipoSeguridad", {
                login: true,
                name: req.session.name,
                role: req.session.role,
                data: results[0],
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.editarImagenEquipoSeguridadSend = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const imgName = req.file.filename;
      const codigoEQ = req.body.codigoEQ;
      const id = codigoEQ;
      req.getConnection((error, conn) => {
        conn.query(
          " UPDATE equipo_seguridad SET ? WHERE id = ? ",
          [
            {
              img: imgName,
            },
            id,
          ],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              console.log("ingreso correcto", results);
              res.render("menu1InventarioEquipoSeguridad", {
                login: true,
                name: req.session.name,
                role: req.session.role,
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
controller.delateEquipoSeguridadInvetario = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "DELETE FROM equipo_seguridad WHERE id= ?",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              res.redirect("/menuInventarioEquipoSeduridadRedline");
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};
// pasar a a salida de herramientas o entrada

controller.sacarInventarioEquipoSeguridad = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM equipo_seguridad WHERE id = ? ;",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              const dataH = results[0];
              req.getConnection((error, conn) => {
                conn.query(
                  "SELECT id, miembro FROM cuadrillas;",
                  (error, results) => {
                    if (error) {
                      console.log(error);
                    } else {
                      console.log({
                        data: results[0],
                        dataH: dataH,
                        login: true,
                        name: req.session.name,
                        role: req.session.role,
                      });
                      res.render("sacarInventarioPEquipoSeguridad", {
                        data: results,
                        dataH: dataH,
                        login: true,
                        name: req.session.name,
                        role: req.session.role,
                      });
                    }
                  }
                );
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.sacarInventarioEquipoSeguridadSend = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const estado = "P";
      const id = req.body.codigoEQ;
      const descripcion = req.body.descripcion;
      const nombreE = req.body.nombre;
      const id_tecnico = req.body.id_tecnico;
      const fecha = req.body.fecha;
      req.getConnection((error, conn) => {
        conn.query(
          "UPDATE equipo_seguridad SET ? WHERE id = ? ",
          [
            {
              id_tecnico: id_tecnico,
              estado: estado,
              fecha: fecha,
            },
            id,
          ],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              req.getConnection((error, conn) => {
                conn.query(
                  "INSERT INTO logs_inventario_equipo_seguridad SET ?",
                  {
                    id_equipo_seguridad: id,
                    equipo_seguridad: nombreE,
                    descripción_reportada: descripcion,
                    fecha: fecha,
                    tecnico: id_tecnico,
                  },
                  (error, results) => {
                    if (error) {
                      console.log(error);
                    } else {
                      res.redirect(
                        "/inventoriTableEquipoSeguridadPrestadoRedline"
                      );
                    }
                  }
                );
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.redirect("/login");
  }
};

controller.devolverInventarioEquipoSeguridadSend = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const estado = "B";
      const codigoH = req.body.codigoEQ;
      const descripcion = req.body.descripcion;
      const nombreH = req.body.nombre;
      const id_tecnico = req.body.id_tecnico;
      const fecha = req.body.fecha;
      const id = codigoH;
      req.getConnection((error, conn) => {
        conn.query(
          "UPDATE equipo_seguridad SET ? WHERE id = ? ",
          [
            {
              id_tecnico: 999999999,
              estado: estado,
              descripcion: descripcion,
              fecha: fecha,
            },
            id,
          ],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              req.getConnection((error, conn) => {
                conn.query(
                  "INSERT INTO logs_inventario_herramientas SET ?",
                  {
                    id_herramienta: id,
                    herramienta: nombreH,
                    descripción_reportada: descripcion,
                    fecha: fecha,
                    tecnico: id_tecnico,
                  },
                  (error, results) => {
                    if (error) {
                      console.log(error);
                    } else {
                      res.redirect("/inventoriTableEquipoSeguridadNoPrestadoRedline");
                    }
                  }
                );
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.redirect("/login");
  }
};

controller.devolverInventarioEquipoSeguridad = (req, res) => {
  if (req.session.loggedin) {
    if (req.session.role == "admin" || req.session.role == "tecnico") {
      const id = req.params.id;
      req.getConnection((error, conn) => {
        conn.query(
          "SELECT * FROM equipo_seguridad WHERE id = ? ;",
          [id],
          (error, results) => {
            if (error) {
              console.log(error);
            } else {
              const dataH = results[0];
              req.getConnection((error, conn) => {
                conn.query(
                  "SELECT id, miembro FROM cuadrillas;",
                  (error, results) => {
                    if (error) {
                      console.log(error);
                    } else {
                      console.log({
                        data: results[0],
                        dataH: dataH,
                        login: true,
                        name: req.session.name,
                        role: req.session.role,
                      });
                      res.render("devolverInventarioEquipoSeguridad", {
                        data: results,
                        dataH: dataH,
                        login: true,
                        name: req.session.name,
                        role: req.session.role,
                      });
                    }
                  }
                );
              });
            }
          }
        );
      });
    } else {
      res.render("home", {
        login: true,
        name: req.session.name,
        role: req.session.role,
      });
    }
  } else {
    res.render("login", {
      login: false,
    });
  }
};

controller.img = (req, res) => {
  const file = req.file;
  const imgName = file.filename;
  const name = req.body.nombre;
  const codigoH = req.body.codigoH;
  const estado = req.body.estado;
  const descripcion = req.body.descripcion;
  const fecha = req.body.fecha;
  const id_tecnico = req.body.id_tecnico;
  req.getConnection((error, conn) => {
    conn.query(
      "INSERT INTO herramienta SET ?",
      {
        codigo_herramienta: codigoH,
        img: imgName,
        nombre: name,
        estado: estado,
        descripcion: descripcion,
        fecha: fecha,
        id_tecnico: id_tecnico,
      },
      (error, results) => {
        if (error) {
          console.log(error);
        } else {
          console.log("ingreso correcto");
          // res.render('menu1InventarioHerramientas', {
          //   login: true,
          //   name: req.session.name,
          //   role: req.session.role,
          // })
        }
      }
    );
  });
};

controller.disaing = (req, res) => {
  res.render("menuEstadisticasReportDia", {
    login: true,
    name: req.session.name,
    role: req.session.role,
  });
};

module.exports = controller;
