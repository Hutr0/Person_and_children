//
//  ViewController.swift
//  PersonAndChildren
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let tv = TableView()
    let vHelper = ViewHelper()
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = tv
        tableView.dataSource = tv
    }
    
    @IBAction func addChild(_ sender: UIButton) {
        tv.tvHelper.children.append(Child())
        tableView.reloadData()
    }
    
    @IBAction func clearChildren(_ sender: UIButton) {
        tv.tvHelper.children.removeAll()
        tableView.reloadData()
    }
    
    @IBAction func nameEditingChanged(_ sender: UITextField) {
        guard let text = self.nameTF.text else { return }
        
        vHelper.person.name = text
    }
    
    @IBAction func ageEditingChanged(_ sender: UITextField) {
        guard let text = self.ageTF.text else { return }
        
        vHelper.person.age = text
    }
}

