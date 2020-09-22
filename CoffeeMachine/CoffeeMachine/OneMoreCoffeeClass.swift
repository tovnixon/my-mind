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

class Components{
    
    var water: Int
    var beans: Int
    var milk: Int
    init(water: Int, beans: Int, milk: Int){
        self.water = water
        self.beans = beans
        self.milk = milk
    }
}

class myDrink{
    let name: String
    var components: Components
    init(name: String, components: Components) {
        self.name = name
        self.components = components
    }
}

protocol CMachineProtocol {
    func letsMakeDrink(drink: myDrink)-> String
    func addSomeComponent(some: Components)
    func refreshTrash()-> String
}

class CMachine: CMachineProtocol {
   
    
    var components: Components
    var trash = 0
    var trashCapacity = 50
    init(components: Components) {
        self.components = components
    }
    
    func letsMakeDrink(drink: myDrink)-> String{
        if components.beans < drink.components.beans { return "Not enough beans" }
        if components.water < drink.components.water {return "Not enough water"}
        if components.milk < drink.components.milk {return "Not enough milk"}
        if trash > trashCapacity {return "Refresh trash"}
        components.beans -= drink.components.beans
        components.water -= drink.components.water
        components.milk -= drink.components.milk
        trash += drink.components.beans
        return "Here is your \(drink.name), bro"
    }
    
    func addSomeComponent(some: Components){
    }
    
    func refreshTrash()-> String {
        trash -= trash
        return "Value of trash: \(trash)"
    }
}


let NCmachine = CMachine(components: Components(water: 100, beans: 100, milk: 100))
let amer = myDrink(name: "americano", components: Components(water: 20, beans: 20, milk: 0))

