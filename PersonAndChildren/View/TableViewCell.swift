//
//  TableViewCell.swift
//  PersonAndChildren
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    lazy var vc = window?.rootViewController as! ViewController
    
    var indexPath: IndexPath!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    
    @IBAction func removeChild(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        
        vc.tv.tvHelper.isDeleting = true
        vc.tv.tvHelper.children.remove(at: indexPath.row)
        if vc.tv.tvHelper.children.count < 5 {
            vc.addButton.isEnabled = true
        }
        DispatchQueue.main.async {
            self.vc.tableView.reloadData()
            self.vc.tv.tvHelper.isDeleting = false
        }
    }
    
    @IBAction func nameEditingChanged(_ sender: UITextField) {
        if !vc.tv.tvHelper.isDeleting {
            guard let indexPath = indexPath, let text = self.name.text else { return }
            
            vc.tv.tvHelper.children[indexPath.row].name = text
        }
    }

    @IBAction func ageEditingChanged(_ sender: UITextField) {
        if !vc.tv.tvHelper.isDeleting {
            guard let indexPath = indexPath, let text = self.age.text else { return }

            vc.tv.tvHelper.children[indexPath.row].age = text
        }
    }
}
