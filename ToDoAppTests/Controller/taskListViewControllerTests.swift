//
//  taskListViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Кефир Кефирчик on 08.04.2023.
//

import XCTest
@testable import ToDoApp

final class taskListViewControllerTests: XCTestCase {

    var sut: TaskListViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListViewController.self))
        sut = vc as? TaskListViewController
        
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWhenViewIsLoadedTableViewNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedDataPrividerIsNotNil() {
        XCTAssertNotNil(sut.dataProvider)
    }
    
    func testWhenViewIsLoaddedTableViewDelegateIsSet() {
        XCTAssertTrue(sut.tableView.delegate is DataProvider)
    }
    
    func testWhenViewIsLoaddedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is DataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDelegateEqualsTableViewDataSource() {
        XCTAssertEqual(
            sut.tableView.delegate as? DataProvider,
            sut.tableView.dataSource as? DataProvider
        )
    }
}
