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

        trashOutlet.maximumValue = Float(cm.trashCapacity)
        trashOutlet.value = Float(cm.trash)
        waterOutlet.maximumValue = Float(cm.valueForAdd)
        waterOutlet.value = cm.availableComponents(

    }
  
    
}
