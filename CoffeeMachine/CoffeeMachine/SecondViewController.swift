//
//  SecondViewController.swift
//  CoffeeMachine
//
//  Created by Anna Oksanichenko on 08.10.2020.
//  Copyright © 2020 Anna Oksanichenko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var waterOutlet: UISlider!
    @IBOutlet weak var milkOutlet: UISlider!
    @IBOutlet weak var beansOutlet: UISlider!
    @IBOutlet weak var trashOutlet: UISlider!
    
    @IBOutlet weak var addWater: UIButton!
    @IBOutlet weak var addMilk: UIButton!
    @IBOutlet weak var addBeans: UIButton!
    @IBOutlet weak var clearTrash: UIButton!
    
    @IBOutlet weak var makeAmericano: UIButton!
    @IBOutlet weak var makeCapuchino: UIButton!
    @IBOutlet weak var makeLatte: UIButton!
    @IBOutlet weak var makeFlatWhite: UIButton!
    @IBOutlet weak var makeWarmMilk: UIButton!
    
    let machine = CoffeeMachine()
    let cm = AppState.shared.coffeeMachine    
    let americano = DrinkFactory.getAmericano()
    let capuchino = DrinkFactory.getCapuchino()
    let latte = DrinkFactory.getLatte()
    let flatWhite = DrinkFactory.getFlatWhite()
    let warmMilk = DrinkFactory.getWarmMilk()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMinMaxValueOfComponent(waterOutlet, .water)
        setupMinMaxValueOfComponent(milkOutlet, .milk)
        setupMinMaxValueOfComponent(beansOutlet, .beans)
        trashOutlet.maximumValue = Float(cm.trashCapacity)
        
        reloadValues()
        
    }
    
    func setupMinMaxValueOfComponent(_ slider: UISlider!, _ type: MyCoffeeComponentType){
        slider.maximumValue = Float(cm.valueForAdd)
        slider.minimumValue = Float(cm.getComponentByType(type)!.minvol)
    }

    func updateValueOfComponent(_ slider: UISlider!, _ type: MyCoffeeComponentType) {
        slider.value = Float(cm.getComponentByType(type)!.volume)
    }
    
    func reloadValues(){
        updateValueOfComponent(waterOutlet, .water)
        updateValueOfComponent(milkOutlet, .milk)
        updateValueOfComponent(beansOutlet, .beans)
        trashOutlet.value = Float(cm.trash)
    }
    
    func enabled(){
        let drinks = [makeAmericano, makeCapuchino, makeLatte, makeFlatWhite, makeWarmMilk]
        for drink in drinks {
            if drink?.isEnabled == false && drink?.isHidden == true {
                drink?.isEnabled = true
                drink?.isHidden = false
            }
        }
    }
    @IBAction func addWaterButton(_ sender: UIButton) {
        cm.addSomeComponent(.water)
        label.text = cm.message
        reloadValues()
        enabled()
    }
    @IBAction func addMilkButton(_ sender: UIButton) {
        cm.addSomeComponent(.milk)
        label.text = cm.message
        reloadValues()
        enabled()
    }
    
    @IBAction func addBeansButton(_ sender: UIButton) {
        cm.addSomeComponent(.beans)
        label.text = cm.message
        reloadValues()
        enabled()
    }
    @IBAction func cleanTrashButton(_ sender: UIButton) {
        cm.refreshTrash()
        label.text = cm.message
        reloadValues()
        enabled()
    }
    @IBAction func americanoButton(_ sender: UIButton) {
     
        if cm.canMakeADrink(americano) {
            cm.letsMakeDrink(americano)
            label.text = cm.message
        } else {
            label.text = cm.message
            makeAmericano.isEnabled = false
            makeAmericano.isHidden = true
        }
        reloadValues()
    }
    
    @IBAction func capuchinoButton(_ sender: UIButton) {
        if cm.canMakeADrink(capuchino) {
            cm.letsMakeDrink(capuchino)
            label.text = cm.message
        } else {
            label.text = cm.message
            makeCapuchino.isEnabled = false
            makeCapuchino.isHidden = true
        }
        reloadValues()
    }
    
    @IBAction func latteButton(_ sender: UIButton) {
        if cm.canMakeADrink(latte) {
            cm.letsMakeDrink(latte)
            label.text = cm.message
        } else {
            label.text = cm.message
            makeLatte.isEnabled = false
            makeLatte.isHidden = true
        }
        reloadValues()
    }
    
    @IBAction func flatWhiteButton(_ sender: UIButton) {
        if cm.canMakeADrink(flatWhite) {
            cm.letsMakeDrink(flatWhite)
            label.text = cm.message
        } else {
            label.text = cm.message
            makeFlatWhite.isEnabled = false
            makeFlatWhite.isHidden = true
        }
        reloadValues()
    }
    
    @IBAction func warmMilkButton(_ sender: UIButton) {
        if cm.canMakeADrink(warmMilk) {
            cm.letsMakeDrink(warmMilk)
            label.text = cm.message
        } else {
            label.text = cm.message
            makeWarmMilk.isEnabled = false
            makeWarmMilk.isHidden = true
        }
        reloadValues()
    }
    
}
