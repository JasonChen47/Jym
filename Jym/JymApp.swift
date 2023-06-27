//
//  JymApp.swift
//  Jym
//
//  Created by John Smith on 5/4/23.
//

import SwiftUI

@main
struct JymApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                WorkoutTabView()
            }
        }
    }
}
