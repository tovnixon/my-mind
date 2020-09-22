//
//  Coffee.swift
//  CoffeeMachine
//
//  Created by Anna Oksanichenko on 02.09.2020.
//  Copyright © 2020 Anna Oksanichenko. All rights reserved.
//

import Foundation


//enum CoffeeComponentsType {
//    case water
//    case milk
//    case beans
//}
//
//enum Drink{
//    case ameriano
//    case capuchino
//}
//
//protocol Measurable {
//    var value : Int { get }
//}
//
//protocol CoffeeComponents {
//    var type: CoffeeComponentsType{ get }
//}
//
//protocol CoffeeMachineProtocol {
//    func addComponents(_ components: CoffeeComponents) -> Bool
//    func makeDrink(_ drink: Drink) -> String
//}

//class CoffeeMachine: CoffeeMachineProtocol,CoffeeComponents, Measurable {
//    func addComponents(_ components: CoffeeComponents) -> Bool {
//        <#code#>
//    }
//
//    func makeDrink(_ drink: Drink) -> String {
//        <#code#>
//    }
//
//    var type: CoffeeComponentsType
//
//    var value: Int
//}


class CoffeeMachine {
    enum Drink {
        case americano, capuchino, something
        var waterNeeded : Int {
            switch self {
            case .americano: return 20
            case .capuchino: return 0
            case .something: return 0
            }
        }
        var beansNeeded : Int {
            switch self {
            case .americano: return 20
            case .capuchino: return 20
            case .something: return 0
            }
        }
        var milkNeeded : Int {
            switch  self {
            case .americano: return 0
            case .capuchino: return 30
            case .something: return 0
        }
    }
        
        
    }
    
    
    var water = 10 {
        didSet {
            if water <= 0 {
                water = oldValue
                print("Add water")
            }
        }
    }
    var coffeeBeans = 10 {
        didSet {
            if coffeeBeans <= 0 {
                coffeeBeans = oldValue
                print("Add beans")
            }
        }
    }
    var milk = 10 {
        didSet {
            if milk <= 0 {
                milk = oldValue
                print("Add milk")
            }
        }
    }
    var trash = 0
    let trashCapacity = 60
    
    func addWater() -> String {
        water = 50
        print("Water \(water)")
        return "Water \(water)"
    }
    func addBeans() -> String {
        coffeeBeans = 50
        print("Beans \(coffeeBeans)")
        return "Beans \(coffeeBeans)"
    }
    func addMilk() -> String {
          milk = 60
          print("Milk \(milk)")
          return "Milk \(milk)"
      }
    func clearTrash() -> String {
          trash = 0
          print("Trash \(0)")
          return "Trash \(0)"
      }

    func makesomeDrink(drink: Drink)-> String{
        var someDrink = Drink.something
        if drink  == Drink.americano {
            someDrink = Drink.americano
        } else if drink  == Drink.capuchino {
            someDrink = Drink.capuchino
        }
        if milk < someDrink.milkNeeded { return "Not enough milk" }
        if coffeeBeans < someDrink.beansNeeded {return "Not enough beans"}
        if water < someDrink .waterNeeded {return "not enough water"}
        if trash > trashCapacity {return "Clear trash"}
        milk -= someDrink.milkNeeded
        coffeeBeans -= someDrink.beansNeeded
        water -= someDrink.waterNeeded
        trash += someDrink.beansNeeded

        return "\(drink), sir"
    }
    
    


}

