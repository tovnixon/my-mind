//
//  VolumeViewController.swift
//  CoffeeMachine
//
//  Created by Anna Oksanichenko on 30.09.2020.
//  Copyright © 2020 Anna Oksanichenko. All rights reserved.
//

import UIKit

class VolumeViewController: UIViewController {
let machine = CMachine()
    
    @IBOutlet weak var trashOutlet: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func waterSlider(_ sender: UISlider) {
        // issue with finding current value
        sender.maximumValue = Float(machine.valueForAdd)
        let currentValue = machine.getComponentByType(.water)?.minvol
        sender.value = Float(currentValue!)
       
    }
    @IBAction func beansSlider(_ sender: UISlider) {
       
    }
    @IBAction func milkSlider(_ sender: UISlider) {
    }
 
    @IBAction func trashSlider(_ sender: UISlider) {

//        trashOutlet.maximumValue = Float(machine.trashCapacity)
//        trashOutlet.value = Float(machine.trash)
        sender.maximumValue = Float(machine.trashCapacity)
        sender.value = Float(machine.trash + 35)
    }
    
    
}
