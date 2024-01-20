//
//  TestView2.swift
//  Jym
//
//  Created by John Smith on 1/6/24.
//

import SwiftUI

struct TestView2: View {
    @Binding var workouts: [Workout]
    
    @State private var isPresentingNewWorkoutDayView: Bool = false
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationStack {
            List {
                Section {
                    ForEach($workouts) { $workout in
                        NavigationLink(destination: TestView(workout: $workout)) {
                            Text(workout.name)
                        }
                    }
                    .onDelete { workouts.remove(atOffsets: $0) }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                        .foregroundColor(Color.yellow)
                }
                ToolbarItem {
                    Button {
                        isPresentingNewWorkoutDayView = true
                    } label: {
                        Label("Add Item", systemImage: "plus")
                            .foregroundColor(Color.yellow)
                    }
                }
            }
            .sheet(isPresented: $isPresentingNewWorkoutDayView) {
                ContentView()
        }
        }
    }
}

#Preview {
    NavigationStack {
        TestView2(workouts: .constant(WorkoutDay.sampleData[0].workouts))
    }
    
}
