//
//  TableView.swift
//  PersonAndChildrenTests
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import XCTest
@testable import PersonAndChildren

class ViewControllerTests: XCTestCase {
    
    var sut: ViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: ViewController.self))
        sut = vc as? ViewController
        
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        
    }
    
    func testWhenViewIsLoadedTvIsNotNil() {
        XCTAssertNotNil(sut.tv)
    }
    
    func testWhenViewIsLoadedTableViewIsNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testTableViewDelegateIsTv() {
        XCTAssertTrue(sut.tableView.delegate is TableView)
    }
}
