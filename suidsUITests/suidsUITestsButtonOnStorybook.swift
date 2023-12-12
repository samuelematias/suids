//
//  suidsUITestsButtonOnStorybook.swift
//  suidsUITests
//
//  Created by samuelematias on 12/12/23.
//

import XCTest

final class suidsUITestsButtonOnStorybook: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFindSendButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["Button"]
        XCTAssertTrue(button.waitForExistence(timeout: 10), "Button not found.")
        button.tap()
        
        let sendButton = app.buttons["Send"]
        XCTAssertTrue(sendButton.waitForExistence(timeout: 10), "Send button not found.")
        
    }
    
    func testClickOnSendButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["Button"]
        XCTAssertTrue(button.waitForExistence(timeout: 10), "Button not found.")
        button.tap()
        
        let sendButton = app.buttons["Send"]
        XCTAssertTrue(sendButton.waitForExistence(timeout: 10), "Send button not found.")
        sendButton.tap()
    }
    
    func testCheckIfModalWasOpneOnClickedSendButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["Button"]
        XCTAssertTrue(button.waitForExistence(timeout: 10), "Button not found.")
        button.tap()
        
        let sendButton = app.buttons["Send"]
        XCTAssertTrue(sendButton.waitForExistence(timeout: 10), "Send button not found.")
        sendButton.tap()
        
        let buttonComponentText = app.staticTexts["Button Component"]
        XCTAssertTrue(buttonComponentText.exists, "The text 'Button Component' was not found on the screen.")
        
    }
    
    func testCheckIfModalHasTheCorrectText() throws {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["Button"]
        XCTAssertTrue(button.waitForExistence(timeout: 10), "Button not found.")
        button.tap()
        
        let sendButton = app.buttons["Send"]
        XCTAssertTrue(sendButton.waitForExistence(timeout: 10), "Send button not found.")
        sendButton.tap()
        
        let buttonComponentText = app.staticTexts["Button Component"]
        XCTAssertTrue(buttonComponentText.exists, "The text 'Button Component' was not found on the screen.")
        
        let buttonsComponentText = app.staticTexts["Buttons Component"]
        XCTAssertFalse(buttonsComponentText.exists, "The text 'Buttons Component' was found on the screen.")
        
        let buttonsComponentsText = app.staticTexts["Buttons Components"]
        XCTAssertFalse(buttonsComponentsText.exists, "The text 'Buttons Components' was found on the screen.")
        
        let buttonComponentsText = app.staticTexts["Button Components"]
        XCTAssertFalse(buttonComponentsText.exists, "The text 'Button Components' was found on the screen.")
        
    }
    
    func testCloseModalAfterOpenOnClickedSendButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["Button"]
        XCTAssertTrue(button.waitForExistence(timeout: 10), "Button not found.")
        button.tap()
        
        let sendButton = app.buttons["Send"]
        XCTAssertTrue(sendButton.waitForExistence(timeout: 10), "Send button not found.")
        sendButton.tap()
        
        let buttonComponentText = app.staticTexts["Button Component"]
        XCTAssertTrue(buttonComponentText.exists, "The text 'Button Component' was not found on the screen.")
        
        let modalCloseButton = app.buttons["modalCloseButton"]
        XCTAssertTrue(modalCloseButton.waitForExistence(timeout: 10), "Modal close button not found.")
        modalCloseButton.tap()
        
        let componentsButton = app.buttons["Components"]
        XCTAssertTrue(componentsButton.waitForExistence(timeout: 10), "Components button not found.")
        componentsButton.tap()
        
    }
    
    func testFindAndClickCustomButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["Button"]
        XCTAssertTrue(button.waitForExistence(timeout: 10), "Button not found.")
        button.tap()
        
        let customButton = app.buttons["CustomButton"]
        XCTAssertTrue(customButton.waitForExistence(timeout: 10), "CustomButton button not found.")
        customButton.tap()
        
        let buttonComponentText = app.staticTexts["Button Component"]
        XCTAssertTrue(buttonComponentText.exists, "The text 'Button Component' was not found on the screen.")
        
        let modalCloseButton = app.buttons["modalCloseButton"]
        XCTAssertTrue(modalCloseButton.waitForExistence(timeout: 10), "Modal close button not found.")
        modalCloseButton.tap()
        
        let componentsButton = app.buttons["Components"]
        XCTAssertTrue(componentsButton.waitForExistence(timeout: 10), "Components button not found.")
        componentsButton.tap()
        
    }
    
    func testFindAndClickCircleButtonPrimary() throws {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["Button"]
        XCTAssertTrue(button.waitForExistence(timeout: 10), "Button not found.")
        button.tap()
        
        let circleButtonPrimary = app.buttons["CircleButtonPrimary"]
        XCTAssertTrue(circleButtonPrimary.waitForExistence(timeout: 10), "CircleButtonPrimary button not found.")
        circleButtonPrimary.tap()
        
        let buttonComponentText = app.staticTexts["Button Component"]
        XCTAssertTrue(buttonComponentText.exists, "The text 'Button Component' was not found on the screen.")
        
        let modalCloseButton = app.buttons["modalCloseButton"]
        XCTAssertTrue(modalCloseButton.waitForExistence(timeout: 10), "Modal close button not found.")
        modalCloseButton.tap()
        
        let componentsButton = app.buttons["Components"]
        XCTAssertTrue(componentsButton.waitForExistence(timeout: 10), "Components button not found.")
        componentsButton.tap()
        
    }
    
    func testFindAndClickCircleButtonSupport() throws {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["Button"]
        XCTAssertTrue(button.waitForExistence(timeout: 10), "Button not found.")
        button.tap()
        
        let circleButtonSupport = app.buttons["CircleButtonSupport"]
        XCTAssertTrue(circleButtonSupport.waitForExistence(timeout: 10), "CircleButtonSupport button not found.")
        circleButtonSupport.tap()
        
        let buttonComponentText = app.staticTexts["Button Component"]
        XCTAssertTrue(buttonComponentText.exists, "The text 'Button Component' was not found on the screen.")
        
        let modalCloseButton = app.buttons["modalCloseButton"]
        XCTAssertTrue(modalCloseButton.waitForExistence(timeout: 10), "Modal close button not found.")
        modalCloseButton.tap()
        
        let componentsButton = app.buttons["Components"]
        XCTAssertTrue(componentsButton.waitForExistence(timeout: 10), "Components button not found.")
        componentsButton.tap()
        
    }
    
    func testFindAndClickIconButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["Button"]
        XCTAssertTrue(button.waitForExistence(timeout: 10), "Button not found.")
        button.tap()
        
        let iconButton = app.buttons["IconButton"]
        XCTAssertTrue(iconButton.waitForExistence(timeout: 10), "IconButton button not found.")
        iconButton.tap()
        
        let buttonComponentText = app.staticTexts["Button Component"]
        XCTAssertTrue(buttonComponentText.exists, "The text 'Button Component' was not found on the screen.")
        
        let modalCloseButton = app.buttons["modalCloseButton"]
        XCTAssertTrue(modalCloseButton.waitForExistence(timeout: 10), "Modal close button not found.")
        modalCloseButton.tap()
        
        let componentsButton = app.buttons["Components"]
        XCTAssertTrue(componentsButton.waitForExistence(timeout: 10), "Components button not found.")
        componentsButton.tap()
        
    }

    func testFindAndClickTextButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["Button"]
        XCTAssertTrue(button.waitForExistence(timeout: 10), "Button not found.")
        button.tap()
        
        let textButton = app.buttons["TextButton"]
        XCTAssertTrue(textButton.waitForExistence(timeout: 10), "TextButton button not found.")
        textButton.tap()
        
        let buttonComponentText = app.staticTexts["Button Component"]
        XCTAssertTrue(buttonComponentText.exists, "The text 'Button Component' was not found on the screen.")
        
        let modalCloseButton = app.buttons["modalCloseButton"]
        XCTAssertTrue(modalCloseButton.waitForExistence(timeout: 10), "Modal close button not found.")
        modalCloseButton.tap()
        
        let componentsButton = app.buttons["Components"]
        XCTAssertTrue(componentsButton.waitForExistence(timeout: 10), "Components button not found.")
        componentsButton.tap()
        
    }

}
