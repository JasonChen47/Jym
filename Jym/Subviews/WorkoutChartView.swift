//
//  WorkoutChartView.swift
//  Jym
//
//  Created by John Smith on 7/6/23.
//

import SwiftUI
import Charts

struct WorkoutChartView: View {
    
    @Binding var workout: Workout
    
    var weekRange = 52
    
    var mostRecentRecord: Record {
        var sortedRecords: [Record] {
            let sorted = workout.records.sorted {
                $0.date > $1.date
            }
            return sorted
        }
        let tempMostRecentRecord = sortedRecords.first ?? Record.emptyRecord
        return tempMostRecentRecord
    }
    
    var body: some View {
        let referenceDate = mostRecentRecord.date
        let recentRecords = workout.records.filter { record in
            if let yearAgo = Calendar.current.date(byAdding: .weekOfYear, value: -49, to: referenceDate) {
                return record.date > yearAgo
            } else {
                // Handle the case where date calculation fails (if it ever does)
                return false
            }
        }
        // Average the records by week
        // Make a set of all the weeks
        // Go through each week and average all the workouts that are in each week
        var averagedRecords: [Record] {
            let recentRecordsTemp = recentRecords
            let weeks = Set( recentRecordsTemp.map {
                Calendar.current.date(from: DateComponents(weekday: 1, weekOfYear: Calendar.current.component(.weekOfYear, from: $0.date), yearForWeekOfYear: Calendar.current.component(.year, from: $0.date)))
            })
            
            var averagedRecordsTemp: [Record] = []
            for week in weeks {
                // Get all records in that week
                let recordsInSameWeek = recentRecordsTemp.filter { Calendar.current.isDate( $0.date, equalTo: week ?? Date.distantFuture, toGranularity: .weekOfYear )
                }
                // Average the records
                let totalWeight = recordsInSameWeek.reduce(0.0) { $0 + $1.weight }
                let averageWeight = recordsInSameWeek.isEmpty ? 0 : totalWeight / Double(recordsInSameWeek.count)
                
                averagedRecordsTemp.append(Record(date: week ?? Date.distantPast, weight: averageWeight, reps: 1, sets: 1))
            }
            return averagedRecordsTemp
        }
        
        
//        let averagedRecords = recentRecords.map {
//            if $0.
//        }

        Chart {
            ForEach(averagedRecords) { record in
                BarMark(x: .value("Date", record.date, unit: .weekOfYear), y: .value("Count", record.weight))
            }
        }
        .chartYAxisLabel {
            Text("hi")
        }
        .chartXScale(domain: [mostRecentRecord.date.addingTimeInterval(-49 * 7 * 24 * 60 * 60 ), mostRecentRecord.date.addingTimeInterval( 7 * 24 * 60 * 60)])
        .chartXAxis {
            AxisMarks(values: .stride(by: .month)) { value in
                if let date = value.as(Date.self) {
                    AxisValueLabel {
                        Text(date, format: .dateTime.month())
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .chartYAxis {
            AxisMarks() { value in
                if let weight = value.as(Int.self) {
                    AxisValueLabel {
                        Text(String(weight))
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .foregroundStyle(
            .linearGradient(
                Gradient(colors:[Color("angelYellow").opacity(0.9), Color.red.opacity(0.7)]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
        )
//        .overlay(
//            RoundedRectangle(cornerRadius: 10)
//                .strokeBorder(Color("angelYellow"), lineWidth: 1)
//        )
//        .background(
//            Color("royalBlueLight")
//        )
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            WorkoutChartView(workout: .constant(WorkoutDay.sampleData[0].workouts[0]))
        }
        .background(
            Color("royalBlue")
        )
    }
}
