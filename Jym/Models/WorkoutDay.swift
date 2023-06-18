//
//  WorkoutDay.swift
//  Jym
//
//  Created by John Smith on 5/4/23.
//

import Foundation

// Struct for each workout day
struct WorkoutDay: Identifiable {
    let id: UUID
    var name: String
    var emoji: String
    var workouts: [Workout]
    
    

    init(id: UUID = UUID(), name: String, emoji: String, workouts: [Workout]) {
        self.id = id
        self.name = name
        self.emoji = emoji
        self.workouts = workouts
    }
}

extension WorkoutDay {
    static let records: [Record] = [
        Record(date: Date("2023-06-14"), weight: 90, reps: 10, sets: 4),
        Record(date: Date("2023-06-15"), weight: 100, reps: 10, sets: 4),
        Record(date: Date("2023-06-16"), weight: 110, reps: 10, sets: 4),
        Record(date: Date("2023-06-17"), weight: 120, reps: 10, sets: 4),
        Record(date: Date("2023-06-18"), weight: 120, reps: 10, sets: 4)
    ]
    static let sampleData: [WorkoutDay] =
    [
        WorkoutDay(name: "Back", emoji: "🎒", workouts: [
            Workout(name: "Cable Row", weight: 120, reps: 10, sets: 4, records: records),
            Workout(name: "Pull Ups", weight: 155, reps: 10, sets: 4, records: records),
            Workout(name: "Lat Pull Downs", weight: 120, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Shoulders", emoji: "🤷‍♂️", workouts: [
            Workout(name: "Dumbbell Shoulder Press", weight: 45, reps: 10, sets: 4, records: records),
            Workout(name: "Lateral Raises", weight: 20, reps: 10, sets: 4, records: records),
            Workout(name: "Bent Over Dumbbell Flies", weight: 20, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Legs", emoji: "🦵", workouts: [
            Workout(name: "Leg Press", weight: 205, reps: 10, sets: 4, records: records),
            Workout(name: "Leg Curls", weight: 75, reps: 10, sets: 4, records: records),
            Workout(name: "Leg Extensions", weight: 75, reps: 10, sets: 4, records: records),
            Workout(name: "Calf Raises", weight: 105, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Arms", emoji: "💪", workouts: [
            Workout(name: "Concentration Curls", weight: 30, reps: 10, sets: 4, records: records),
            Workout(name: "Tricep Kick-Back", weight: 17.5, reps: 10, sets: 4, records: records),
            Workout(name: "Triangle Pushups", weight: 155, reps: 15, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Back", emoji: "🎒", workouts: [
            Workout(name: "Cable Row", weight: 120, reps: 10, sets: 4, records: records),
            Workout(name: "Pull Ups", weight: 155, reps: 10, sets: 4, records: records),
            Workout(name: "Lat Pull Downs", weight: 120, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Shoulders", emoji: "🤷‍♂️", workouts: [
            Workout(name: "Dumbbell Shoulder Press", weight: 45, reps: 10, sets: 4, records: records),
            Workout(name: "Lateral Raises", weight: 20, reps: 10, sets: 4, records: records),
            Workout(name: "Bent Over Dumbbell Flies", weight: 20, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Legs", emoji: "🦵", workouts: [
            Workout(name: "Leg Press", weight: 205, reps: 10, sets: 4, records: records),
            Workout(name: "Leg Curls", weight: 75, reps: 10, sets: 4, records: records),
            Workout(name: "Leg Extensions", weight: 75, reps: 10, sets: 4, records: records),
            Workout(name: "Calf Raises", weight: 105, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Arms", emoji: "💪", workouts: [
            Workout(name: "Concentration Curls", weight: 30, reps: 10, sets: 4, records: records),
            Workout(name: "Tricep Kick-Back", weight: 17.5, reps: 10, sets: 4, records: records),
            Workout(name: "Triangle Pushups", weight: 155, reps: 15, sets: 4, records: records)
        ])
    ]
}




