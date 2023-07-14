//
//  TestView.swift
//  Jym
//
//  Created by John Smith on 7/13/23.
//

import SwiftUI

struct TestView: View {
    init (sampleWorkoutDays: Binding<[WorkoutDay]>) {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.green]
        self._sampleWorkoutDays = sampleWorkoutDays
    }
    @State var path = NavigationPath()
    @Binding var sampleWorkoutDays: [WorkoutDay]
    var body: some View {
        
        NavigationStack(path: $path) {
            List {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("hi")
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(sampleWorkoutDays: .constant(WorkoutDay.sampleData))
    }
}
