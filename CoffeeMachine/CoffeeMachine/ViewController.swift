//
//  ViewController.swift
//  CoffeeMachine
//
//  Created by Anna Oksanichenko on 02.09.2020.
//  Copyright © 2020 Anna Oksanichenko. All rights reserved.
//

import UIKit

      
class ViewController: UIViewController {
let order = CoffeeMachine()
    
    let machine = CMachine()
    
    let latte = myDrink(name: "latte", components: [ComponentContain(type: .beans, volume: 30), ComponentContain(type: .milk, volume: 30)])
    let capuch = myDrink(name: "capuchino", components: [ComponentContain(type: .beans, volume: 25), ComponentContain(type: .milk, volume: 10), ComponentContain(type: .water, volume: 40)])
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
  machine.availableComponents.append(ComponentContain(type: .beans, volume: 100))
   machine.availableComponents.append(ComponentContain(type: .milk, volume: 100))
        machine.availableComponents.append(ComponentContain(type: .water, volume: 100))
        
        
    }
    @IBAction func americanoButton(_ sender: UIButton) {
        machine.canMakeADrink(capuch)
//        label.text = order.makesomeDrink(drink: CoffeeMachine.Drink.americano)
    }
    
    @IBAction func capuchinoButton(_ sender: UIButton) {
        machine.letsMakeDrink(capuch)
     //   label.text = order.makesomeDrink(drink: CoffeeMachine.Drink.capuchino)
    }
    
    
    @IBAction func addWaterButton(_ sender: UIButton) {
        label.text = order.addWater()
    }
    
    @IBAction func addMilkButton(_ sender: UIButton) {
        label.text = order.addMilk()
    }
    
    @IBAction func addBeansButton(_ sender: UIButton) {
        label.text = order.addBeans()
    }
    
    @IBAction func removeTrashButton(_ sender: UIButton) {
        label.text = order.clearTrash()
        }
    
    
}

