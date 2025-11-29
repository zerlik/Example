//
//  TabBarButtonsUITests.swift
//  ExamplePRJUITests
//
//  Created by Andrei Ziamlianski on 17/01/2025.
//

import XCTest
@testable import ExamplePRJ

final class TabBarButtonsUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    @MainActor
    func testUITabBarButtons() throws {
        let app = XCUIApplication()
        app.launch()
        let button = app.buttons["TabBarButtonHome"].firstMatch // get the ui element for validation ( button in tabbar)
        XCTAssertTrue(button.exists) // check Has the element been created
        XCTAssertEqual(button.title,  Localization.TabBar.home) // check title element
    }


    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
