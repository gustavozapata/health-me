//
//  HealthMeUITests.swift
//  HealthMeUITests
//
//  Created by Gustavo Zapata on 02/02/2021.
//  Copyright © 2021 Gustavo Zapata. All rights reserved.
//

import XCTest

class HealthMeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.staticTexts["Log in"].tap()
        
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        elementsQuery.textFields["user@email.com"].tap()
        app.typeText("tavo@hotmail.com")
        elementsQuery.secureTextFields["6+ characters"].tap()
        app.typeText("123")
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Log in")
            .children(matching: .staticText)
            .matching(identifier: "Log in")
            .element(boundBy: 1).tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
