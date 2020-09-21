//
//  Coffee.swift
//  CoffeeMachine
//
//  Created by Anna Oksanichenko on 02.09.2020.
//  Copyright © 2020 Anna Oksanichenko. All rights reserved.
//

import Foundation
class CoffeeMachine{
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

    func makeDrink<T>(drink: T)-> String{
        var someDrink = Drink.something
        if drink as! CoffeeMachine.Drink == Drink.americano {
            someDrink = Drink.americano
        } else if drink as! CoffeeMachine.Drink == Drink.capuchino {
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


}
