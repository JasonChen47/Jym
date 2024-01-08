//
//  TestView.swift
//  Jym
//
//  Created by John Smith on 7/13/23.
//

import SwiftUI

struct TestView: View {
    
    @Binding var workout: Workout
    var body: some View {
        
        NavigationStack() {
            List {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
            }
            .navigationTitle("henlo")
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
