//
//  Sets.swift
//  Jym
//
//  Created by John Smith on 6/13/23.
//

import Foundation

// Struct of the number of sets done each day
struct Sets: Identifiable {
    let id: UUID
    let date: Date
    let setCount: Int
    
    init(id: UUID = UUID(), date: Date, setCount: Int) {
        self.id = id
        self.date = date
        self.setCount = setCount
    }
}

extension Sets {
    static let sampleData: [Sets] =
    [
        Sets(date: Date("2023-06-17"), setCount: 13),
        Sets(date: Date("2023-06-16"), setCount: 12),
        Sets(date: Date("2023-06-15"), setCount: 9),
        Sets(date: Date("2023-06-14"), setCount: 14),
        Sets(date: Date("2023-06-13"), setCount: 0),
        Sets(date: Date("2023-06-12"), setCount: 10),
        Sets(date: Date("2023-06-11"), setCount: 2)
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
