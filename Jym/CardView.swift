//
//  CardView.swift
//  Jym
//
//  Created by John Smith on 5/24/23.
//

import SwiftUI

struct CardView: View {
    let workoutDay: WorkoutDay
    var body: some View {
        Text(workoutDay.name)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(workoutDay: WorkoutDay.sampleData[0])
    }
}
