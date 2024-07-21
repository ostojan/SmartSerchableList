//
//  ProductTile.swift
//  SmartSearchableList
//
//  Created by Aleksander Stojanowski
//

import SwiftData
import SwiftUI

struct ProductTile: View {
    @Environment(\.modelContext)
    private var modelContext: ModelContext
    private let product: Product

    init(_ product: Product) {
        self.product = product
    }

    var body: some View {
        Button {
            product.checked.toggle()
            if product.modelContext == nil {
                modelContext.insert(product)
            }
        } label: {
            Label(product.name, systemImage: product.checked ? "checkmark.circle" : "circle")
        }
    }
}
