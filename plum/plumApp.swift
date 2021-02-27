//
//  plumApp.swift
//  plum
//
//  Created by /fam on 2/19/21.
//

import SwiftUI

@main
struct plumApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
