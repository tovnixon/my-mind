//
//  OneMoreCoffeeClass.swift
//  CoffeeMachine
//
//  Created by Anna Oksanichenko on 22.09.2020.
//  Copyright © 2020 Anna Oksanichenko. All rights reserved.
//

import Foundation
/* кофе машина содержит  воду, кофе и молоко
 напиток содержит кофе, воду и молоко
 кофе машина умеет готовить напиток
 */

enum MyCoffeeComponentType {
    case water, milk, beans
}

// у компонента есть тип и обьем
class ComponentContain : Equatable {
    static func == (lhs: ComponentContain, rhs: ComponentContain) -> Bool {
        return lhs.type == rhs.type
    }
    
    var type : MyCoffeeComponentType
    var volume : Int
    var minvol = 20
    
    init(type: MyCoffeeComponentType, volume: Int) {
        self.type = type
        self.volume = volume
    }
    
    func addVolume(_ extraVol: Int) {
        volume += extraVol
    }
    func removeVolume(_ extraVol: Int) {
        volume -= extraVol
    }
}

//у напитка есть имя и компоненты
class MyDrink {
    let name: String
    var components = [ComponentContain]()
    init(name: String, components : [ComponentContain]) {
        self.name = name
        self.components = components
    }
}

class DrinkFactory {
    class func getAmericano() -> MyDrink {
        let americano = MyDrink(name: "americano", components: [ComponentContain(type: .beans, volume: 20), ComponentContain(type: .water, volume: 25)])
        return americano
    }
    
    class func getLatte() -> MyDrink {
        let latte = MyDrink(name: "latte", components: [ComponentContain(type: .beans, volume: 30), ComponentContain(type: .milk, volume: 45)])
        return latte
    }
    
    class func getCapuchino() -> MyDrink {
        let capuchino = MyDrink(name: "capuchino", components: [ComponentContain(type: .beans, volume: 25), ComponentContain(type: .milk, volume: 25), ComponentContain(type: .water, volume: 20)])
        return capuchino
    }
}

protocol CMachineProtocol {
    func letsMakeDrink(_ drink: MyDrink) -> Bool
    func addSomeComponent(_ some: MyCoffeeComponentType) -> Bool
    func canMakeADrink(_ drink: MyDrink) -> Bool
    func hasEnoughComponentOfType(_ type: MyCoffeeComponentType) -> Bool
    func refreshTrash() -> Int
}

class CMachine: CMachineProtocol {
    
    // изначально кофе машина не заполнена
    let valueForAdd : Int = 100
    var availableComponents = [ComponentContain]()
    var trash = 0
    var trashCapacity = 50
    var message = ""
    
    init() {
        availableComponents.append(ComponentContain(type: .beans, volume: 100))
        availableComponents.append(ComponentContain(type: .milk, volume: 100))
        availableComponents.append(ComponentContain(type: .water, volume: 100))
        
    }
    func getComponentByType(_ type: MyCoffeeComponentType) -> ComponentContain? {
        for component in availableComponents {
            if component.type == type {
                return component
            }
        }
        return nil
    }
    
    func addSomeComponent(_ some: MyCoffeeComponentType) -> Bool {
        let component : ComponentContain = getComponentByType(some)!
        component.addVolume(valueForAdd)
        message = "Component \(some) added"
        
        return true
        
    }
    
    func hasEnoughComponentOfType(_ type: MyCoffeeComponentType) -> Bool {
        for component in availableComponents {
            if component.type == type {
                return component.volume >= component.minvol
            }
        }
        return false
    }
    
    
    func canMakeADrink(_ drink: MyDrink) -> Bool {
        for drinkComponent in drink.components {
            if let machineComponent = getComponentByType(drinkComponent.type) {
                if machineComponent.volume < drinkComponent.volume {
                    message = "Not enough \(String(describing: machineComponent.type))"
                    return false
                }
            }
        }
        if trash >= trashCapacity {
            message = "Refresh trash"
            return false
        }
        message = "Let`s make a drink!"
        return true
    }
    
    
    
    func letsMakeDrink(_ drink: MyDrink) -> Bool {
        if canMakeADrink(drink) {
            for drinkComponent in drink.components {
                let machineComponent = getComponentByType(drinkComponent.type)
                machineComponent?.removeVolume(drinkComponent.volume)
                print(machineComponent?.type, machineComponent?.volume)
            }
        }
        if let component = drink.components.filter({$0.type == .beans}).first {
            trash += component.volume
        }
        message = "Here is your \(drink.name), bro"
        return true
    }
    
    func refreshTrash() -> Int {
        let value = trash - trash
        message = "Value of trash: \(value)"
        return value
    }
    
}



