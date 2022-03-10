//
//  TableViewController.swift
//  PersonAndChildren
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import UIKit

class TableView: UITableViewController {
    
    let tvHelper = TableViewHelper()

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvHelper.children.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TableViewCell

        cell.indexPath = indexPath
        cell.name.text = tvHelper.children[indexPath.row].name
        cell.age.text = tvHelper.children[indexPath.row].age
        
        return cell
    }
}
