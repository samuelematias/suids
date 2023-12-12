//
//  suidsUITests.swift
//  suidsUITests
//
//  Created by samuelematias on 12/12/23.
//

import XCTest

final class suidsUITestsStorybook: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCheckStorybookList(){
        let app = XCUIApplication()
        app.launch()
        
        let componentText = app.staticTexts["Components"]
        XCTAssertTrue(componentText.exists, "The text 'Components' was not found on the screen.")
    }
    
    func testCheckStorybookListItem(){
        let app = XCUIApplication()
        app.launch()
        
        XCTAssert(app.buttons["Button"].waitForExistence(timeout: 0.5))
    }

    func testOpenStorybookListItem() throws {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["Button"]
        XCTAssertTrue(button.waitForExistence(timeout: 10), "Button not found.")
        button.tap()
    }
    
    func testCheckOpenStorybookListItemDetail(){
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["Button"]
        XCTAssertTrue(button.waitForExistence(timeout: 10), "Button not found.")
        button.tap()
        
        let buttonText = app.staticTexts["Button"]
        XCTAssertTrue(buttonText.exists, "The text 'Button' was not found on the screen.")
    }
}
