//
//  ProductsListing.swift
//  SmartSearchableList
//
//  Created by Aleksander Stojanowski
//

import SwiftData
import SwiftUI

struct ProductsListing: View {
    private let nonexistentProduct: Product
    @Query
    private var filteredProducts: [Product]

    private var showNewProduct: Bool {
        !nonexistentProduct.name.isEmpty && !filteredProducts.contains(where: { $0.name.localizedCaseInsensitiveCompare(nonexistentProduct.name) == .orderedSame })
    }

    init(withName searchText: String) {
        let sanitizedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        nonexistentProduct = Product(name: sanitizedSearchText)
        _filteredProducts = Query(
            filter: #Predicate {
                sanitizedSearchText.isEmpty || $0.name.localizedStandardContains(sanitizedSearchText)
            },
            sort: [SortDescriptor(\.name)],
            animation: .default
        )
    }

    var body: some View {
        List {
            if showNewProduct {
                Section {
                    ProductTile(nonexistentProduct)
                }
            }
            Section {
                ForEach(filteredProducts) {
                    ProductTile($0)
                }
            }
        }
        .animation(.default, value: filteredProducts)
        .animation(.default, value: nonexistentProduct)
    }
}
