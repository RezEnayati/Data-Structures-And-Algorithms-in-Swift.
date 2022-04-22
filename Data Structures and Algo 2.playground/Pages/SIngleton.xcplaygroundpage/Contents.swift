import Foundation

let defaults = UserDefaults.standard
let sharedURLSession = URLSession.shared

class Car {
    var color = "Red"
    
    //Creating a Singleton
    static let singletonCar = Car()
}

let myCar = Car.singletonCar
myCar.color = "blue"

let yourCar = Car.singletonCar
print(yourCar.color)

class A {
    init(){
        Car.singletonCar.color = "Yellow"
    }
}

class B {
    init(){
        print(Car.singletonCar.color)
    }
}

let a = A()
let b = B()
