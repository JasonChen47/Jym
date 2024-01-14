//
//  Date.swift
//  Jym
//
//  Created by John Smith on 6/17/23.
//

import Foundation

extension Date {
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
    
    func getWeekday(date: Date) -> String {
        let f = DateFormatter()
        let weekday = Calendar.current.component(.weekday, from: date)
        return f.weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1]
    }
}

//extension Date: Hashable {
//    public func hash(into hasher: inout Hasher) {
//        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
//        hasher.combine(components.year ?? 0)
//        hasher.combine(components.month ?? 0)
//        hasher.combine(components.day ?? 0)
//    }
//
//    public static func == (lhs: Date, rhs: Date) -> Bool {
//        return lhs.isSameDay(as: rhs)
//    }
//}
//
//extension Date {
//    func isSameDay(as otherDate: Date) -> Bool {
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.year, .month, .day], from: self)
//        let otherComponents = calendar.dateComponents([.year, .month, .day], from: otherDate)
//
//        return components == otherComponents
//    }
//}
