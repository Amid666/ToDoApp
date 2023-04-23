//
//  ToDoAppTests.swift
//  ToDoAppTests
//
//  Created by Кефир Кефирчик on 02.04.2023.
//

import XCTest
@testable import ToDoApp

final class ToDoAppTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitialViewControllersTaskListViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationContoller = storyboard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = navigationContoller.viewControllers.first as! TaskListViewController
        
        XCTAssertTrue(rootViewController is TaskListViewController)
    }
}
