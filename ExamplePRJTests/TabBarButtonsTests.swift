//
//  TabBarButtonsTests.swift
//  ExamplePRJTests
//
//  Created by Andrei Ziamlianski on 17/01/2025.
//

import XCTest
@testable import ExamplePRJ

final class TabBarButtonsTests: XCTestCase {

    let dependencies = Dependencies(service: NetworkProvider(), userSession: UserSession())
    var tabBarController: UIViewController?

    override func setUpWithError() throws {
        tabBarController = MainTabBarBuilder().makeVC(dependencies)
    }

    override func tearDownWithError() throws {

    }


    func testUnitTabBarButtons() throws {
        let tabBarController = tabBarController as? MainTabBarViewController
        XCTAssertEqual(tabBarController?.customTabBarView.buttonHome.titleLabel?.text,  Localization.TabBar.home)
    }
}
