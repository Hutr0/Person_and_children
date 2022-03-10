//
//  TableViewCell.swift
//  PersonAndChildren
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    lazy var vc = window?.rootViewController as! ViewController
    lazy var indexPath = vc.tableView.indexPath(for: self)
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    
    @IBAction func removeChild(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        
        vc.tv.tvHelper.children.remove(at: indexPath.row)
        DispatchQueue.main.async {
            self.vc.tableView.reloadData()
        }
    }
    
    @IBAction func nameEditingDidEnd(_ sender: UITextField) {
        guard let indexPath = indexPath else { return }

        vc.tv.tvHelper.children[indexPath.row].name = self.name.text ?? ""
    }
    
    @IBAction func ageEditingDidEnd(_ sender: UITextField) {
        guard let indexPath = indexPath else { return }
        
        vc.tv.tvHelper.children[indexPath.row].age = self.age.text ?? ""
    }
}
