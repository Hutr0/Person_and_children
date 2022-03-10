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
        sut = nil
        try super.tearDownWithError()
    }
    
    func testWhenViewIsLoadedTvIsNotNil() {
        XCTAssertNotNil(sut.tv)
    }
    
    func testWhenViewIsLoadedvHelperIsNotNil() {
        XCTAssertNotNil(sut.vHelper)
    }
    
    func testWhenViewIsLoadedTableViewIsNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertTrue(sut.tableView.delegate is TableView)
    }
    
    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is TableView)
    }
    
    func testWhenViewIsLoadedTableViewDelegateAndTableViewDataSourceIsSet() {
        XCTAssertEqual(sut.tableView.dataSource as? TableView,
                       sut.tableView.delegate as? TableView)
    }
    
    func testWhenAddChildWasPressedChildrenAddIntoArray() {
        XCTAssertEqual(sut.tv.tvHelper.children.count, 0)
        sut.addChild(UIButton())
        XCTAssertEqual(sut.tv.tvHelper.children.count, 1)
    }
    
    func testWhenClearCildrenWasPressedAllChildrenWasRemoved() {
        sut.addChild(UIButton())
        sut.addChild(UIButton())
        XCTAssertEqual(sut.tv.tvHelper.children.count, 2)
        sut.nameTF.text = "Имя"
        sut.ageTF.text = "Возраст"
        
        sut.clearChildren(UIButton())
        XCTAssertEqual(sut.tv.tvHelper.children.count, 0)
        XCTAssertEqual(sut.nameTF.text, "")
        XCTAssertEqual(sut.ageTF.text, "")
    }
    
    func testWhenNameEditingChangedWasTappedNameOfPersonIsSet() {
        sut.nameTF.text = "Имя"
        sut.addChild(UIButton())
        XCTAssertEqual(sut.nameTF.text, "Имя")
    }
    
    func testWhenAgeEditingChangedWasTappedAgeOfPersonIsSet() {
        sut.ageTF.text = "Возраст"
        sut.addChild(UIButton())
        XCTAssertEqual(sut.ageTF.text, "Возраст")
    }
    
    func testWhenAddedFiveChildrenAddButtonIsInactive() {
        XCTAssertTrue(sut.addButton.isEnabled)
        sut.addChild(UIButton())
        sut.addChild(UIButton())
        sut.addChild(UIButton())
        sut.addChild(UIButton())
        sut.addChild(UIButton())
        
        XCTAssertTrue(!sut.addButton.isEnabled)
    }
    
    func testWhenClearedAddButtonIsActive() {
        sut.addChild(UIButton())
        sut.addChild(UIButton())
        sut.addChild(UIButton())
        sut.addChild(UIButton())
        sut.addChild(UIButton())
        XCTAssertTrue(!sut.addButton.isEnabled)
        
        sut.clearChildren(UIButton())
        XCTAssertTrue(sut.addButton.isEnabled)
    }
}
