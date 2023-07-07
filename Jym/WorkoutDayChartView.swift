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
        ScrollView {
            HStack {
                Text(workoutDay.name)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .bold()
                Spacer()
            }
            .padding([.bottom])
            ForEach($workoutDay.workouts) { $workout in
                VStack {
                    HStack {
                        Text(workout.name)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    WorkoutChartView(workout: $workout)
                }
                
            }
        }
        .padding()
        .background(Color("royalBlue"))
        .toolbarBackground(Color("royalBlue"), for: .navigationBar)
    }
}

struct WorkoutChartView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDayChartView(workoutDay: .constant(WorkoutDay.sampleData[0]))
    }
}
