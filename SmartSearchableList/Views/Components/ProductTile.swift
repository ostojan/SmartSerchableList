//
//  ProductTile.swift
//  SmartSearchableList
//
//  Created by Aleksander Stojanowski
//

import SwiftUI

struct ProductTile: View {
    private let product: Product

    init(_ product: Product) {
        self.product = product
    }

    var body: some View {
        Button {
            product.checked.toggle()
        } label: {
            Label(product.name, systemImage: product.checked ? "checkmark.circle" : "circle")
        }
    }
}
