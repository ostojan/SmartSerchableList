//
//  ProductsListing.swift
//  SmartSearchableList
//
//  Created by Aleksander Stojanowski
//

import SwiftData
import SwiftUI

struct ProductsListing: View {
    @Query
    private var filteredProducts: [Product]

    init(withName searchText: String) {
        let sanitizedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
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
            ForEach(filteredProducts) {
                ProductTile($0)
            }
        }
        .animation(.default, value: filteredProducts)
    }
}
