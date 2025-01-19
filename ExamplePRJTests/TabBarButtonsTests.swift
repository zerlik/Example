//
//  TabBarButtonsTests.swift
//  ExamplePRJTests
//
//  Created by Andrei Ziamlianski on 17/01/2025.
//

import XCTest
@testable import ExamplePRJ
@testable import NetworkKIT

final class TabBarButtonsTests: XCTestCase {

    let dependencies = Dependencies(service: NetworkProvider(), userSession: UserSession())
    var tabBarController: UIViewController?

    override func setUpWithError() throws {
        tabBarController = MainTabBarBuilder().makeVC(dependencies)
    }

    override func tearDownWithError() throws {

    }

// Unit test
    func testUnitTabBarButtons() throws {
        let tabBarController = tabBarController as? MainTabBarViewController // create tabbar Controller
        XCTAssertEqual(tabBarController?.customTabBarView.buttonHome.titleLabel?.text,  Localization.TabBar.home)// check title button home in tab controller
    }
}
