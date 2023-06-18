//
//  WorkoutChartView.swift
//  Jym
//
//  Created by John Smith on 6/18/23.
//

import SwiftUI

struct WorkoutChartView: View {
    @Binding var workoutDay: WorkoutDay
    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                ForEach(workoutDay.workouts) { workout in
                    Text(workout.name)
                }
            }
            .navigationTitle(workoutDay.name)
        }
    }
}

struct WorkoutChartView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutChartView(workoutDay: .constant(WorkoutDay.sampleData[0]))
    }
}
