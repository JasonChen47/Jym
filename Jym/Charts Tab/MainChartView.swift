//
//  MainChartView.swift
//  Jym
//
//  Created by John Smith on 5/25/23.
//

import SwiftUI
import Charts

struct MainChartView: View {
    
    @Binding var workoutDays: [WorkoutDay]
    
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    let backTextColor = Color.white
    let subtitleSize: CGFloat = 20
    let cornerRadius: CGFloat = 10
    let outlineSize: CGFloat = 1
    let dateSize: CGFloat = 15
    let sampleSets = SetRecord.sampleData
    
    let df: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("M/dd/yy")
        return formatter
    }()
    
    var setRecordsAndMostRecentRecord: ([SetRecord], Record) {
        // Go through the workoutDays and make an array of all records
        let allRecords = workoutDays.flatMap { $0.workouts.flatMap { $0.records } }
        var sortedRecords: [Record] {
            let sorted = allRecords.sorted {
                $0.date > $1.date
            }
            return sorted
        }
        let tempMostRecentRecord = sortedRecords.first ?? Record.emptyRecord
        let setCountByDate = sortedRecords.reduce(into: [:]) { dict, record in
            dict[df.string(from: record.date), default: 0] += record.sets
        }
        let tempSetRecords = setCountByDate.map { SetRecord(date: df.date(from: $0.key) ?? Date.now, setCount: $0.value) }
        return (tempSetRecords, tempMostRecentRecord)
    }
    
    var body: some View {
        let setRecords = setRecordsAndMostRecentRecord.0
        let mostRecentRecord = setRecordsAndMostRecentRecord.1
        // Filter to the range of 30 days before the most recent date to the most recent date
        let referenceDate = mostRecentRecord.date

        // Filter records based on whether their date is within 30 days before the reference date
        let recentSetRecords = setRecords.filter { record in
            if let thirtyDaysAgo = Calendar.current.date(byAdding: .day, value: -31, to: referenceDate) {
                return record.date > thirtyDaysAgo
            } else {
                // Handle the case where date calculation fails (if it ever does)
                return false
            }
        }
        NavigationStack {
            List {
//                VStack {
//                    HStack {
//                        Text(Date.now, style: .date)
//                            .font(Font.subheadline)
//                            .foregroundColor(Color.gray)
//                        Spacer()
//                    }
//                }
//                .listRowInsets(EdgeInsets())
//                .listRowBackground(
//                    Color("royalBlue")
//                )
                Section(header: Text("Activity Report"), footer: Text("Total number of sets done each day")
                    
                    .foregroundColor(.gray)) {
                    // Show 30 values from the most recent date to 30 days before the most recent date
                    
                    Chart {
                        ForEach(recentSetRecords) { sets in
                            BarMark(x: .value("Date", sets.date, unit: .day), y: .value("Count", sets.setCount))
                        }
                    }
//                    .chartXAxisLabel("Position (meters)")
                    // Show 30 values from the most recent date to 30 days before the most recent date
                    .chartXScale(domain: [mostRecentRecord.date.addingTimeInterval(-30 * 24 * 60 * 60), mostRecentRecord.date.addingTimeInterval(2 * 24 * 60 * 60)])
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(
                        Color("royalBlue")
                    )
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
                            if let sets = value.as(Int.self) {
                                AxisValueLabel {
                                    Text(String(sets))
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
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .strokeBorder(Color("angelYellow"), lineWidth: outlineSize)
                    )
                    .background(
                        Color("royalBlueLight")
                    )
                }
            
                .headerProminence(.increased)
                Section(header: Text("Weight Graphs")) {
                    ForEach($workoutDays) { $workoutDay in
                        NavigationLink(destination: WorkoutDayChartView(workoutDay: $workoutDay)) {
                            CardView(workoutDay: $workoutDay)
                        }
                        .listRowSeparatorTint(.yellow)
                        .foregroundColor(Color("gold"))
                        .listRowBackground(
                            Color("royalBlueLight")
                        )
                    }
                }
                .headerProminence(.increased)
                
            }
            .navigationTitle("Charts")
            .foregroundColor(.white)
            .scrollContentBackground(.hidden)
            .scrollIndicators(.hidden)
            .background(Color("royalBlue"))
            .onAppear {
                
            }
        }
    }
}

struct MainChartView_Previews: PreviewProvider {
    static var previews: some View {
        MainChartView(workoutDays: .constant(WorkoutDay.sampleData))
    }
}
