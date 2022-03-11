//
//  TableViewCell.swift
//  PersonAndChildren
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let tvcm = TableViewCellManager()
    
    var indexPath: IndexPath!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    
    @IBAction func removeChild(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        tvcm.removeChild(on: indexPath)
    }
    
    @IBAction func nameEditingChanged(_ sender: UITextField) {
        guard let indexPath = indexPath, let text = self.name.text else { return }
        tvcm.nameEditingChanged(on: indexPath, with: text)
    }

    @IBAction func ageEditingChanged(_ sender: UITextField) {
        guard let indexPath = indexPath, let text = self.age.text else { return }
        tvcm.ageEditingChanged(on: indexPath, with: text)
    }
}
