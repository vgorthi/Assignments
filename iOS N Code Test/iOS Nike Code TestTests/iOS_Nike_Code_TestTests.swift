//
//  iOS_Nike_Code_TestTests.swift
//  iOS Nike Code TestTests
//
//  Created by pavan krishna on 11/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import XCTest
@testable import iOS_Nike_Code_Test

class iOS_Nike_Code_TestTests: XCTestCase {
    
    var viewControllerUnderTest: ProductsListViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "ProductsListController") as! ProductsListViewController
        
//        self.viewControllerUnderTest.viewDidLoad()
        
        //load view hierarchy
        _ = viewControllerUnderTest.view
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSUT_TableViewIsNotNilAfterViewDidLoad() {
        
        XCTAssertNotNil(viewControllerUnderTest.productsTableView)
    }
    
    // Calling segue to transition to another ViewController by tapping a UICollectionView cell
    
    func testSUT_CanTransitionToTargetViewController_WhenTableViewCellTapped() {
        
        // declare mock
        class MockViewController: ProductsListViewController {
            
            var segueIdentifier: NSString?
            private func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
                segueIdentifier = identifier as NSString
            }
        }
        
        // instantiate mock
        let mockViewController = MockViewController()
        
        // assign a place array to mock (instead of calling network) - so the TableView has data
        let responseArray = [iOS_Nike_Code_Test.Product(productName: Optional("Nike Derek Fisher Jersey Shoes"), productPrice: Optional("200.00"), productThumbImageUrl: Optional("http://www.lakersuniverse.com/store/2010/shoes_nike_hyperize_bb.jpg"), productPrimaryImageUrl: Optional("http://www.lakersuniverse.com/store/2010/shoes_nike_hyperize_bb.jpg"), productColor: Optional("939")), iOS_Nike_Code_Test.Product(productName: Optional("Nike Air Max 2014 Women\'s Running Shoe"), productPrice: Optional("110.00"), productThumbImageUrl: Optional("https://s-media-cache-ak0.pinimg.com/736x/23/9d/3d/239d3d2cbe78c124a38df8a69691f97b.jpg"), productPrimaryImageUrl: Optional("https://s-media-cache-ak0.pinimg.com/736x/23/9d/3d/239d3d2cbe78c124a38df8a69691f97b.jpg"), productColor: Optional("939"))]
        
        mockViewController.productsArray = responseArray
        
        // simulate tapping table view cell
        mockViewController.tableView(viewControllerUnderTest.productsTableView, didSelectRowAt:NSIndexPath(row: 0, section: 0) as IndexPath)
        
        // confirm segue was called
        let expectedSegueIdentifier = Defines.imageSegueIdentifier // target segue identifier
        let actualSequeIdentifier = mockViewController.segueIdentifier
        XCTAssertEqual(expectedSegueIdentifier, actualSequeIdentifier! as String)
    }
}
