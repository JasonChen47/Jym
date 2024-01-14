//
//  Sets.swift
//  Jym
//
//  Created by John Smith on 6/13/23.
//

import Foundation

// Struct of the number of sets done each day
struct SetRecord: Identifiable {
    let id: UUID
    var date: Date
    var setCount: Double
    
    init(id: UUID = UUID(), date: Date, setCount: Double) {
        self.id = id
        self.date = date
        self.setCount = setCount
    }
}

extension SetRecord {
    static let sampleData: [SetRecord] =
    [
        SetRecord(date: Date("2023-06-24"), setCount: 13),
        SetRecord(date: Date("2023-06-23"), setCount: 12),
        SetRecord(date: Date("2023-06-22"), setCount: 9),
        SetRecord(date: Date("2023-06-21"), setCount: 14),
        SetRecord(date: Date("2023-06-20"), setCount: 0),
        SetRecord(date: Date("2023-06-19"), setCount: 10),
        SetRecord(date: Date("2023-06-18"), setCount: 14),
        SetRecord(date: Date("2023-06-17"), setCount: 13),
        SetRecord(date: Date("2023-06-16"), setCount: 12),
        SetRecord(date: Date("2023-06-15"), setCount: 9),
        SetRecord(date: Date("2023-06-14"), setCount: 14),
        SetRecord(date: Date("2023-06-13"), setCount: 0),
        SetRecord(date: Date("2023-06-12"), setCount: 10),
        SetRecord(date: Date("2023-06-11"), setCount: 2),
        SetRecord(date: Date("2023-06-10"), setCount: 14),
        SetRecord(date: Date("2023-06-09"), setCount: 13),
        SetRecord(date: Date("2023-06-08"), setCount: 12),
        SetRecord(date: Date("2023-06-07"), setCount: 9),
        SetRecord(date: Date("2023-06-06"), setCount: 14),
        SetRecord(date: Date("2023-06-05"), setCount: 0),
        SetRecord(date: Date("2023-06-04"), setCount: 10),
        SetRecord(date: Date("2023-06-03"), setCount: 2),
        SetRecord(date: Date("2023-06-02"), setCount: 14),
        SetRecord(date: Date("2023-06-01"), setCount: 13),
        SetRecord(date: Date("2023-05-31"), setCount: 12),
        SetRecord(date: Date("2023-05-30"), setCount: 9),
        SetRecord(date: Date("2023-05-29"), setCount: 14),
        SetRecord(date: Date("2023-05-28"), setCount: 0),
        SetRecord(date: Date("2023-05-27"), setCount: 10),
        SetRecord(date: Date("2023-05-26"), setCount: 2)
    ]
}

// Dictionary form
//// Struct of the number of sets done each day
//struct Sets: Identifiable {
//    let id: UUID
//    var dictionary: Dictionary<Date, Int>
//
//    init(id: UUID = UUID(), dictionary: Dictionary<Date, Int>) {
//        self.id = id
//        self.dictionary = dictionary
//    }
//}
//
//extension Sets {
//    static let dates = [Date("2023-06-17"), Date("2023-06-16"), Date("2023-06-15")]
//    static let setNums = [13, 12, 9]
//    static let dictionary = Dictionary(uniqueKeysWithValues: zip(dates, setNums))
//    static let sampleData: Sets = Sets(dictionary: dictionary)
//}
