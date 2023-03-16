//
//  fi_news_iosUITests.swift
//  fi-news-iosUITests
//
//  Created by Markus Reinhold on 03.03.23.
//

import XCTest

final class fi_news_iosUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        // press Flutter button
        app.buttons.firstMatch.tap()
        
        // wait for API call to finish
        XCTAssertTrue(app.staticTexts["loading..."].waitForNonExistence(timeout: 60))
        
    
        
        //app.buttons.staticTexts["Show Flutter!"].firstMatch.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

// https://stackoverflow.com/questions/37447084/wait-until-object-is-not-visible-on-the-screen-using-swift-and-xctest
extension XCUIElement {

    /**
     * Waits the specified amount of time for the element’s `exists` property to become `false`.
     *
     * - Parameter timeout: The amount of time to wait.
     * - Returns: `false` if the timeout expires without the element coming out of existence.
     */
    func waitForNonExistence(timeout: TimeInterval) -> Bool {
    
        let timeStart = Date().timeIntervalSince1970
    
        while (Date().timeIntervalSince1970 <= (timeStart + timeout)) {
            if !exists { return true }
        }
    
        return false
    }
}
