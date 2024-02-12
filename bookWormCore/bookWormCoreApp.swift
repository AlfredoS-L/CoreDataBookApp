//
//  bookWormCoreApp.swift
//  bookWormCore
//
//  Created by Alfredo Sandoval-Luis on 1/31/24.
//

import SwiftUI

@main
struct bookWormCoreApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
