//
//  WorkoutDay.swift
//  Jym
//
//  Created by John Smith on 5/4/23.
//

import Foundation

// Struct for each workout day
struct WorkoutDay: Identifiable, Codable {
    let id: UUID
    var name: String
    var emoji: String
    var streak: Int
    var lastWorkoutDay: Date
    var workouts: [Workout]

    init(id: UUID = UUID(), name: String, emoji: String, streak: Int, lastWorkoutDay: Date, workouts: [Workout]) {
        self.id = id
        self.name = name
        self.emoji = emoji
        self.streak = streak
        self.lastWorkoutDay = lastWorkoutDay
        self.workouts = workouts
    }
    
    static var emptyWorkoutDay: WorkoutDay {
        WorkoutDay(name: "", emoji: "", streak: 0, lastWorkoutDay: Date.now, workouts: [])
//        WorkoutDay(name: "hi", emoji: "o", streak: 0, lastWorkoutDay: Date.now, workouts: [WorkoutDay.sampl])
    }
}

//extension WorkoutDay: Hashable {
//    var identifier: String {
//        return UUID().uuidString
//    }
//    public func hash(into hasher: inout Hasher) {
//        return hasher.combine(identifier)
//    }
//    public static func == (lhs: WorkoutDay, rhs: WorkoutDay) -> Bool {
//        return lhs.identifier == rhs.identifier
//    }
//}

extension WorkoutDay {
    static let records3: [Record] = [
        Record(date: Date.now, weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-6 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-10 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-20 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-30 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
    ]
    static let records2: [Record] = [
        Record(date: Date.now, weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-6 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-14 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
    ]
    static let records: [Record] = [
        Record(date: Date("2023-01-08"), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-02-08"), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-06-02"), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-06-02"), weight: 85, reps: 10, sets: 4),
        Record(date: Date("2023-06-03"), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-06-04"), weight: 85, reps: 10, sets: 4),
        Record(date: Date("2023-06-05"), weight: 85, reps: 10, sets: 4),
        Record(date: Date("2023-06-06"), weight: 90, reps: 10, sets: 4),
        Record(date: Date("2023-06-07"), weight: 90, reps: 10, sets: 4),
        Record(date: Date("2023-06-08"), weight: 90, reps: 10, sets: 4),
        Record(date: Date("2023-06-09"), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-06-10"), weight: 85, reps: 10, sets: 4),
        Record(date: Date("2023-06-11"), weight: 85, reps: 10, sets: 4),
        Record(date: Date("2023-06-12"), weight: 90, reps: 10, sets: 5),
        Record(date: Date("2023-06-13"), weight: 90, reps: 10, sets: 4),
        Record(date: Date("2023-06-14"), weight: 90, reps: 10, sets: 4),
        Record(date: Date("2023-06-15"), weight: 100, reps: 10, sets: 4),
        Record(date: Date("2023-06-16"), weight: 110, reps: 10, sets: 4),
        Record(date: Date("2023-06-17"), weight: 120, reps: 10, sets: 4),
        Record(date: Date("2023-06-18"), weight: 120, reps: 10, sets: 4),
        Record(date: Date("2023-06-19"), weight: 120, reps: 10, sets: 4),
        Record(date: Date("2023-06-20"), weight: 120, reps: 10, sets: 4),
        Record(date: Date("2023-06-21"), weight: 125, reps: 10, sets: 4),
        Record(date: Date("2023-06-22"), weight: 120, reps: 10, sets: 4),
        Record(date: Date("2023-06-23"), weight: 125, reps: 10, sets: 4),
        Record(date: Date("2023-06-24"), weight: 125, reps: 10, sets: 4),
        Record(date: Date("2023-06-25"), weight: 125, reps: 10, sets: 4),
        Record(date: Date("2023-06-26"), weight: 130, reps: 10, sets: 4),
        Record(date: Date("2023-06-27"), weight: 130, reps: 10, sets: 4),
        Record(date: Date("2023-06-28"), weight: 130, reps: 10, sets: 4),
        Record(date: Date("2023-06-29"), weight: 120, reps: 10, sets: 4),
        Record(date: Date("2023-06-30"), weight: 125, reps: 10, sets: 4),
        Record(date: Date("2023-07-01"), weight: 120, reps: 10, sets: 4),
        Record(date: Date("2023-07-02"), weight: 125, reps: 10, sets: 4),
        Record(date: Date("2023-07-03"), weight: 125, reps: 10, sets: 4),
        Record(date: Date("2023-07-04"), weight: 125, reps: 10, sets: 4),
        Record(date: Date("2023-07-05"), weight: 130, reps: 10, sets: 4),
        Record(date: Date("2024-01-05"), weight: 130, reps: 10, sets: 4)
    ]
    static let sampleData: [WorkoutDay] =
    [
        WorkoutDay(name: "Back", emoji: "🎒", streak: 9, lastWorkoutDay: Date().addingTimeInterval(-86400), workouts: [
            Workout(name: "Cable Row", weight: 120, reps: 10, sets: 4, records: records),
            Workout(name: "Pull Ups", weight: 155, reps: 10, sets: 4, records: records),
            Workout(name: "Lat Pull Downs", weight: 120, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Shoulders", emoji: "🤷‍♂️", streak: 7, lastWorkoutDay: Date.now, workouts: [
            Workout(name: "Dumbbell Shoulder Press", weight: 45, reps: 10, sets: 4, records: records2),
            Workout(name: "Lateral Raises", weight: 20, reps: 10, sets: 4, records: records),
            Workout(name: "Bent Over Dumbbell Flies", weight: 20, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Legs", emoji: "🦵", streak: 5, lastWorkoutDay: Date("2023-07-03"), workouts: [
            Workout(name: "Leg Press", weight: 205, reps: 10, sets: 4, records: records3),
            Workout(name: "Leg Curls", weight: 75, reps: 10, sets: 4, records: records),
            Workout(name: "Leg Extensions", weight: 75, reps: 10, sets: 4, records: records),
            Workout(name: "Calf Raises", weight: 105, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Arms", emoji: "💪", streak: 4, lastWorkoutDay: Date("2023-06-26"), workouts: [
            Workout(name: "Concentration Curls", weight: 30, reps: 10, sets: 4, records: records),
            Workout(name: "Tricep Kick-Back", weight: 17.5, reps: 10, sets: 4, records: records),
            Workout(name: "Triangle Pushups", weight: 155, reps: 15, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Back", emoji: "🎒", streak: 3, lastWorkoutDay: Date("2023-06-26"), workouts: [
            Workout(name: "Cable Row", weight: 120, reps: 10, sets: 4, records: records),
            Workout(name: "Pull Ups", weight: 155, reps: 10, sets: 4, records: records),
            Workout(name: "Lat Pull Downs", weight: 120, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Shoulders", emoji: "🤷‍♂️", streak: 3, lastWorkoutDay: Date("2022-12-26"), workouts: [
            Workout(name: "Dumbbell Shoulder Press", weight: 45, reps: 10, sets: 4, records: records),
            Workout(name: "Lateral Raises", weight: 20, reps: 10, sets: 4, records: records),
            Workout(name: "Bent Over Dumbbell Flies", weight: 20, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Legs", emoji: "🦵", streak: 3, lastWorkoutDay: Date("2022-12-26"), workouts: [
            Workout(name: "Leg Press", weight: 205, reps: 10, sets: 4, records: records),
            Workout(name: "Leg Curls", weight: 75, reps: 10, sets: 4, records: records),
            Workout(name: "Leg Extensions", weight: 75, reps: 10, sets: 4, records: records),
            Workout(name: "Calf Raises", weight: 105, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Arms", emoji: "💪", streak: 3, lastWorkoutDay: Date("2022-12-26"), workouts: [
            Workout(name: "Concentration Curls", weight: 30, reps: 10, sets: 4, records: records),
            Workout(name: "Tricep Kick-Back", weight: 17.5, reps: 10, sets: 4, records: records),
            Workout(name: "Triangle Pushups", weight: 155, reps: 15, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Shoulders", emoji: "🤷‍♂️", streak: 3, lastWorkoutDay: Date("2022-12-26"), workouts: [
            Workout(name: "Dumbbell Shoulder Press", weight: 45, reps: 10, sets: 4, records: records),
            Workout(name: "Lateral Raises", weight: 20, reps: 10, sets: 4, records: records),
            Workout(name: "Bent Over Dumbbell Flies", weight: 20, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Legs", emoji: "🦵", streak: 3, lastWorkoutDay: Date("2022-12-26"), workouts: [
            Workout(name: "Leg Press", weight: 205, reps: 10, sets: 4, records: records),
            Workout(name: "Leg Curls", weight: 75, reps: 10, sets: 4, records: records),
            Workout(name: "Leg Extensions", weight: 75, reps: 10, sets: 4, records: records),
            Workout(name: "Calf Raises", weight: 105, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Arms", emoji: "💪", streak: 3, lastWorkoutDay: Date("2022-12-26"), workouts: [
            Workout(name: "Concentration Curls", weight: 30, reps: 10, sets: 4, records: records),
            Workout(name: "Tricep Kick-Back", weight: 17.5, reps: 10, sets: 4, records: records),
            Workout(name: "Triangle Pushups", weight: 155, reps: 15, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Shoulders", emoji: "🤷‍♂️", streak: 3, lastWorkoutDay: Date("2022-12-26"), workouts: [
            Workout(name: "Dumbbell Shoulder Press", weight: 45, reps: 10, sets: 4, records: records),
            Workout(name: "Lateral Raises", weight: 20, reps: 10, sets: 4, records: records),
            Workout(name: "Bent Over Dumbbell Flies", weight: 20, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Legs", emoji: "🦵", streak: 3, lastWorkoutDay: Date("2022-12-26"), workouts: [
            Workout(name: "Leg Press", weight: 205, reps: 10, sets: 4, records: records),
            Workout(name: "Leg Curls", weight: 75, reps: 10, sets: 4, records: records),
            Workout(name: "Leg Extensions", weight: 75, reps: 10, sets: 4, records: records),
            Workout(name: "Calf Raises", weight: 105, reps: 10, sets: 4, records: records)
        ]),
        WorkoutDay(name: "Arms", emoji: "💪", streak: 3, lastWorkoutDay: Date("2022-12-26"), workouts: [
            Workout(name: "Concentration Curls", weight: 30, reps: 10, sets: 4, records: records),
            Workout(name: "Tricep Kick-Back", weight: 17.5, reps: 10, sets: 4, records: records),
            Workout(name: "Triangle Pushups", weight: 155, reps: 15, sets: 4, records: records)
        ])
    ]
}

//extension WorkoutDay {
//    struct Workout: Identifiable, Codable {
//        let id: UUID
//        var name: String
//        var weight: Double
//        var reps: Double
//        var sets: Double
//        var records: [Record]
//        
//        init(id: UUID = UUID(), name: String, weight: Double, reps: Double, sets: Double, records: [Record]) {
//            self.id = id
//            self.name = name
//            self.weight = weight
//            self.reps = reps
//            self.sets = sets
//            self.records = records
//        }
//    }
//}
//
//extension WorkoutDay.Workout: Hashable {
//    var identifier: String {
//        return UUID().uuidString
//    }
//    public func hash(into hasher: inout Hasher) {
//        return hasher.combine(identifier)
//    }
//    public static func == (lhs: WorkoutDay.Workout, rhs: WorkoutDay.Workout) -> Bool {
//        return lhs.identifier == rhs.identifier
//    }
//}
