//
//  iOS_AssignmentTests.swift
//  iOS AssignmentTests
//
//  Created by pavan krishna on 22/07/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import XCTest

@testable import iOS_Assignment

class iOS_AssignmentTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testExample() {
        let expectation = expectationWithDescription("Alamofire")
        
        Alamofire.request(.GET, urlString)
            .response { request, response, data, error in
                XCTAssertNil(error, "Whoops, error \(error)")
                
                XCTAssertEqual(response?.statusCode, 200, "Status code not 200")
                
                expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5.0, handler: nil)
    }
    
}
