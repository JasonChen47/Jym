//
//  NewWorkoutDaySheet.swift
//  Jym
//
//  Created by John Smith on 8/26/23.
//

import SwiftUI

struct NewWorkoutDaySheet: View {
    @State private var newWorkoutDay = WorkoutDay.emptyWorkoutDay
    @Binding var workoutDays: [WorkoutDay]
    @Binding var isPresentingNewWorkoutDayView: Bool
    @State private var newWorkoutName = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Workout Day Name").foregroundColor(.white)) {
                    TextField("Title", text: $newWorkoutDay.name)
                }
                Section(header: Text("Emoji Icon").foregroundColor(.white)) {
                    TextField("💪", text: $newWorkoutDay.emoji)
                }
                Section(header: Text("Workouts").foregroundColor(.white)) {
                    ForEach(newWorkoutDay.workouts) { workout in
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
                                newWorkoutDay.workouts.append(workout)
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
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        isPresentingNewWorkoutDayView = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        withAnimation {
                            workoutDays.append(newWorkoutDay)
                        }
                        isPresentingNewWorkoutDayView = false
                    }
                }
            }
            
        }
    }
}

struct NewWorkoutDaySheet_Previews: PreviewProvider {
    static var previews: some View {
        NewWorkoutDaySheet(workoutDays: .constant(WorkoutDay.sampleData), isPresentingNewWorkoutDayView: .constant(true))
    }
}
