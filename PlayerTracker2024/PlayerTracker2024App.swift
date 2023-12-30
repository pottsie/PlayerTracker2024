//
//  PlayerTracker2024App.swift
//  PlayerTracker2024
//
//  Created by Michael Potts on 12/30/23.
//

import SwiftData
import SwiftUI

@main
struct PlayerTracker2024App: App {
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
    
    init() {
        let schema = Schema([Player.self])
        let config = ModelConfiguration("PlayerTracker2024", schema: schema)
        do {
            try container = ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not create container")
        }
//        let config = ModelConfiguration(url: URL.documentsDirectory.appending(path: "MyBooks.store"))
//        do {
//            try container = ModelContainer(for: Book.self, configurations: config)
//        } catch {
//            fatalError("Could not create container")
//        }
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
//        print(URL.documentsDirectory.path())
    }
}
