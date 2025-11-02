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


//arreglos
let juguetes = ["pelota", "osito", "carrito", "muñeca", "cocinita"]
var i = 0
var op = 0

for i in juguetes{
    print(juguetes)
}


for i in 0..<3{
    print(juguetes)   
}

while i<3 {
    print(juguetes[i])
    i+=1
}

repeat{
    print("di el numero de indice que quieres imprimir del 0 al 4")
    
    if let opcion = readLine() , let eleccion = Int(opcion){
        op=eleccion
        print(juguetes[op])
    }else {
        print("intenta de nuevo")
        op = 0
    }
}while op < 5 && op > -1



var op = 0

repeat {
    print("""
    Bienvenido al sistema de Banco
    Selecciona una opción:
    1. Ejecutivo
    2. Usuario
    3. Salir
    """)
    
    if let entrada = readLine(), let opcion = Int(entrada) {
        op = opcion
        switch opcion {
        case 1:
            print("Modo Ejecutivo")
            // loginEjecutivo()
            
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
                
                if let entradaUser = readLine(), let opcionUser = Int(entradaUser) {
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
                            if let entradaCliente = readLine(), let opcionCliente = Int(entradaCliente) {
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
                            } else {
                                print("Entrada inválida. Intente de nuevo.")
                            }
                        } while opCliente != 3
                        
                    case 2:
                        var opCuenta = 0
                        repeat {
                            print("""
                            Menú Cuenta Habiente:
                            1. Depositar
                            2. Retirar
                            3. Consultar saldo
                            4. Transferir
                            5. Salir
                            """)
                            if let entradaCuenta = readLine(), let opcionCuenta = Int(entradaCuenta) {
                                opCuenta = opcionCuenta
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
                                    print("Saliendo del modo cuenta habiente...")
                                default:
                                    print("Opción inválida. Intente de nuevo.")
                                }
                            } else {
                                print("Entrada inválida. Intente de nuevo.")
                            }
                        } while opCuenta != 5
                        
                    case 3:
                        print("Saliendo del modo usuario...")
                    default:
                        print("Opción inválida. Intente de nuevo.")
                    }
                } else {
                    print("Entrada inválida. Intente de nuevo.")
                }
            } while opUsuario != 3
            
        case 3:
            print("Saliendo del sistema...")
            
        default:
            print("Opción inválida. Intente de nuevo.")
        }
    } else {
        print("Entrada inválida. Intente de nuevo.")
    }
} while op != 3

//*/