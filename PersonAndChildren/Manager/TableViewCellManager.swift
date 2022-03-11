//
//  Children.swift
//  PersonAndChildren
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import UIKit

class TableViewCellManager {
    
    var vc: ViewController! 
    
    func removeChild(on indexPath: IndexPath) {
        let tvm = vc.vm.tv.tvm
        
        tvm.isDeleting = true
        tvm.children.remove(at: indexPath.row)
        if tvm.children.count < 5 {
            vc.addButton.isEnabled = true
        }
        DispatchQueue.main.async {
            self.vc.tableView.reloadData()
            tvm.isDeleting = false
        }
    }
    
    func nameEditingChanged(on indexPath: IndexPath, with text: String?) {
        let tvm = vc.vm.tv.tvm
        
        if !tvm.isDeleting {
            guard let text = text else { return }
            tvm.children[indexPath.row].name = text
        }
    }
    
    func ageEditingChanged(on indexPath: IndexPath, with text: String?) {
        let tvm = vc.vm.tv.tvm
        
        if !tvm.isDeleting {
            guard let text = text else { return }
            tvm.children[indexPath.row].age = text
        }
    }
}
