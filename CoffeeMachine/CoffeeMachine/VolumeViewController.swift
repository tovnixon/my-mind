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
        //set up sliders
        // 2var setup initial values min max, & update value for slider
        setupMinMaxValueOfComponent(waterOutlet, .water)
        setupMinMaxValueOfComponent(milkOutlet, .milk)
        setupMinMaxValueOfComponent(beansOutlet, .beans)
        updateValueOfComponent(waterOutlet, .water)
        
        
        trashOutlet.maximumValue = Float(cm.trashCapacity)
        trashOutlet.value = Float(cm.trash)
    }
  
    func setupMinMaxValueOfComponent(_ slider: UISlider!, _ type: MyCoffeeComponentType){
        slider.maximumValue = Float(cm.valueForAdd)
        slider.minimumValue = Float(cm.getComponentByType(type)!.minvol)
    }
    
    func updateValueOfComponent(_ slider: UISlider!, _ type: MyCoffeeComponentType) {
        slider.value = Float(cm.getComponentByType(type)!.volume)
    }
    
}
