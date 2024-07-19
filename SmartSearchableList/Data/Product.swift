//
//  Product.swift
//  SmartSearchableList
//
//  Created by Aleksander Stojanowski
//

import SwiftData

@Model
final class Product {
    var name: String = ""
    var checked: Bool = false

    init(name: String, checked: Bool = false) {
        self.name = name
        self.checked = checked
    }
}
