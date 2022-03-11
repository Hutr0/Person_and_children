//
//  TableViewCellTests.swift
//  PersonAndChildrenTests
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import XCTest
@testable import PersonAndChildren

class TableViewCellTests: XCTestCase {
    
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
    
    func testWhenRemoveChildWasPressedElementOfChildrenArrayWasRemoved() {
        sut.addChild(UIButton())
        XCTAssertEqual(sut.vm.tv.tvm.children.count, 1)
        
        let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TableViewCell
        cell?.tvcm.vc = sut
        cell?.removeChild(UIButton())
        
        XCTAssertEqual(sut.vm.tv.tvm.children.count, 0)
    }
    
    func testWhenNameEditingChangedWasTappedNameOfChildInArrayIsSet() {
        sut.addChild(UIButton())
        XCTAssertEqual(sut.vm.tv.tvm.children.count, 1)
        
        let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TableViewCell
        cell?.tvcm.vc = sut
        cell?.name.text = "Имя"
        cell?.nameEditingChanged((cell?.name)!)
        
        XCTAssertEqual(sut.vm.tv.tvm.children[0].name, "Имя")
    }
    
    func testWhenAgeEditingChangedWasTappedAgeOfChildInArrayIsSet() {
        sut.addChild(UIButton())
        XCTAssertEqual(sut.vm.tv.tvm.children.count, 1)
        
        let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TableViewCell
        cell?.tvcm.vc = sut
        cell?.age.text = "Возраст"
        cell?.ageEditingChanged((cell?.age)!)
        
        XCTAssertEqual(sut.vm.tv.tvm.children[0].age, "Возраст")
    }
    
    func testWhenViewIsLoadedParametersFromArrayIsSet() {
        sut.addChild(UIButton())
        sut.addChild(UIButton())
        XCTAssertEqual(sut.vm.tv.tvm.children.count, 2)
        
        var cell = sut.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TableViewCell
        cell?.tvcm.vc = sut
        cell?.age.text = "Возраст"
        cell?.ageEditingChanged((cell?.age)!)
        cell?.name.text = "Имя"
        cell?.nameEditingChanged((cell?.name)!)
        
        sut.tableView.reloadData()
        cell = sut.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TableViewCell
        
        XCTAssertEqual(cell?.name.text, "Имя")
        XCTAssertEqual(cell?.age.text, "Возраст")
        XCTAssertEqual(cell?.indexPath, IndexPath(row: 1, section: 0))
        
        cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TableViewCell
        
        XCTAssertEqual(cell?.name.text, "")
        XCTAssertEqual(cell?.age.text, "")
        XCTAssertEqual(cell?.indexPath, IndexPath(row: 0, section: 0))
    }
    
    func testWhenFiveChildrenLostOneAddButtonOnViewControllerIsActive() {
        sut.addChild(UIButton())
        sut.addChild(UIButton())
        sut.addChild(UIButton())
        sut.addChild(UIButton())
        sut.addChild(UIButton())
        XCTAssertTrue(!sut.addButton.isEnabled)
        
        let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TableViewCell
        cell?.tvcm.vc = sut
        
        cell?.removeChild(UIButton())
        XCTAssertTrue(sut.addButton.isEnabled)
    }
}
