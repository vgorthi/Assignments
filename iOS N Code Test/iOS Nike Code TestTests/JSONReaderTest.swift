//
//  JSONReaderTest.swift
//  iOS Nike Code Test
//
//  Created by pavan krishna on 11/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import XCTest
@testable import iOS_Nike_Code_Test

class JSONReaderTest: XCTestCase {
    
    var systemUnderTest : DataRequest? = nil

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        systemUnderTest = DataRequest()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSUT_CanInstantiateJSONReader() {
        systemUnderTest = DataRequest()
        XCTAssertNotNil(systemUnderTest)
    }
    
    func testSUT_CanFetchJSONFileFromMainBundleAsString() {
        
        let dataFromFile = DataRequest().fetchJSONAsStringFromMainBundleWithFileName(filename: "productList")
        let numberOfCharacters = dataFromFile.count
        XCTAssertGreaterThan(numberOfCharacters, 0)
    }
    
    func testSUT_CanHandleFileNotFoundWhenFetchingString() {
        
        let nameOfFileNotInBundle = "nofile"
        let dataFromFile = DataRequest().fetchJSONAsStringFromMainBundleWithFileName(filename: nameOfFileNotInBundle)
        let numberOfCharacters = dataFromFile.count
        XCTAssertEqual(numberOfCharacters, 0)
    }
    
}
