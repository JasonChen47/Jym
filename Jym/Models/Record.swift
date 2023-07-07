//
//  Record.swift
//  Jym
//
//  Created by John Smith on 5/25/23.
//

import Foundation

// Struct for workout record
struct Record: Identifiable, Equatable {
    let id: UUID
    var date: Date
    var weight: Double
    var reps: Int
    var sets: Int
    
    init(id: UUID = UUID(), date: Date, weight: Double, reps: Int, sets: Int) {
        self.id = id
        self.date = date
        self.weight = weight
        self.reps = reps
        self.sets = sets
    }
    static func == (lhs: Record, rhs: Record) -> Bool {
        return lhs.date == rhs.date && lhs.weight == rhs.weight
    }
}
