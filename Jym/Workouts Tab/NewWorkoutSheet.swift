//
//  NewWorkoutSheet.swift
//  Jym
//
//  Created by John Smith on 1/2/24.
//

import Foundation
import SwiftUI

struct NewWorkoutSheet: View {
    @Binding var editingWorkoutDay: WorkoutDay
    @Binding var isPresentingNewWorkoutView: Bool
    @State private var newWorkoutName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Workouts to Add").foregroundColor(.white)) {
                ForEach(editingWorkoutDay.workouts) { workout in
                    HStack {
                        Text(workout.name)
                        Spacer()
                    }
                }
                HStack {
                    TextField("Workout Name", text: $newWorkoutName)
                    Button(action: {
                        withAnimation {
                            let workout = Workout(name: newWorkoutName, weight: 0, reps: 0, sets: 0, records: [])
                            editingWorkoutDay.workouts.append(workout)
                            newWorkoutName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add Workout")
                    }
                    .disabled(newWorkoutName.isEmpty)
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color("royalBlue"))
    }
}

struct NewWorkoutSheet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NewWorkoutSheet(editingWorkoutDay: .constant(WorkoutDay.emptyWorkoutDay),
                                                      isPresentingNewWorkoutView: .constant(true))
        }
    }
}
