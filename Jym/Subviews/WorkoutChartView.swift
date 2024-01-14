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
            if let thirtyDaysAgo = Calendar.current.date(byAdding: .day, value: -31, to: referenceDate) {
                return record.date > thirtyDaysAgo
            } else {
                // Handle the case where date calculation fails (if it ever does)
                return false
            }
        }

        Chart {
            ForEach(recentRecords) { record in
                BarMark(x: .value("Date", record.date, unit: .day), y: .value("Count", record.weight))
            }
        }
        .chartXScale(domain: [mostRecentRecord.date.addingTimeInterval(-30 * 24 * 60 * 60), mostRecentRecord.date.addingTimeInterval(2 * 24 * 60 * 60)])
        .chartXAxis {
            AxisMarks(values: .stride(by: .weekOfYear)) { value in
                if let date = value.as(Date.self) {
                    AxisValueLabel {
                        Text(date, format: .dateTime.month().day())
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
