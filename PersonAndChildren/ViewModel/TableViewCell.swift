//
//  TableViewCell.swift
//  PersonAndChildren
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    lazy var vc = window?.rootViewController as? ViewController
    let tvcm = TableViewCellManager()
    
    var indexPath: IndexPath!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    
    @IBAction func removeChild(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        tvcm.vc = vc
        tvcm.removeChild(on: indexPath)
    }
    
    @IBAction func nameEditingChanged(_ sender: UITextField) {
        tvcm.vc = vc
        tvcm.nameEditingChanged(on: indexPath, with: name.text)
    }

    @IBAction func ageEditingChanged(_ sender: UITextField) {
        tvcm.vc = vc
        tvcm.ageEditingChanged(on: indexPath, with: age.text)
    }
}
