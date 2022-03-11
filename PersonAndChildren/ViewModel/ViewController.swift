//
//  ViewController.swift
//  PersonAndChildren
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let vm = ViewManager()
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.setTableViewDelegateAndDataSource(to: tableView)
    }
    
    @IBAction func addChild(_ sender: UIButton) {
        vm.addChild {
            self.tableView.reloadData()
            if self.tableView.numberOfRows(inSection: 0) >= 5 {
                self.addButton.isEnabled = false
            }
        }
    }
    
    @IBAction func clearChildren(_ sender: UIButton) {
        let ac = vm.createAnAlert {
            self.vm.removeAllChildren()
            self.nameTF.text = ""
            self.ageTF.text = ""
            
            self.tableView.reloadData()
            self.addButton.isEnabled = true
        }
        present(ac, animated: true, completion: nil)
    }
    
    @IBAction func nameEditingChanged(_ sender: UITextField) {
            guard let text = self.nameTF.text else { return }
            vm.person.name = text
    }
    
    @IBAction func ageEditingChanged(_ sender: UITextField) {
            guard let text = self.ageTF.text else { return }
            vm.person.age = text
    }
}

