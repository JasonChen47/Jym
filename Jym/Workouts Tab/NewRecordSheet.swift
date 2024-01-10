//
//  NewRecordSheet.swift
//  Jym
//
//  Created by John Smith on 1/9/24.
//

import SwiftUI

struct NewRecordSheet: View {
    
    @Binding var workout: Workout
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NewRecordSheet(workout: .constant(WorkoutDay.sampleData[0].workouts[0]))
}
