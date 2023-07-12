//
//  WorkoutDayChartView.swift
//  Jym
//
//  Created by John Smith on 6/18/23.
//

import SwiftUI
import Charts

struct WorkoutDayChartView: View {
    @Binding var workoutDay: WorkoutDay
    var body: some View {
        List {
            HStack {
                Text(workoutDay.name)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .bold()
                Spacer()
            }
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color("royalBlue"))
            ForEach($workoutDay.workouts) { $workout in
                Section(header: Text(workout.name)) {
                    WorkoutChartView(workout: $workout)
                }
                .listRowInsets(.init(top: 10,
                     leading: 0,
                     bottom: 0,
                     trailing: 0)
                )
            }
            .listRowBackground(Color("royalBlue"))
        }
        .padding(.top, -35)
        .foregroundColor(.white)
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .background(Color("royalBlue"))
        .toolbarBackground(Color("royalBlue"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .accentColor(Color("angelYellow"))
    }
}

struct WorkoutChartView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDayChartView(workoutDay: .constant(WorkoutDay.sampleData[0]))
    }
}
