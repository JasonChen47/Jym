//
//  JymApp.swift
//  Jym
//
//  Created by John Smith on 5/4/23.
//

import SwiftUI

@main
struct JymApp: App {
    
    @State var workoutDays = WorkoutDay.sampleData // To replace the stored data in case of debugging
    @StateObject private var store = DataStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            WorkoutTabView(workoutDays: $store.storedWorkoutDays) {
                Task {
                    do {
                        try await store.save(storedWorkoutDays: store.storedWorkoutDays)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
