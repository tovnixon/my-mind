//
//  ViewController.swift
//  CoffeeMachine
//
//  Created by Anna Oksanichenko on 02.09.2020.
//  Copyright © 2020 Anna Oksanichenko. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
   
    
    let machine = CMachine()
    
    
    let capuchino = myDrink(name: "capuchino", components: [ComponentContain(type: .beans, volume: 25), ComponentContain(type: .milk, volume: 10), ComponentContain(type: .water, volume: 40)])
    let americano = myDrink(name: "americano", components: [ComponentContain(type: .beans, volume: 20), ComponentContain(type: .water, volume: 25)])
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    @IBAction func americanoButton(_ sender: UIButton) {
        
        //    label.text = machine.letsMakeDrink(americano)
        //        label.text = order.makesomeDrink(drink: CoffeeMachine.Drink.americano)
    }
    
    @IBAction func capuchinoButton(_ sender: UIButton) {
        //       label.text = machine.letsMakeDrink(capuchino)
    }
    
    
    @IBAction func addWaterButton(_ sender: UIButton) {
        label.text = machine.message
    }
    
    @IBAction func addMilkButton(_ sender: UIButton) {
        //       label.text = machine.addSomeComponent(.milk)
        label.text = machine.message
    }
    
    @IBAction func addBeansButton(_ sender: UIButton) {
        //      label.text = machine.addSomeComponent(.beans)
    }
    
    @IBAction func removeTrashButton(_ sender: UIButton) {
        label.text = machine.message
    }
    
    @IBAction func showVolumeButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toVolumeVC", sender: nil)
    }
    
}

