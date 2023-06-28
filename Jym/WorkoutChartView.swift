//
//  WorkoutChartView.swift
//  Jym
//
//  Created by John Smith on 6/18/23.
//

import SwiftUI
import Charts

struct WorkoutChartView: View {
    @Binding var workoutDay: WorkoutDay
    var body: some View {
        ScrollView {
            ForEach(workoutDay.workouts) { workout in
                VStack {
                    HStack {
                        Text(workout.name)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    Chart {
                        ForEach(workout.records) { record in
                            BarMark(x: .value("Date", record.date, unit: .day), y: .value("Count", record.weight))
                        }
                    }
                    .chartXAxis {
                        AxisMarks(values: .stride(by: .day))
                    }
                }
                .padding()
            }
        }
        .navigationTitle(workoutDay.name)
        .background(Color("royalBlue"))
        .toolbarBackground(Color("royalBlue"), for: .navigationBar)
    }
}

struct WorkoutChartView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutChartView(workoutDay: .constant(WorkoutDay.sampleData[0]))
    }
}
