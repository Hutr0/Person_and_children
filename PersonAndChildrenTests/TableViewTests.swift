//
//  TableView.swift
//  PersonAndChildrenTests
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import XCTest
@testable import PersonAndChildren

class TableViewTests: XCTestCase {
    
    var vc: ViewController!
    var sut: UITableView!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: String(describing: ViewController.self)) as? ViewController
        
        vc.loadViewIfNeeded()
        
        sut = vc.tableView
    }

    override func tearDownWithError() throws {
        vc = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    func testWhenTableViewIsLoadedTvHelperIsNotNil() {
        XCTAssertNotNil(vc.vm.tv.tvm)
    }
    
    func testCountOfSection() {
        XCTAssertEqual(sut.numberOfSections, 1)
    }
    
//    func testCountOfRowsEqualsCountOfArray() {
//        XCTAssertEqual(sut.numberOfRows(inSection: 0), 0)
//        vc.addChild(UIButton())
//        vc.addChild(UIButton())
//        XCTAssertEqual(sut.numberOfRows(inSection: 0), 2)
//        vc.clearChildren(UIButton())
//        XCTAssertEqual(sut.numberOfRows(inSection: 0), 0)
//    }
}
