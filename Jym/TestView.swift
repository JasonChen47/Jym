//
//  TestView.swift
//  Jym
//
//  Created by John Smith on 7/13/23.
//

import SwiftUI

struct TestView: View {
    
    @Binding var workout: Workout
    
    @State private var isPresentingNewWorkoutDayView: Bool = false
    var body: some View {
        
        NavigationStack {
            List {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
            }
            .navigationTitle("henlo")
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

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TestView(workout: .constant(WorkoutDay.sampleData[0].workouts[0]))
        }
        
    }
}
