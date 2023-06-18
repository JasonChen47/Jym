//
//  WorkoutView.swift
//  Jym
//
//  Created by John Smith on 5/9/23.
//

import SwiftUI

struct WorkoutView: View {
    @Binding var workoutDay: WorkoutDay
    var body: some View {
        NavigationView {
            VStack {
                Color.black
                    .aspectRatio(1.618, contentMode: .fit)
                List {
                    ForEach(workoutDay.workouts) { workout in
                        NavigationLink {
                            Text(workout.name)
                        } label: {
                            Text(workout.name)
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle(workoutDay.name)
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(workoutDay: .constant(WorkoutDay.sampleData[0]))
    }
}
