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

enum MyCoffeeComponentType{
    case water, milk, beans
   
}
// у компонента есть тип и обьем
class ComponentContain {
    var type: MyCoffeeComponentType
    var volume : Int
    var minvol = 20
    init(type: MyCoffeeComponentType, volume: Int) {
        self.type = type
        self.volume = volume
    }
    
    func addVolume(extraVol: Int){
        volume += extraVol
    }
    func removeVolume(extraVol: Int){
        volume -= extraVol
    }
}

//у напитка есть имя и компоненты
class myDrink{
    let name: String
    var components = [ComponentContain]()
    init(name: String, components : [ComponentContain]) {
        self.name = name
       self.components = components
    }
}

protocol CMachineProtocol {
    func letsMakeDrink(drink: myDrink)-> String
    func addSomeComponent(some: MyCoffeeComponentType)-> String
 //   func addNewComponent<T>(some: T){}
   func canMakeADrink(drink: myDrink)->String
    func hasEnoughComponentOfType(type: ComponentContain)-> Bool
    func refreshTrash()-> String
}

class CMachine: CMachineProtocol {
   
  // изначально кофе машина не заполнена
   
    let valueForAdd = 100
    var availableComponents = [ComponentContain]()
    var trash = 0
    var trashCapacity = 50

    private func getComponentByType(_ type: MyCoffeeComponentType) -> ComponentContain? {
       for component in availableComponents {
        if component.type == type {
           return component
          }
        }
      return nil
    }
    
    
    func addSomeComponent(some: MyCoffeeComponentType)-> String{
        let component : ComponentContain = getComponentByType(some)!
        component.addVolume(extraVol: valueForAdd)
        
        return "Component \(some) added"
    }
    
    func hasEnoughComponentOfType(type: ComponentContain)-> Bool{
        
        for components in availableComponents {
            if components.volume < type.minvol {return false}
          
        }
        return true
    }
    
    
    func canMakeADrink(drink: myDrink)->String{
        for component in availableComponents {
            for c in drink.components {
                if component.volume < c.volume {
                    return "Not enough \(component)"
                }
                if trash > trashCapacity {return "Refresh trash"}
            }
        }
        return "Let`s make a drink!"
        }
        
    
    
    func letsMakeDrink(drink: myDrink)-> String{
        for component in availableComponents{
            for c in drink.components{
                component.removeVolume(extraVol: c.volume)
            }
        }
      
        let component = drink.components.filter{$0.type == .beans}.first
        trash += component!.volume
        
        return "Here is your \(drink.name), bro"
    }
    
    func refreshTrash()-> String {
        trash -= trash
        return "Value of trash: \(trash)"
    }
    
}


let NCMach = CMachine()
let espr =  myDrink(name: "esp", components: [ComponentContain.init(type: .milk, volume: 20),ComponentContain.init(type: .beans, volume: 30)])


