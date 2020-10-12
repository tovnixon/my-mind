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
        
        setupMinMaxValueOfComponent(.water, for: waterOutlet)
        setupMinMaxValueOfComponent(.milk, for: milkOutlet)
        setupMinMaxValueOfComponent(.beans, for: beansOutlet)
        trashOutlet.maximumValue = Float(cm.trashCapacity)
        
        reloadValues()
        
    }
    
    @IBAction func addWaterButton(_ sender: UIButton) {
        addComponent(type: .water)
    }
    @IBAction func addMilkButton(_ sender: UIButton) {
        addComponent(type: .milk)
    }
    @IBAction func addBeansButton(_ sender: UIButton) {
        addComponent(type: .beans)
    }
    @IBAction func cleanTrashButton(_ sender: UIButton) {
        _ = cm.refreshTrash()
        label.text = cm.message
        reloadValues()
        enabled()
    }
    
    @IBAction func americanoButton(_ sender: UIButton) {
        makeDrink(americano, from: sender)
    }
    
    @IBAction func capuchinoButton(_ sender: UIButton) {
        makeDrink(capuchino, from: sender)
    }
    
    @IBAction func latteButton(_ sender: UIButton) {
        makeDrink(latte, from: sender)
    }
    
    @IBAction func flatWhiteButton(_ sender: UIButton) {
        makeDrink(flatWhite, from: sender)
    }
    
    @IBAction func warmMilkButton(_ sender: UIButton) {
        makeDrink(warmMilk, from: sender)
    }
    
}

private extension SecondViewController {
    func setupMinMaxValueOfComponent(_ type: MyCoffeeComponentType, for slider: UISlider){
        slider.maximumValue = Float(cm.valueForAdd)
        slider.minimumValue = Float(cm.getComponentByType(type)!.minvol)
    }
    
    func updateValueOfComponent(_ type: MyCoffeeComponentType, for slider: UISlider) {
        slider.value = Float(cm.getComponentByType(type)!.volume)
    }
    
    func reloadValues(){
        updateValueOfComponent(.water, for: waterOutlet)
        updateValueOfComponent(.milk, for: milkOutlet)
        updateValueOfComponent(.beans, for: beansOutlet)
        trashOutlet.value = Float(cm.trash)
    }
    
    func enabled(){
        let drinks = [makeAmericano, makeCapuchino, makeLatte, makeFlatWhite, makeWarmMilk]
        for drink in drinks {
            if drink?.isEnabled == false{
                drink?.isEnabled = true
            }
        }
    }
    
    func addComponent(type: MyCoffeeComponentType){
        _ = cm.addSomeComponent(type)
        label.text = cm.message
        reloadValues()
        enabled()
    }
    
    func makeDrink(_ drink: MyDrink, from button: UIButton) {
        if cm.canMakeADrink(drink) {
            _ = cm.letsMakeDrink(drink)
            label.text = cm.message
        } else {
            label.text = cm.message
            button.isEnabled = false
        }
        reloadValues()
    }
    
}
