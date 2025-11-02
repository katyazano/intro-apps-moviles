// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

struct ejecutivo{
    var idEmpleado: Int?
    var nombre: String?
    var puesto: String?
    var contraseña: String?
}

struct cliente{
    var idUser: Int?
    var apP: String? 
    var apM: String? 
    var nombre: String? 
    var numCuenta: String? 
    var tipoCliente: Int?
    var fechaNac: String?
    var rfc: String? 
    var saldo: Double?
    var añoVenc: Int?
    var nip: Int? 
    var contraseña: String?
}

var op = 0
var dbClientes: [cliente] = [] //crea arreglo
let ejecutivo1 = ejecutivo(idEmpleado: 1, nombre: "Juan Perez", puesto: "Gerente", contraseña: "admin")

func loginEjecutivo(dbClientes: inout [cliente]) {
    print("Ingresa tu número de empleado: ")
    guard let idInputStr = readLine(), let idInput = Int(idInputStr) else {
        print("ID inválido.")
        return
    }
    print("Ingresa tu contraseña: ")
    guard let passwordInput = readLine() else {
        print("Contraseña inválida.")
        return
    }

    // Ejemplo simple de autenticación
    if idInput == ejecutivo1.idEmpleado && passwordInput == ejecutivo1.contraseña {
        print("Autenticación exitosa.")
        ejecutarEjecutivo(dbClientes: &dbClientes)
    } else {
        print("Credenciales incorrectas. Intente de nuevo.")
    }
}

func generarNumCuenta() -> String {
    let numeros = "1234567890"
    return String((0..<4).map { _ in numeros.randomElement()! })
}

func generarHomoclave() -> String {
    let caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<3).map { _ in caracteres.randomElement()! })
}

func generarAñoVencimiento() -> Int {
    Calendar.current.component(.year, from: Date()) + 3
}

func ejecutarEjecutivo(dbClientes: inout [cliente]){
    print("cuantos clientes quieres agregar: ")
    
    guard let entradaCant = readLine(), let cantInt = Int(entradaCant) else {
        print("Entrada inválida.")
        return
    }
    if cantInt > 0{
        dbClientes = Array(repeating: cliente(), count: cantInt) //inicializa arreglo
        for i in 0...cantInt-1{
            print("Ingresa el apellido paterno:")
            dbClientes[i].apP = readLine()
            let paterno = Array(dbClientes[i].apP ?? "")

            print("Ingresa el apellido materno:")
            dbClientes[i].apM = readLine()
            let materno = Array(dbClientes[i].apM ?? "")

            print("ingresa tu nombre: ")
            dbClientes[i].nombre = readLine()
            let name = Array(dbClientes[i].nombre ?? "")

            // Asigna un número de cuenta aleatorio de 4 dígitos
            dbClientes[i].numCuenta = generarNumCuenta()

            print("""
            Selecciona el tipo de cliente:
            1. Cliente
            2. Clásico
            3. VIP
            """)
            if let entradaTipo = readLine(), let tipo = Int(entradaTipo) {
                dbClientes[i].tipoCliente = tipo
            } else {
                print("Entrada inválida. Se guardará como nulo.")
            }

            print("Ingresa la fecha de nacimiento (dd/mm/aaaa):")
            dbClientes[i].fechaNac = readLine()
            let fecha = Array(dbClientes[i].fechaNac ?? "")

            // creamos RFC a partir de los datos dados
            let v1 = (fecha.count >= 6 ? String(fecha[8]) + String(fecha[9]) + String(fecha[3]) + String(fecha[4]) + String(fecha[0]) + String(fecha[1]):"XXXXXX")
            dbClientes[i].rfc=(paterno.count > 1 ? String(paterno[0]) + String(paterno[1]) :"XX") + (materno.count > 0 ? String(materno[0]):"X") + (name.count > 0 ? String(name[0]):"X") + v1 + generarHomoclave()
                

            print("Ingresa el saldo actual:")
            if let entradaSaldo = readLine(), let saldoDouble = Double(entradaSaldo) {
                dbClientes[i].saldo = saldoDouble
            } else {
                print("Entrada inválida. Se guardará como nulo.")
            }

            // asigna año de vencimiento
            dbClientes[i].añoVenc = generarAñoVencimiento()

            print("Ingresa el NIP:")
            if let entradaNIP = readLine(), let nipInt = Int(entradaNIP) {
                dbClientes[i].nip = nipInt
            } else {
                print("Entrada inválida. Se guardará como nulo.")
            }

            print("ingresa la contraseña: ")
            dbClientes[i].contraseña = readLine()
            let password = Array(dbClientes[i].contraseña ?? "")

            print("registro exitoso, num de cliente: ", i)
                
            // asigna id de usuario
            dbClientes[i].idUser = i      
        }
        print("ingresa el # de cliente: ")
        if let cant = readLine(), let optBuscar = Int(cant){
            if optBuscar >= 0 && optBuscar < cantInt{
                print("nombre completo: \(dbClientes[optBuscar].nombre ?? "no hay registro") \(dbClientes[optBuscar].apP ?? "") \(dbClientes[optBuscar].apM ?? "")")
                print("numero de cuenta: \(dbClientes[optBuscar].numCuenta ?? "n/a")") 
                switch dbClientes[optBuscar].tipoCliente{
                    case 1:
                        print("Tipo de cliente: Cliente")
                    case 2:
                        print("Tipo de cliente: Clasico")
                    case 3:
                        print("Tipo de cliente: VIP")
                    default:
                        print("No especificado")
                }
                print("fecha de nacimiento: \(dbClientes[optBuscar].fechaNac ?? "n/a")")
                print("rfc:  \(dbClientes[optBuscar].rfc ?? "n/a")")
                print("saldo: $\(dbClientes[optBuscar].saldo ?? 0.0)")
                print("año de vencimiento: \(dbClientes[optBuscar].añoVenc ?? 0)")
                print("NIP: ****")
            } else{
                print("id inexistente")
            }
        } else{
            print("no fue un numero")    
        }
    }else{
        print("error, no puede ser menor a 0")
            
    }
}

func loginCliente(dbClientes: [cliente]) -> Bool {
    print("Ingresa tu número de cliente:")
    guard let idStr = readLine(), let id = Int(idStr), id < dbClientes.count else {
        print("ID inválido.")
        return false
    }

    print("Ingresa tu contraseña:")
    guard let password = readLine() else {
        print("Contraseña inválida.")
        return false
    }

    if password == dbClientes[id].contraseña {
        print("Bienvenido \(dbClientes[id].nombre ?? "usuario")" )
        return true
    } else {
        print("Credenciales incorrectas.")
        return false
    }
}

repeat {
    print("""
    \nBienvenido al sistema de Banco
    Selecciona una opción:
    1. Ejecutivo
    2. Usuario
    3. Salir
    """)
    
    guard let entrada = readLine(), let opcion = Int(entrada) else {
        print("Entrada inválida. Intente de nuevo.")
        continue
    }
    op = opcion
    switch opcion {
        case 1:
        print("Modo Ejecutivo")
        loginEjecutivo(dbClientes: &dbClientes)
            
        case 2:
        print("Modo Usuario")
        var opUsuario = 0
        repeat {
            print("""
            Selecciona una opción:
            1. Cliente
            2. Cuenta habiente
            3. Salir
            """)
            guard let entradaUser = readLine(), let opcionUser = Int(entradaUser) else {
            print("Entrada inválida. Intente de nuevo.")
            continue
            }
            opUsuario = opcionUser
            switch opcionUser {
            case 1:
                var opCliente = 0
                repeat {
                    print("""
                    Menú Cliente:
                    1. Depositar
                    2. Pagar servicios
                    3. Salir
                    """)
                    guard let entradaCliente = readLine(), let opcionCliente = Int(entradaCliente) else {
                        print("Entrada inválida. Intente de nuevo.")
                        continue
                    }
                    opCliente = opcionCliente
                        switch opcionCliente {
                        case 1:
                            print("Ingresa la cantidad a depositar: ")
                        case 2:
                            print("Ingresa el servicio a pagar: ")
                        case 3:
                            print("Saliendo del modo cliente...")
                        default:
                            print("Opción inválida. Intente de nuevo.")
                        }
                        
                    } while opCliente != 3
                        
                case 2:
                    if loginCliente(dbClientes: dbClientes) {
                        var opCuenta = true
                        repeat {
                            print("""
                            \nMenú Cuenta Habiente:
                            1. Depositar
                            2. Retirar
                            3. Consultar saldo
                            4. Transferir
                            5. Salir
                            """)
                            if let entradaCuenta = readLine(), let opcionCuenta = Int(entradaCuenta) {
                                switch opcionCuenta {
                                case 1:
                                    print("Ingresa la cantidad a depositar: ")
                                case 2:
                                    print("Ingresa la cantidad a retirar: ")
                                case 3:
                                    print("Tu saldo es: $XXXX")
                                case 4:
                                    print("Ingresa la cuenta a transferir: ")
                                case 5:
                                    opCuenta = false
                                    print("Saliendo del modo cuenta habiente...")
                                default:
                                    print("Opción inválida. Intente de nuevo.")
                                }
                            } else {
                                print("Entrada inválida. Intente de nuevo.")
                            }
                        } while opCuenta
                    } else {
                        print("Fallo en el inicio de sesión. Regresando al menú anterior.")
                    }
                        
                case 3:
                    print("Saliendo del modo usuario...")
                default:
                    print("Opción inválida. Intente de nuevo.")
                }
        } while opUsuario != 3
            
        case 3:
            print("Saliendo del sistema...")
            
        default:
            print("Opción inválida. Intente de nuevo.")
        }
} while op != 3