//
//  ViewController.swift
//  CoffeeMachine
//
//  Created by Anna Oksanichenko on 02.09.2020.
//  Copyright © 2020 Anna Oksanichenko. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
   
    
    let machine = CoffeeMachine()
    let cm = AppState.shared.coffeeMachine

    
    let americano = DrinkFactory.getAmericano()
    let capuchino = DrinkFactory.getCapuchino()
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    @IBAction func americanoButton(_ sender: UIButton) {
//        machine.letsMakeDrink(americano)
//        print(machine.getComponentByType(.water)?.volume)
        
        cm.letsMakeDrink(americano)
     
        print("Trash \(cm.trash)")
    }
    
    @IBAction func capuchinoButton(_ sender: UIButton) {
       
    }
    
    
    @IBAction func addWaterButton(_ sender: UIButton) {
        label.text = machine.message
    }
    
    @IBAction func addMilkButton(_ sender: UIButton) {
        label.text = machine.message
    }
    
    @IBAction func addBeansButton(_ sender: UIButton) {

    }
    
    @IBAction func removeTrashButton(_ sender: UIButton) {
        label.text = machine.message
    }
    
    @IBAction func showVolumeButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toVolumeVC", sender: nil)
    }
    
}

