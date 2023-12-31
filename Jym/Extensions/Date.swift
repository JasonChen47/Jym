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
