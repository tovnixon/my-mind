//
//  NewCoffeeClass.swift
//  CoffeeMachine
//
//  Created by Anna Oksanichenko on 22.09.2020.
//  Copyright © 2020 Anna Oksanichenko. All rights reserved.
//

import Foundation



enum CoffeeComponentsType{
    case water
    case milk
    case beans
    
}

enum Drink{
    case ameriсano
    case capuchino
    
    
}

protocol Measurable {
    var value : Int { get }
}

protocol CoffeeComponents {
    var type: CoffeeComponentsType{ get }
}

protocol CoffeeMachineProtocol {
    func addComponents(_ components: CoffeeComponents) -> Bool
    func makeDrink(_ drink: Drink) -> String
}




class MyCoffeeMachine : CoffeeMachineProtocol {
    
    var initialMilkAmount = 50
    var initialCoffeAmaount = 50
    var initialWater =  50
    
    
    
    
    func makeDrink(_ drink: Drink) -> String {
        if(drink == Drink.ameriсano) {
            print("amerikano")
        }
        return ""
    }
    
    func addComponents(_ components: CoffeeComponents) -> Bool {
        return false
    }

    
}
