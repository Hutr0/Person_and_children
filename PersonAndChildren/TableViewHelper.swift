//
//  Children.swift
//  PersonAndChildren
//
//  Created by Леонид Лукашевич on 10.03.2022.
//

import Foundation

class TableViewHelper {
    var children: [Child] = []
}

struct Child {
    var name: String
    var age: String
    
    init(name: String = "", age: String = "") {
        self.name = name
        self.age = age
    }
}
