//
//  DataStore.swift
//  Jym
//
//  Created by John Smith on 8/30/23.
//

import SwiftUI

@MainActor
class DataStore: ObservableObject {
    @Published var storedWorkoutDays: [WorkoutDay] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("storedWorkoutDays.data")
    }
    
    func load() async throws {
        let task = Task<[WorkoutDay], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let storedWorkoutDays_initial = try JSONDecoder().decode([WorkoutDay].self, from: data)
            return storedWorkoutDays_initial
        }
        let storedWorkoutDays = try await task.value
        self.storedWorkoutDays = storedWorkoutDays
    }
    
    func save(storedWorkoutDays: [WorkoutDay]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(storedWorkoutDays)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
