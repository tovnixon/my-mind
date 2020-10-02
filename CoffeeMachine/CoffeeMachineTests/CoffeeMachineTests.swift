//
//  CoffeeMachineTests.swift
//  CoffeeMachineTests
//
//  Created by Anna Oksanichenko on 30.09.2020.
//  Copyright © 2020 Anna Oksanichenko. All rights reserved.
//

import XCTest

@testable import CoffeeMachine

class CoffeeMachineTests: XCTestCase {
    
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTrashCapacityCanBeSetAfterCMCreated() throws {
        //given
        let cm = CMachine()
        
        //when
        cm.trash = 10000
        
        //then
        XCTAssertEqual(cm.trash, 10000, "trash is not equal to 10000")
    }
    
    func testRefreshTrash() throws {
        //given
        let cm = CMachine()
        cm.trash = 10
        
        //when
        cm.trash = cm.refreshTrash()
        
        //then
        XCTAssertEqual(cm.trash, 0, "trash is not equal to 0")
    }
    
    func testAddSomeComponent() throws {
        let cm = CMachine()
        cm.addSomeComponent(.beans)
        let beansMachine = cm.getComponentByType(.beans)
        XCTAssertEqual(beansMachine?.volume, 200, "havent any beans")
    }
    
    func testCanMakeADrinkWhenMachineComponentEnough() throws {
        let cm = CMachine()
        let amer = myDrink(name: "americano", components: [ComponentContain(type: .beans, volume: 30), ComponentContain(type: .water, volume: 50)])
        let result =  cm.canMakeADrink(amer)
        XCTAssertEqual(result, true, "Component in machine less then drink needed")
    }
    
    func testCanMakeDrinkWhenVolumeOfDrinkComponentBiggerThenComponentInMachine() throws {
        let cm = CMachine()
        let amer = myDrink(name: "americano", components: [ComponentContain(type: .beans, volume: 30), ComponentContain(type: .water, volume: 150)])
        let result =  cm.canMakeADrink(amer)
        XCTAssertEqual(result, false, "components must be not enough for preparing drink")
    }
    
    func testCanMakeADrinkWhenTrashIsFull() throws {
        let cm = CMachine()
        cm.trash = 50
        let latte  = myDrink(name: "latte", components: [ComponentContain(type: .beans, volume: 30)])
        let result = cm.canMakeADrink(latte)
        XCTAssertEqual(result, false, "trash must be full")
    }
    
    func testEnoughComponentOfType() throws {
        let cm = CMachine()
        let result = cm.hasEnoughComponentOfType(ComponentContain(type: .beans, volume: 30))
        XCTAssertEqual(result, true, "not enough this component")
    }
    
    func testNotEnoughComponentOfType() throws {
        let cm = CMachine()
       let beans = cm.availableComponents[ComponentContain(type: .beans, volume: 0)]
        XCTAssertEqual()
    }
    
    func testLetsMakeADrink() throws {
        let cm = CMachine()
        let latte  = myDrink(name: "latte", components: [ComponentContain(type: .beans, volume: 30), ComponentContain(type: .milk, volume: 45)])
        let result =  cm.letsMakeDrink(latte)
        XCTAssertEqual(result, true, "cant make a drink, there is some issue")
    }
    
    func testGetComponentByType() throws {
        let cm = CMachine()
        let result = cm.getComponentByType(.beans)
        XCTAssertEqual(result, ComponentContain?.some(), "wrong type")
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
