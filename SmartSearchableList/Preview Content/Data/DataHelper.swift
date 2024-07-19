//
//  DataHelper.swift
//  SmartSearchableList
//
//  Created by Aleksander Stojanowski
//

import SwiftData

@MainActor
final class DataHelper {
    static let shared = DataHelper()

    private(set) var modelContainer: ModelContainer

    private init() {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            modelContainer = try ModelContainer(for: Product.self, configurations: config)
            for productIdx in 1 ... 10 {
                modelContainer.mainContext.insert(Product(name: "Product \(productIdx)"))
            }
        } catch {
            fatalError("Couldn't create model container for Previews")
        }
    }
}
