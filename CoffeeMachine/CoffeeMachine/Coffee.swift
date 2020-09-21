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
          milk = 50
          print("Milk \(milk)")
          return "Milk \(milk)"
      }
    func clearTrash() -> String {
          trash = 0
          print("Trash \(0)")
          return "Trash \(0)"
      }

    func makeAmericano() -> String {
        let americano = Drink.americano
        if water < americano.waterNeeded {
            print("Not enough water")
            return "not enough water"
        } else if coffeeBeans < americano.beansNeeded {
            print("Not enough beans")
            return "not enough beans"
        } else if trash > 60 {
            print("Clear trash")
            return "Clear trash"
        }
        water -= americano.waterNeeded
        coffeeBeans -= americano.beansNeeded
        trash += americano.beansNeeded
        print("Americano, sir")
        return "Americano, sir"
    }
    
    func makeCapuchino() -> String {
        let capuchino = Drink.capuchino
        if milk < capuchino.milkNeeded {
            print("Not enough milk")
            return "not enough milk"
        } else if coffeeBeans < capuchino.beansNeeded {
            print("Not enough beans")
            return "not enough beans"
        } else if trash > 60 {
            print("Clear trash")
            return "Clear trash"
        }
        milk -= capuchino.milkNeeded
        coffeeBeans -= capuchino.beansNeeded
        trash += capuchino.beansNeeded
        print("Capuchino, sir")
        return "Capuchino, sir"
    }
    
    enum Drink {
        case americano, capuchino
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


}
