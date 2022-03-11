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
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = tv
        tableView.dataSource = tv
    }
    
    @IBAction func addChild(_ sender: UIButton) {
        tv.tvHelper.children.append(Child())
        tableView.reloadData()
        
        if tableView.numberOfRows(inSection: 0) >= 5 {
            addButton.isEnabled = false
        }
    }
    
    @IBAction func clearChildren(_ sender: UIButton) {
        let ac = UIAlertController(title: "Сброс", message: "Сбросить все данные?", preferredStyle: .actionSheet)
        
        let okButton = UIAlertAction(title: "Сбросить данные", style: .destructive) { action in
            self.tv.tvHelper.children.removeAll()
            self.nameTF.text = ""
            self.ageTF.text = ""
            
            self.tableView.reloadData()
            self.addButton.isEnabled = true
        }
        let cancelButton = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        
        ac.addAction(okButton)
        ac.addAction(cancelButton)
        
        present(ac, animated: true, completion: nil)
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

