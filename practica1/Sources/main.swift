// The Swift Programming Language
// https://docs.swift.org/swift-book

/*
var saludo: String = "Saludos Swift"
print("\nHello, world!")
print("\n", saludo)

saludo = "Salu2 tecmi!"
print("\n", saludo)

// ejemplo de constante string
let adios: String = "adios swift"
print("\n", adios)

// ejemplo de entero
var edad: Int = 20
print("\nLa edad del profe es:", 35, "años")
print("\nMi edad es:", edad, "años")

// ejemplo de double
var dinero:  Double = 13.50
print("\nTenia $", dinero, "Pero me lo gaste y ahora tengo $", dinero-13.50, ":c")
dinero = dinero - 13.50
print("\nSi, me lo gaste!! tengo $", dinero, ":ccc")

// ejemplo de booleano
var logica: Bool = true
print(logica) //verdadero
print(!logica) //falso

// ejemplo de caracter
var caracter: Character = "@"
print("\n", caracter)

// ejemplo de flotante
var flotante: Float = 11.99
print("\n", flotante)

//actividad 5
// condicional
var nombre = "juan"
if nombre == "pedro"{
    print("el nombre es correcto")
} else{
    print("el nombre es incorrecto")   
}
// condicional boolean 
var estaLloviendo = true
if !estaLloviendo{
    print("No está lloviendo")
} else{
    print("Está lloviendo")
    
}
// condicional boolean AND
let temperatura = 70
if temperatura >= 65 && temperatura <= 75{
    print("la temperatura es correcta")
} else if temperatura < 65{
    print("está muy frio")   
} else{
    print("está muy caliente")   
}
// condicional boolean OR
if temperatura == 64 || temperatura <= 75{
    print("la temperatura es correcta")
} else if temperatura == 65{
    print("está muy frio")   
} else{
    print("está muy caliente")   
}
// switch case: puedes evaluar varios valores en un mismo caso a, b, c, d
var genero = "terror"
switch genero {
case "terror":
    print("el genero de terror es correcto")
case "comedia":
    print("el genero es incorrecto")
case "romance":
    print("el genero es incorrecto")
default:
    print("no es un genero")   
}

// como pedir inputs
print("ingresa tu nombre: ")
var name = readLine()
print ("tu nombre es: \(name!)")

*/

// arreglos
// let juguetes = ["pelota", "osito", "carrito", "muñeca", "cocinita"]
// var i = 0
// var op = 0

// for i in juguetes{
//     print(juguetes)
// }


// for i in 0..<3{
//     print(juguetes)   
// }

// while i<3 {
//     print(juguetes[i])
//     i+=1
// }

// repeat{
//     print("di el numero de indice que quieres imprimir del 0 al 4")
    
//     if let opcion = readLine() , let eleccion = Int(opcion){
//         op=eleccion
//         print(juguetes[op])
//     }else {
//         print("intenta de nuevo")
//         op = 0
//     }
// }while op < 5 && op > -1


struct cliente{
    var apP: String? 
    var apM: String? 
    var nombre: String? 
    var numCuenta: Int? 
    var tipoCliente: Int?
    var fechaNac: String?
    var rfc: String? 
    var saldo: Double?
    var añoVenc: Int?
    var nip: Int? 
}

var dbClientes: [cliente] = [] //crea arreglo

print("cuantos clientes quieren agregar: ")
if let cant = readLine(), let cantInt = Int(cant){
    if cantInt > 0{
        dbClientes = Array(repeating: cliente(), count: cantInt) //inicializa arreglo
        for i in 0...cantInt-1{
            print("Ingresa el apellido paterno:")
            dbClientes[i].apP = readLine()

            print("Ingresa el apellido materno:")
            dbClientes[i].apM = readLine()

            print("ingresa tu nombre: ")
            dbClientes[i].nombre = readLine()

            print("Ingresa el número de cuenta:")
            if let entradaNumCuenta = readLine(), let numero = Int(entradaNumCuenta) {
                dbClientes[i].numCuenta = numero
            } else {
                print("Entrada inválida. Se guardará como nulo.")
            }

            print("""
            Selecciona el tipo de cliente:
            1. Usuario
            2. Intermedio
            3. VIP
            """)
            if let entradaTipo = readLine(), let tipo = Int(entradaTipo) {
                dbClientes[i].tipoCliente = tipo
            } else {
                print("Entrada inválida. Se guardará como nulo.")
            }

            print("Ingresa la fecha de nacimiento (dd/mm/aaaa):")
            dbClientes[i].fechaNac = readLine()

            print("Ingresa el saldo actual:")
            if let entradaSaldo = readLine(), let saldoDouble = Double(entradaSaldo) {
                dbClientes[i].saldo = saldoDouble
            } else {
                print("Entrada inválida. Se guardará como nulo.")
            }

            print("Ingresa el año de vencimiento de la tarjeta:")
            if let entradaAño = readLine(), let año = Int(entradaAño) {
                dbClientes[i].añoVenc = año
            } else {
                print("Entrada inválida. Se guardará como nulo.")
            }

            print("Ingresa el NIP:")
            if let entradaNIP = readLine(), let nipInt = Int(entradaNIP) {
                dbClientes[i].nip = nipInt
            } else {
                print("Entrada inválida. Se guardará como nulo.")
            }

            print("registro exitoso, num de cliente: ", i)
        }
        print("ingresa el # de cliente: ")
        if let cant = readLine(), let optBuscar = Int(cant){
            if optBuscar >= 0 && optBuscar < cantInt{
                print("nombre completo: \(dbClientes[optBuscar].nombre ?? "no hay registro") \(dbClientes[optBuscar].apP ?? "") \(dbClientes[optBuscar].apM ?? "")")
                print("numero de cuenta: \(dbClientes[optBuscar].numCuenta ?? 0)") 
                switch dbClientes[optBuscar].tipoCliente{
                    case 1:
                        print("Tipo de cliente: Usuario")
                    case 2:
                        print("Tipo de cliente: Intermedio")
                    case 3:
                        print("Tipo de cliente: VIP")
                    default:
                        print("No especificado")
                }
                
            } else{
                print("id inexistente")
            }
        } else{
            print("no fue un numero")
            
        }
    }else{
        print("error, no puede ser menor a 0")
        
    }
}else{
    print("incorrecto intente de nuevo")   
}

