//
//  TestView2.swift
//  Jym
//
//  Created by John Smith on 1/6/24.
//

import SwiftUI

struct TestView2: View {
    @Binding var workouts: [Workout]
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        List {
            Section {
                ForEach($workouts) { $workout in
                    NavigationLink(destination: TestView(workout: $workout)) {
                        Text(workout.name)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        TestView2(workouts: .constant(WorkoutDay.sampleData[0].workouts))
    }
    
}
