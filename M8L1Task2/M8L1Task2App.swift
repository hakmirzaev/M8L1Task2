//
//  M8L1Task2App.swift
//  M8L1Task2
//
//  Created by Bekhruz Hakmirzaev on 16/03/23.
//

import SwiftUI

@main
struct M8L1Task2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
