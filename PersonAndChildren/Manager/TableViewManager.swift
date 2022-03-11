//
//  Children.swift
//  PersonAndChildren
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import Foundation

class TableViewManager {
    var isDeleting = false
    var children: [Human] = []
    
    func configure(of cell: TableViewCell, indexPath: IndexPath) {
        cell.indexPath = indexPath
        cell.name.text = children[indexPath.row].name
        cell.age.text = children[indexPath.row].age
    }
}
