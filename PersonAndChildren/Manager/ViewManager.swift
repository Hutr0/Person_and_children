//
//  Children.swift
//  PersonAndChildren
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import UIKit

class ViewManager {
    let tv = TableView()
    
    var person: Human = Human()
    
    func setTableViewDelegateAndDataSource(to tableView: UITableView) {
        tableView.delegate = tv
        tableView.dataSource = tv
    }
    
    func addChild(completionHandler: @escaping ()->()) {
        tv.tvm.children.append(Human())
        completionHandler()
    }
    
    func removeAllChildren() {
        tv.tvm.children.removeAll()
    }
    
    func createAnAlert(completionHandler: @escaping ()->()) -> UIAlertController {
        let ac = UIAlertController(title: nil, message: "Сбросить все данные?", preferredStyle: .actionSheet)
        
        let okButton = UIAlertAction(title: "Сбросить данные", style: .destructive) { action in
            completionHandler()
        }
        let cancelButton = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        
        ac.addAction(okButton)
        ac.addAction(cancelButton)
        
        return ac
    }
}
