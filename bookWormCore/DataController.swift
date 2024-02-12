//
//  DataController.swift
//  bookWormCore
//
//  Created by Alfredo Sandoval-Luis on 1/31/24.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "bookWormCore")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
