//
//  TaskTests.swift
//  ToDoAppTests
//
//  Created by Кефир Кефирчик on 02.04.2023.
//

import XCTest
@testable import ToDoApp

final class TaskTests: XCTestCase {

    func testInitTaskWithTitle() {
        let task = Task(title: "Foo")
        
        XCTAssertNotNil(task)
    }
    
    func testInitTaskWithTitleAndDescription() {
        let task = Task(title: "Foo", description: "Bar")
        
        XCTAssertNotNil(task)
    }
    
    func testWhenGivenTitlesetsTitle() {
        let task = Task(title: "Foo")
        
        XCTAssertEqual(task.title, "Foo")
        
    }
    
    func testWhenGivenDescriptionSetsDescription() {
        let task = Task(title: "Foo", description: "Bar")
        
        XCTAssertTrue(task.description == "Bar")
//        XCTAssertEqual(task.description, "Bar") 2-й способ
    }
    
    func testTaskInitsWitsWithDate() {
        let task = Task(title: "Foo")
        XCTAssertNotNil(task.date)
    }
    
    func testWhenGivenLocationsetsLocation() {
        let location = Location(name: "Foo")
        
        let task = Task(title: "Bar",
                        description: "Baz",
                        location: location)
        
        XCTAssertEqual(location, task.location)
    }
}
