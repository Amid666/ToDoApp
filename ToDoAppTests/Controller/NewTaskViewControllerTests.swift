//
//  NewTaskViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Кефир Кефирчик on 15.04.2023.
//

import XCTest
import CoreLocation
@testable import ToDoApp

final class NewTaskViewControllerTests: XCTestCase {
    
    var sut: NewTaskViewController!
    var placemark: MockCLPlacemark!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: String(describing: NewTaskViewController.self)) as? NewTaskViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHasTitleTextFild() {
        XCTAssertTrue(sut.titleTextField.isDescendant(of: sut.view))
    }
    
    func testHasLocationTextField() {
        XCTAssertTrue(sut.locationTextField.isDescendant(of: sut.view))
    }
    func testHasAdressTextField() {
        XCTAssertTrue(sut.addressTextField.isDescendant(of: sut.view))
    }
    
    func testHasDescriptionTextField() {
        XCTAssertTrue(sut.descriptionTextField.isDescendant(of: sut.view))
    }
    
    func testHasDateTextField() {
        XCTAssertTrue(sut.dateTextField.isDescendant(of: sut.view))
    }
    
    func testHasSaveButton() {
        XCTAssertTrue(sut.saveButton.isDescendant(of: sut.view))
    }
    
    func testHasCancelButton() {
        XCTAssertTrue(sut.cancelButton.isDescendant(of: sut.view))
    }
    
    //    func testSaveUsesGeocoderToConvertCoordinateFromAddress() {
    //        let df = DateFormatter()
    //        df.dateFormat = "dd.MM.yy"
    //       let date = df.date(from: "15.04.23")
    //
    //        sut.titleTextField.text = "Foo"
    //        sut.locationTextField.text = "Bar"
    //        sut.dateTextField.text = "15.04.23"
    //        sut.addressTextField.text = "Киев"
    //        sut.descriptionTextField.text = "Baz"
    //
    //        sut.taskManager = TaskManager()
    //        let mockGeocoder = MockCLGeocoder()
    //        sut.geocoder = mockGeocoder
    //        sut.save()
    //
    //        let coordinate = CLLocationCoordinate2D(latitude: 50.42929, longitude: 30.53806)
    //        let location = Location(name: "Bar", coordinate: coordinate )
    //        let generatedTask = Task(title: "Foo", description: "Bar", date: date, location: location)
    //
    //        placemark = MockCLPlacemark()
    //        placemark.mockCoordinate = coordinate
    //        mockGeocoder.completionHandler?([placemark], nil)
    //
    //        let task = sut.taskManager.task(at: 0)
    //
    //        XCTAssertEqual(task, generatedTask)
    //    }
    
    func testSaveButtonSaveMethod() {
        let saveButton = sut.saveButton
        
        guard let actions = saveButton?.actions(forTarget: sut, forControlEvent: .touchUpInside) else { XCTFail()
            return
        }
        
        XCTAssertTrue(actions.contains("save"))
    }
    
    func testGeocoderFetchesCorrctCoordinate() {
        let geocoderAnswer = expectation(description: "Geocoder answer")
        let addressString = "Киев"
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { placemarks, error in
            
            let placemark = placemarks?.first
            let location = placemark?.location
            
            guard
                let latitude = location?.coordinate.latitude,
                let longitude = location?.coordinate.longitude else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(latitude, 50.42929)
            XCTAssertEqual(longitude, 30.53806)
            geocoderAnswer.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testSaveDismissesNewTaskViewController() {
        let mockNewTaskViewController = MockNewTaskViewController()
        mockNewTaskViewController.titleTextField = UITextField()
        mockNewTaskViewController.titleTextField.text = "Foo"
        mockNewTaskViewController.descriptionTextField = UITextField()
        mockNewTaskViewController.titleTextField.text = "Bar"
        mockNewTaskViewController.locationTextField = UITextField()
        mockNewTaskViewController.titleTextField.text = "Baz"
        mockNewTaskViewController.addressTextField = UITextField()
        mockNewTaskViewController.titleTextField.text = "Киев"
        mockNewTaskViewController.dateTextField = UITextField()
        mockNewTaskViewController.titleTextField.text = "25.04.19"
        
        // when
        mockNewTaskViewController.save()
        
        // then
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            XCTAssertTrue(mockNewTaskViewController.isDismissed)
        }
    }
}
    extension NewTaskViewControllerTests {
        class MockCLGeocoder: CLGeocoder {
            
            var completionHandler: CLGeocodeCompletionHandler?
            
            override func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
                self.completionHandler = completionHandler
            }
        }
    
    
    class MockCLPlacemark: CLPlacemark {
        
        var mockCoordinate: CLLocationCoordinate2D!
        
        override var location: CLLocation? {
            return CLLocation(latitude: mockCoordinate.latitude, longitude: mockCoordinate.longitude)
        }
    }
}

extension NewTaskViewControllerTests {
    
    class MockNewTaskViewController: NewTaskViewController {
        var isDismissed = false
        
        override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
            isDismissed = true
        }
    }
}
