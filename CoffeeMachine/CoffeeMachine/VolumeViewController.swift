//
//  VolumeViewController.swift
//  CoffeeMachine
//
//  Created by Anna Oksanichenko on 30.09.2020.
//  Copyright © 2020 Anna Oksanichenko. All rights reserved.
//

import UIKit

class VolumeViewController: UIViewController {
    
    var machine = CoffeeMachine()
    let cm = AppState.shared.coffeeMachine
    @IBOutlet weak var waterOutlet: UISlider!
    @IBOutlet weak var beansOutlet: UISlider!
    @IBOutlet weak var milkOutlet: UISlider!
    @IBOutlet weak var trashOutlet: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        trashOutlet.maximumValue = Float(cm.trashCapacity)
//        trashOutlet.value = Float(cm.trash)
//        
//     //   waterOutlet.value = Float(cm.getComponentByType(.water))
//        waterOutlet.maximumValue = Float(cm.valueForAdd)
    }
    
    @IBAction func waterChanged(_ sender: UISlider) {
    }
    @IBAction func beansChanged(_ sender: UISlider) {
    }
    @IBAction func milkChanged(_ sender: UISlider) {
    }
    @IBAction func trashChanged(_ sender: UISlider) {
    }
    
    
}
