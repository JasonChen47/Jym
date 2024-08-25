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
        Record(date: Date.now.addingTimeInterval(-1 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-2 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-3 * 24 * 60 * 60), weight: 80, reps: 10, sets: 5),
        Record(date: Date.now.addingTimeInterval(-4 * 24 * 60 * 60), weight: 80, reps: 10, sets: 6),
        Record(date: Date.now.addingTimeInterval(-5 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-6 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-7 * 24 * 60 * 60), weight: 80, reps: 10, sets: 5),
        Record(date: Date.now.addingTimeInterval(-8 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-9 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-10 * 24 * 60 * 60), weight: 80, reps: 10, sets: 7),
        Record(date: Date.now.addingTimeInterval(-11 * 24 * 60 * 60), weight: 80, reps: 10, sets: 6),
        Record(date: Date.now.addingTimeInterval(-12 * 24 * 60 * 60), weight: 80, reps: 10, sets: 5),
        Record(date: Date.now.addingTimeInterval(-13 * 24 * 60 * 60), weight: 80, reps: 10, sets: 3),
        Record(date: Date.now.addingTimeInterval(-14 * 24 * 60 * 60), weight: 80, reps: 10, sets: 7),
        Record(date: Date.now.addingTimeInterval(-15 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-16 * 24 * 60 * 60), weight: 80, reps: 10, sets: 7),
        Record(date: Date.now.addingTimeInterval(-17 * 24 * 60 * 60), weight: 80, reps: 10, sets: 5),
        Record(date: Date.now.addingTimeInterval(-18 * 24 * 60 * 60), weight: 80, reps: 10, sets: 5),
        Record(date: Date.now.addingTimeInterval(-19 * 24 * 60 * 60), weight: 80, reps: 10, sets: 5),
        Record(date: Date.now.addingTimeInterval(-20 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-21 * 24 * 60 * 60), weight: 80, reps: 10, sets: 6),
        Record(date: Date.now.addingTimeInterval(-22 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-23 * 24 * 60 * 60), weight: 80, reps: 10, sets: 7),
        Record(date: Date.now.addingTimeInterval(-24 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-25 * 24 * 60 * 60), weight: 80, reps: 10, sets: 5),
        Record(date: Date.now.addingTimeInterval(-28 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-30 * 24 * 60 * 60), weight: 80, reps: 10, sets: 3),
    ]
    static let records2: [Record] = [
        Record(date: Date.now, weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-6 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date.now.addingTimeInterval(-14 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
    ]
    static let records: [Record] = [
        Record(date: Date("2023-01-08"), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-02-08"), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-40 * 7 * 24 * 60 * 60), weight: 35, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-39 * 7 * 24 * 60 * 60), weight: 35, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-38 * 7 * 24 * 60 * 60), weight: 35, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-37 * 7 * 24 * 60 * 60), weight: 35, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-36 * 7 * 24 * 60 * 60), weight: 40, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-35 * 7 * 24 * 60 * 60), weight: 40, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-34 * 7 * 24 * 60 * 60), weight: 40, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-33 * 7 * 24 * 60 * 60), weight: 40, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-32 * 7 * 24 * 60 * 60), weight: 40, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-31 * 7 * 24 * 60 * 60), weight: 40, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-30 * 7 * 24 * 60 * 60), weight: 40, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-29 * 7 * 24 * 60 * 60), weight: 40, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-28 * 7 * 24 * 60 * 60), weight: 40, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-27 * 7 * 24 * 60 * 60), weight: 40, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-26 * 7 * 24 * 60 * 60), weight: 40, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-25 * 7 * 24 * 60 * 60), weight: 55, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-24 * 7 * 24 * 60 * 60), weight: 55, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-23 * 7 * 24 * 60 * 60), weight: 65, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-22 * 7 * 24 * 60 * 60), weight: 65, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-21 * 7 * 24 * 60 * 60), weight: 65, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-20 * 7 * 24 * 60 * 60), weight: 65, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-19 * 7 * 24 * 60 * 60), weight: 65, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-18 * 7 * 24 * 60 * 60), weight: 65, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-17 * 7 * 24 * 60 * 60), weight: 65, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-16 * 7 * 24 * 60 * 60), weight: 65, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-15 * 7 * 24 * 60 * 60), weight: 65, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-14 * 7 * 24 * 60 * 60), weight: 70, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-13 * 7 * 24 * 60 * 60), weight: 70, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-12 * 7 * 24 * 60 * 60), weight: 70, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-11 * 7 * 24 * 60 * 60), weight: 75, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-10 * 7 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-9 * 7 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-8 * 7 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-7 * 7 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-6 * 7 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-5 * 7 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-4 * 7 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-3 * 7 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-2 * 7 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
        Record(date: Date("2023-06-02").addingTimeInterval(-1 * 7 * 24 * 60 * 60), weight: 80, reps: 10, sets: 4),
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
//        Record(date: Date("2024-01-05"), weight: 130, reps: 10, sets: 4)
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
