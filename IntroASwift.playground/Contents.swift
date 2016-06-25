/*: Playground - noun: a place where people can play
Con los dos puntos ¨:¨ Se puede generar documentación del tipo Markdown
 # Intro a Swift
 */
import Foundation


var str = "Hello, playground"


//: ## Variables y constantes
var size : Float = 44.0
//: Se suele recomendar omitir el tipo en variables y constantes, si se puede inferir.
var answer = 44

//: Constante: Por lo general habrá que usar constantes cuando una vble no cambia de valor.
let name = "Anakin"

//: ## Todo es un objeto
Int.max
Double.abs(-55.0)

//: ## Conversiones
let a = Int(size)
let ans = String(answer)

//: ## typealias: sirve para dar otros nombre a un tipo
typealias Integer = Int

let a1 : Integer = 42

//: ## Colecciones
var swift = "Nuevo lenguaje de Apple"
swift = swift + "!"

var words = ["uno","dos","tres", "cuatro"]
words[0]

let numberNames = [1:"one", 2:"two"]
numberNames[2]

//: ## Iterar
var total = ""
for element in [1,2,3,4,5,6,7,8,9]{
    total = "\(total) \(element)"
}
print(total)

for (key, value) in numberNames{
    print("\(key) -- \(value)")
}

//: Tipo tupla o Tuple:
let pair = (1,"one")
pair.0
pair.1

//: Tipo Range:
for i in 1...5{
    print(i)
}

for i in 1..<5{
    print(i)
}

//: ## Funciones

func h(a:Int, b:Int) -> Int {
    return (a + b) * a
}

h(3,b: 4)

// Función con ambos nombes externos. Recomendado porque se pueden usar los parámetros externos para dar información sobre ellos.
func hConNombresExternos(extA a:Int,extB b:Int) -> Int {
    return (a + b) * a
}
hConNombresExternos(extA:2, extB:5)

// función sin nombres externos:
// Se usa la variable anónima _. Esto se usa cuando no nos interesa ese valor.
func f(a:Int,_ b:Int) -> Int {
    return (a + b) * a
}

f(4,5)

func sum(a:Int,_ b:Int,thenMultiplyBy c:Int) -> Int {
    return (a + b) * c
}

sum(3, 4, thenMultiplyBy: 5)

func r(a:Int, par b:Int, par c:Int) -> Int {
    return a+b+c
}
r(3, par: 4, par: 6)


// Default values
func addSuffixTo(a:String, suffix:String="ingly")->String{
    return a + suffix
}

addSuffixTo("accord")
addSuffixTo("Objective-", suffix: "C")

// Return values y pattern matching
func namesOfNumbers(a:Int) -> (Int,String,String){
    var val: (Int, String, String)
    switch a {
    case 1:
        val = (1, "one", "uno")
    case 2:
        val = (2, "two", "dos")
    default:
        val = (a, "Go Check Google translator", "Vete a Google")
    }
    return val
}

let r = namesOfNumbers(2)
let (_, en, es) = namesOfNumbers(1)

en
es
(en, es)


//: Funciones de alto nivel

typealias IntToIntFunc = (Int)->Int
var z: IntToIntFunc

// Funciones como parámetro
func apply(f: IntToIntFunc, n: Int) -> Int{
    return f(n)
}

func doubler(a:Int) -> Int {
    return a * 2
}

func add42(a: Int) -> Int {
    return a + 42
}

apply(doubler,n: 4)

// Funciones como valores de retorno

func compose(f: IntToIntFunc, _ h: IntToIntFunc) -> IntToIntFunc {
    //funcions dentro de funciones??
    func comp(a:Int) -> Int{
        return f(h(a))
    }
    return comp
}

compose(add42, doubler)(8)

let comp = compose(add42, doubler)

comp(6)


//Funciones de un mismo tipo, en un array

let funcs = [add42, doubler, comp]

for f in funcs{
    f(33)
    
}


//: ## Closure Syntax (representación literal de funciones

func g(a:Int) -> Int{
    return a + 42
}

//exactamente igual a...
let gg = {(a:Int) -> Int in
    return a + 42
}

g(1)
gg(1)


// Sintaxis simplificada de clausuras

let closures = [g,
                {(a:Int) -> Int in return a - 42},
                {a in return a + 45},
                {a in a/42},
                {$0 * 42}]

//: Operadores: son clausuras

typealias BinaryFunc = (Int, Int)->Int
let applier = {(f:BinaryFunc, m:Int, n:Int) ->Int
    in
    return f(m,n)}

applier(*,2,4)


// Trailing closure
func applierInv(m: Int,_ n: Int, f: BinaryFunc) -> Int{
    return applier(f,m,n)
}

let c = applierInv(2, 4, f: {$0 * 2 + $1 * 3})

// 100% equivalente a:
let cc = applierInv(2, 4){
    return $0 * 2 + $1 * 3
}

//: ## Optionals

// empaqueto algo dentro de un opcional
var maybeAString: String? = "I'm boxed!"
var maybeAnInt: Int?

print(maybeAString)
print(maybeAnInt)

// desempaquetado seguro
if let certainlyAString = maybeAString{
    print("Ya te decía yo que era una cadena, joé")
    print(certainlyAString)
}

// desempaquetado por cojones
//  Da un error, así que lo dejo comentado
//var allaVoy = maybeAnInt!



//: Aggregate types: enums, structs, classes, tuples.

enum LightSabreColor{
    case Blue, Red, Green, Purple
}

struct LightSabre {
    //Static or "class" property (stored property)
    static let quote = "An elegant weapon for a more civilized time"
    
    //Instance properties
    var color: LightSabreColor = .Blue {
        //Property observer (computed property)
        willSet(newValue){ //es como un setter
            print("About to change color to \(newValue)")
        }
    }
    
    var isDoubleBladed = false
    
}

class Jedi {
    //Si puedes dar valor por defecto, hazlo
    //Si no, crea un init
    //Sólo usa opcionalies cuando sea indispensables.
    //No uses "!" a no ser que sepas lo que estás haciendo
    
    
    //Stored property
    var lighSabre = LightSabre(color: .Blue, isDoubleBladed: false)
    
    var name : String
    var midichlorians = 1_000
    
    var master  :Jedi?
    var padawan :Jedi?
    
    // computed property
    var fullName : String{
        get{
            var full = ""
            
            if let master = master{
                full = full + "padawan of \(master.name)"
            }
            return full
        }
    }
    
    //Inicializadores
    // de conveniencia
    init(name : String, midichlorians : Int, lightSabre : LightSabre, master : Jedi?, padawan : Jedi?){
        
        // Usando pattern matching y mirando al tendío
        (self.name,self.midichlorians, self.lighSabre) = (name, midichlorians, lighSabre)
        
        //El resto en plan normal
        self.master = master
        self.padawan = padawan
    }
    
    //Inicializadores de conveniencia. Tienen que llamar a los Inicializadores designados siempre.
    convenience init(name:String){
        self.init(name:name, midichlorians: 1000,
                  lightSabre: LightSabre(), master: nil, padawan: nil)
    }
    
    convenience init(masterName name: String){
        self.init(name:name, midichlorians: 10_000,
                  lightSabre: LightSabre(color: .Green, isDoubleBladed: false),
                  master: nil, padawan: nil)
    }

    // Regular method
    func totalMidichlorians() -> Int {
        var total = midichlorians
        
        //Optional Chaining
        if let masterMidichlorians = master?.midichlorians{
            total = total + masterMidichlorians
        }
        return total
    }
    
}

let luke = Jedi(masterName: "Luke Skywalker")

// *** Ejercicio: Intentar implementar el protocolo CustomStringConvertible.

//Inheritance
class Sith: Jedi{
    convenience init (sithName name:String){
        self.init(name: name, midichlorians: 1000,
                  lightSabre: LightSabre(color: .Red, isDoubleBladed: true),
                  master: nil, padawan: nil)
    }
}


//: Extensions
typealias Euro = Double

extension Euro{
    var €: Double {
        return self
    }
    var $: Double {
        return self * 0.75
    }
}

var totalEuros = 123.€ + 45.09.$

typealias Task = ()->()
extension Int{
    func times(task: Task) {
        for _ in 1...self{
            task()
        }
    }
}

4.times{
    print("My name is Groot")
}




//: Nil y la tupla que lo parió

//2-tuples
(2,"hola")

// tuplas dentro de tuplas
(45, ("Hola", NSDate()),45)

//¿Hay 1-tupla?
// NO
(2) == 2

//¿Qué pasa con la 0-tupla?
// representa a nil

func p(){
    print("Hola mundo")
}

func pp()->(){
    print ("hola mundo")
}


//: Averiguar el tipo de una clase en tiempo de ejecución
49.9.dynamicType


//: ## Gestión de errores
// Palabrejas: try, throw, throws, catch, do

//Toda función que pueda generar un error, está marcada con throw
//Toda función que lanza un error, se llama con try

func inverse(n: Double) throws -> Double {
    
    guard n != 0 else{
        throw NSError(domain:"División por cero", code: 42, userInfo: nil)
    }
    
    return 1 / n
}

do{

    let inv = try inverse(42)
}
catch{
    print("La cagamos!")
}


//Variaciones dentro del try
//Ejecuta por huevos, si da error, se cae la app. Mejor no usar
try! inverse(4)

// Ejecuta y si da error, devuelve un nil. No se cae la App.
try? inverse(0)






























































































