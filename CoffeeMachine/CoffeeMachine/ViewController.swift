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
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        
    }
    @IBAction func americanoButton(_ sender: UIButton) {
        label.text = order.makesomeDrink(drink: CoffeeMachine.Drink.americano)
    }
    
    @IBAction func capuchinoButton(_ sender: UIButton) {
        label.text = order.makesomeDrink(drink: CoffeeMachine.Drink.capuchino)
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

