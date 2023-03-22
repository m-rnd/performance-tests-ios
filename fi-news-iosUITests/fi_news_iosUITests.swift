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
        measure(metrics: [XCTOSSignpostMetric(subsystem: "test.fi-news-ios", category: "PointsOfInterest", name: "native"), XCTOSSignpostMetric(subsystem: "test.fi-news-ios", category: "PointsOfInterest", name: "flutter"), XCTCPUMetric(), XCTMemoryMetric()]) {
            app.launch()
            
            // press Flutter button
            app.buttons.firstMatch.tap()
            
        
            XCTAssertTrue(app.staticTexts["finished"].waitForExistence(timeout: 60))
        }
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
