//
//  ContentView.swift
//  SmartSearchableList
//
//  Created by Aleksander Stojanowski
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State
    private var searchText = ""

    var body: some View {
        NavigationStack {
            ProductsListing(withName: searchText)
                .searchable(text: $searchText)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(DataHelper.shared.modelContainer)
}
