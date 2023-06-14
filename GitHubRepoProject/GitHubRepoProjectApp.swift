//
//  GitHubRepoProjectApp.swift
//  GitHubRepoProject
//
//  Created by Shakhawat Hossain Shahin on 6/14/23.
//

import SwiftUI

@main
struct GitHubRepoProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
