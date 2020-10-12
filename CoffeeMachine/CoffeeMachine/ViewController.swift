//
//  ViewController.swift
//  CoffeeMachine
//
//  Created by Anna Oksanichenko on 02.09.2020.
//  Copyright © 2020 Anna Oksanichenko. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
   
    @IBOutlet weak var makeAmericano: UIButton!
    
    let machine = CoffeeMachine()
    let cm = AppState.shared.coffeeMachine

    
    let americano = DrinkFactory.getAmericano()
    let capuchino = DrinkFactory.getCapuchino()
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        makeAmericano.addTarget(self, action: #selector(americanoButton(_:)), for: UIControl.Event.touchUpInside)
        
    }
   @objc func americanoButton(_ sender: UIButton) {
        if cm.canMakeADrink(americano) {
            cm.letsMakeDrink(americano)
            label.text = cm.message
        }
        label.text = cm.message
        sender.isEnabled = false
    }
    
    @IBAction func capuchinoButton(_ sender: UIButton) {
        if cm.canMakeADrink(capuchino) {
            cm.letsMakeDrink(capuchino)
            label.text = cm.message
        }
        label.text = cm.message
        sender.isEnabled = false
    }
    
    
    @IBAction func addWaterButton(_ sender: UIButton) {
        cm.addSomeComponent(.water)
        label.text = cm.message
    }
    
    @IBAction func addMilkButton(_ sender: UIButton) {
        cm.addSomeComponent(.milk)
        label.text = cm.message
    }
    
    @IBAction func addBeansButton(_ sender: UIButton) {
        cm.addSomeComponent(.beans)
        label.text = cm.message
    }
    
    @IBAction func removeTrashButton(_ sender: UIButton) {
        cm.refreshTrash()
        label.text = cm.message
    }
    
    @IBAction func showVolumeButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toVolumeVC", sender: nil)
    }
    
}

