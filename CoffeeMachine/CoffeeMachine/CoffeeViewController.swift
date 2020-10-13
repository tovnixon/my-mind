//
//  SecondViewController.swift
//  CoffeeMachine
//
//  Created by Anna Oksanichenko on 08.10.2020.
//  Copyright © 2020 Anna Oksanichenko. All rights reserved.
//

import UIKit

class CoffeeViewController: UIViewController {
    
    @IBOutlet weak var machineOutputLabel: UILabel!
    @IBOutlet weak var waterVolumeSlider: UISlider!
    @IBOutlet weak var milkVolumeSlider: UISlider!
    @IBOutlet weak var beansVolumeSlider: UISlider!
    @IBOutlet weak var trashVolumeSlider: UISlider!
    
    @IBOutlet weak var addWaterButton: UIButton!
    @IBOutlet weak var addMilkButton: UIButton!
    @IBOutlet weak var addBeansButton: UIButton!
    @IBOutlet weak var clearTrashButton: UIButton!
    
    @IBOutlet weak var makeAmericanoButton: UIButton!
    @IBOutlet weak var makeCapuchinoButton: UIButton!
    @IBOutlet weak var makeLatteButton: UIButton!
    @IBOutlet weak var makeFlatWhiteButton: UIButton!
    @IBOutlet weak var makeWarmMilkButton: UIButton!
    
    let coffeeMachine = AppState.shared.coffeeMachine    
    let americano = DrinkFactory.getAmericano()
    let capuchino = DrinkFactory.getCapuchino()
    let latte = DrinkFactory.getLatte()
    let flatWhite = DrinkFactory.getFlatWhite()
    let warmMilk = DrinkFactory.getWarmMilk()

    var makeDrinkButtons = [UIButton]()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeDrinkButtons = [makeAmericanoButton, makeCapuchinoButton, makeLatteButton, makeFlatWhiteButton, makeWarmMilkButton]
        setupMinMaxValueOfComponent(.water, for: waterVolumeSlider)
        setupMinMaxValueOfComponent(.milk, for: milkVolumeSlider)
        setupMinMaxValueOfComponent(.beans, for: beansVolumeSlider)
        trashVolumeSlider.maximumValue = Float(coffeeMachine.trashCapacity)
        
        reloadVolumeSliders()
    }
    
    @IBAction func addWater(_ sender: UIButton) {
        addComponent(type: .water)
    }
    
    @IBAction func addMilk(_ sender: UIButton) {
        addComponent(type: .milk)
    }
    
    @IBAction func addBeans(_ sender: UIButton) {
        addComponent(type: .beans)
    }
    
    @IBAction func clearTrash(_ sender: UIButton) {
        _ = coffeeMachine.refreshTrash()
        machineOutputLabel.text = coffeeMachine.message
        reloadVolumeSliders()
        refreshDrinksAvailability()
    }
    
    @IBAction func makeAmericano(_ sender: UIButton) {
        makeDrink(americano, handlingTouchOf: sender)
    }
    
    @IBAction func makeCapuchino(_ sender: UIButton) {
        makeDrink(capuchino, handlingTouchOf: sender)
    }
    
    @IBAction func makeLatte(_ sender: UIButton) {
        makeDrink(latte, handlingTouchOf: sender)
    }
    
    @IBAction func makeFlatWhite(_ sender: UIButton) {
        makeDrink(flatWhite, handlingTouchOf: sender)
    }
    
    @IBAction func makeWarmMilk(_ sender: UIButton) {
        makeDrink(warmMilk, handlingTouchOf: sender)
    }
}

private extension CoffeeViewController {
    
    func setupMinMaxValueOfComponent(_ component: MyCoffeeComponentType, for slider: UISlider){
        slider.maximumValue = Float(coffeeMachine.valueForAdd)
        let minVolumeOfComponent = coffeeMachine.getComponentByType(component)?.minvol ?? 0
        slider.minimumValue = Float(minVolumeOfComponent)
    }
    
    func reloadValueOfComponent(_ component: MyCoffeeComponentType, for slider: UISlider) {
        if let volumeOfComponent = coffeeMachine.getComponentByType(component)?.volume {
            slider.value = Float(volumeOfComponent)
        }
    }
    
    func reloadVolumeSliders() {
        reloadValueOfComponent(.water, for: waterVolumeSlider)
        reloadValueOfComponent(.milk, for: milkVolumeSlider)
        reloadValueOfComponent(.beans, for: beansVolumeSlider)
        trashVolumeSlider.value = Float(coffeeMachine.trash)
    }
    
    func refreshDrinksAvailability() {
        for drink in makeDrinkButtons {
            if drink.isEnabled == false{
                drink.isEnabled = true
            }
        }
    }
    
    func addComponent(type: MyCoffeeComponentType) {
        _ = coffeeMachine.addSomeComponent(type)
        machineOutputLabel.text = coffeeMachine.message
        reloadVolumeSliders()
        refreshDrinksAvailability()
    }
    
    func makeDrink(_ drink: MyDrink, handlingTouchOf button: UIButton) {
        if coffeeMachine.canMakeADrink(drink) {
            let alert = UIAlertController(title: "\(drink.name)", message: "Click YES to take your drink", preferredStyle: .alert)
            let yesButton = UIAlertAction(title: "YES", style: .default, handler: nil)
            alert.addAction(yesButton)
            self.present(alert, animated: true, completion: nil)
            _ = coffeeMachine.letsMakeDrink(drink)
            machineOutputLabel.text = coffeeMachine.message
        } else {
            machineOutputLabel.text = coffeeMachine.message
            button.isEnabled = false
        }
        reloadVolumeSliders()
    }
}
