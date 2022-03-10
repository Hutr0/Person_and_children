//
//  ViewController.swift
//  PersonAndChildren
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let tv = TableView()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = tv
        tableView.dataSource = tv
    }
    
    @IBAction func addChild(_ sender: UIButton) {
        tv.tvHelper.children.append(Child())
    }
    
    @IBAction func clearChildren(_ sender: UIButton) {
        tv.tvHelper.children.removeAll()
        tableView.reloadData()
    }
}

