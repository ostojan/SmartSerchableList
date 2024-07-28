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

    private var searchText: String {
        nonexistentProduct.name
    }

    private var indexOfSearchProduct: Int? {
        filteredProducts.firstIndex(where: { $0.name.localizedCaseInsensitiveCompare(searchText) == .orderedSame })
    }

    private var showNewProduct: Bool {
        !searchText.isEmpty
    }

    private var productsToShow: [Product] {
        var products = filteredProducts
        if let indexOfSearchProduct {
            products.move(fromOffsets: IndexSet(integer: indexOfSearchProduct), toOffset: 0)
        } else if showNewProduct {
            products.insert(nonexistentProduct, at: 0)
        }
        return products
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
            ForEach(productsToShow) {
                ProductTile($0)
            }
        }
        .animation(.default, value: productsToShow)
    }
}
