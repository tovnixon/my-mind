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
class ComponentContain {
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
class myDrink {
    let name: String
    var components = [ComponentContain]()
    init(name: String, components : [ComponentContain]) {
        self.name = name
        self.components = components
    }
}

protocol CMachineProtocol {
    func letsMakeDrink(_ drink: myDrink) -> Bool
    func addSomeComponent(_ some: MyCoffeeComponentType) -> Bool
    func canMakeADrink(_ drink: myDrink) -> Bool
    func hasEnoughComponentOfType(_ type: ComponentContain) -> Bool
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
    
    func hasEnoughComponentOfType(_ type: ComponentContain) -> Bool {
        for components in availableComponents {
            if components.volume < type.minvol {
                print("not enough")
                return false
            }
        }
        print("enough")
        return true
    }
    
    
    func canMakeADrink(_ drink: myDrink) -> Bool {
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
    
    
    
    func letsMakeDrink(_ drink: myDrink) -> Bool {
        if canMakeADrink(drink) {
            for drinkComponent in drink.components {
                let machineComponent = getComponentByType(drinkComponent.type)
                machineComponent?.removeVolume(drinkComponent.volume)
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



