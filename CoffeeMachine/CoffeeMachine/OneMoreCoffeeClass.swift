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
    var min: Int {return 20}
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
}
// все компоненты, которые используются в приготовлении напитка
class AllComponents{
    
    var water: Int
    var beans: Int
    var milk: Int
    init(water: Int, beans: Int, milk: Int){
        self.water = water
        self.beans = beans
        self.milk = milk
    }
}
//у напитка есть имя и компоненты
class myDrink{
    let name: String
    var allComponents: AllComponents
    var components2 = [ComponentContain]()
    init(name: String, allComponents: AllComponents) {
        self.name = name
        self.allComponents = allComponents
    }
}

protocol CMachineProtocol {
    func letsMakeDrink(drink: myDrink)-> String
    func addSomeComponent(some: MyCoffeeComponentType)-> String
 //   func addNewComponent<T>(some: T){}
   func canMakeADrink(drink: myDrink)->String
    func hasEnoughComponentOfType(type: MyCoffeeComponentType)-> Bool
    func refreshTrash()-> String
}

class CMachine: CMachineProtocol {
   
  // изначально кофе машина не заполнена
    var beansRawValue = 0
    var milkRawValue = 0
    var waterRawValue = 0
    let valueForAdd = 100
    var components2 = [ComponentContain]()
  //  var allComponents: AllComponents
    
    var trash = 0
    var trashCapacity = 50
//    init(allComponents: AllComponents) {
//        self.allComponents = allComponents
//    }
//
    
    
    func addSomeComponent(some: MyCoffeeComponentType)-> String{
        switch some {
        case .beans: beansRawValue += valueForAdd
        case .milk: milkRawValue += valueForAdd
        case .water: waterRawValue += valueForAdd
        }
        return "Component \(some) added"
    }
    
    func hasEnoughComponentOfType(type: MyCoffeeComponentType)-> Bool{
//        for comp in components2{
//            if comp < comp.minvol {}
//        }
        if milkRawValue < type.min { return false }
        return true
    }
    
    func canMakeADrink(drink: myDrink)->String{
        for compon in components2{
            for c in drink.components2{
                if compon < c {
                    
                }
            }
        }
        if beansRawValue < drink.allComponents.beans { return "Not enough beans" }
        if waterRawValue < drink.allComponents.water {return "Not enough water"}
        if milkRawValue < drink.allComponents.milk {return "Not enough milk"}
        if trash > trashCapacity {return "Refresh trash"}
    }
    
    func letsMakeDrink(drink: myDrink)-> String{
        
        beansRawValue -= drink.allComponents.beans
        waterRawValue -= drink.allComponents.water
        milkRawValue -= drink.allComponents.milk
        trash += drink.allComponents.beans
        return "Here is your \(drink.name), bro"
    }
    
    func refreshTrash()-> String {
        trash -= trash
        return "Value of trash: \(trash)"
    }
    
}


let NCMach = CMachine()
let res = NCMach.hasEnoughComponentOfType(type: MyCoffeeComponentType)
// let NCMach = CMachine(allComponents: AllComponents(water: 100, beans: 100, milk: 100))
let amer = myDrink(name: "americano", allComponents: AllComponents(water: 20, beans: 20, milk: 0))
let capuch = myDrink(name: "capuchino", allComponents: AllComponents(water: 0, beans: 20, milk: 20))
