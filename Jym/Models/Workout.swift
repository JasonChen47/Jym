//
//  Workout.swift
//  Jym
//
//  Created by John Smith on 5/4/23.
//

import Foundation

// Struct for each workout
struct Workout: Identifiable {
    let id: UUID
    var name: String
    var weight: Double
    var reps: Int
    var sets: Int
    var records: [Record]
    
    init(id: UUID = UUID(), name: String, weight: Double, reps: Int, sets: Int, records: [Record]) {
        self.id = id
        self.name = name
        self.weight = weight
        self.reps = reps
        self.sets = sets
        self.records = records
    }
}



