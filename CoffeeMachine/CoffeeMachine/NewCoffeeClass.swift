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

struct MyCoffeeMachine: CoffeeMachineProtocol, CoffeeComponents, Measurable {
   
    enum Drink{
        case americano
        case capuchino
        
    var waterNeeded : Int {
        switch self {
        case .americano: return 20
        case .capuchino: return 0
      
        }
    }
    var beansNeeded : Int {
        switch self {
        case .americano: return 20
        case .capuchino: return 20
   
        }
    }
    var milkNeeded : Int {
        switch  self {
        case .americano: return 0
        case .capuchino: return 30
      
    }
}
    
    }

    func addComponents(_ components: CoffeeComponents) -> Bool {
        <#code#>
    }
    
    func makeDrink(_ drink: Drink) -> String {
        <#code#>
    }
    
    
    var type: CoffeeComponentsType
    
    var value: Int
}
