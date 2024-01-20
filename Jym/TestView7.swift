//
//  TestView7.swift
//  Jym
//
//  Created by John Smith on 1/20/24.
//

import SwiftUI

struct TestView7: View {
    
//    @Binding var workoutDays: [WorkoutDay]
    @Binding var scrum: DailyScrum
    
    var body: some View {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
//    TestView7(workoutDays: .constant(WorkoutDay.sampleData))
    TestView7(scrum: .constant(DailyScrum.sampleData[0]))
}
