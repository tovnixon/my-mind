//
//  EnotherCoffeeFile.swift
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
class NewComponents{
    var water : Int
    var milk : Int
    var beans : Int
    
    init(water: Int, milk: Int, beans : Int) {
        self.water = water
        self.milk = milk
        self.beans = beans
    }
}


class NewDrink{
    let name: String
    let components : NewComponents
    init(name: String, components: NewComponents) {
        self.components = components
        self.name = name
    }
}


protocol CMProtocol {
    func newMakeDrink(drink: NewDrink)->String
}


class NewCoffeeMachin: CMProtocol {
    let components : NewComponents
    
    init(components: NewComponents) {
        self.components = components
    }
    
    func newMakeDrink(drink: NewDrink) -> String{
        if components.beans < drink.components.beans { return "Not enough beans" }
        if components.water < drink.components.water {return "Not enough water"}
        if components.milk < drink.components.milk {return "Not enough milk"}
        components.beans -= drink.components.beans
        components.water -= drink.components.water
        components.milk -= drink.components.milk
        return "Here is your \(drink.name), bro"
}
    
    func addComponent(some: NewComponents){
        
    }
    
    
}

var myCF = NewCoffeeMachin(components: NewComponents(water: 100, milk: 100, beans: 100))

    var americ = NewDrink(name: "americano", components: NewComponents(water: 20, milk: 0, beans: 20))
    var latte = NewDrink(name: "latte", components: NewComponents(water: 10, milk: 20, beans: 20))
    var espres = NewDrink(name: "espresso", components: NewComponents(water: 10, milk: 0, beans: 10))
