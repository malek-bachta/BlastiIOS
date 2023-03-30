//
//  BlastiApp.swift
//  Blasti
//
//  Created by MacOS on 29/3/2023.
//

import SwiftUI

@main
struct BlastiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Login()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
