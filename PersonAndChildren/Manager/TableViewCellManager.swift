//
//  Children.swift
//  PersonAndChildren
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import UIKit

class TableViewCellManager {
    
    var vc: ViewController!
    lazy var tvm = vc.vm.tv.tvm
    init() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: ViewController.self))
        self.vc = vc as? ViewController
    }
    
    func removeChild(on indexPath: IndexPath) {
        tvm.isDeleting = true
        tvm.children.remove(at: indexPath.row)
        if tvm.children.count < 5 {
            vc.addButton.isEnabled = true
        }
        DispatchQueue.main.async {
            self.vc.tableView.reloadData()
            self.tvm.isDeleting = false
        }
    }
    
    func nameEditingChanged(on indexPath: IndexPath, with text: String) {
        if !tvm.isDeleting {
            tvm.children[indexPath.row].name = text
        }
    }
    
    func ageEditingChanged(on indexPath: IndexPath, with text: String) {
        if !tvm.isDeleting {
            tvm.children[indexPath.row].age = text
        }
    }
}
