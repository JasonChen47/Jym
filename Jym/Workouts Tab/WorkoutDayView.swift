//
//  WorkoutDayView.swift
//  Jym
//
//  Created by John Smith on 5/9/23.
//

import SwiftUI

struct WorkoutDayView: View {
    
    init(workoutDay: Binding<WorkoutDay>) {
        Utils.navigationBarConfig()
        self._workoutDay = workoutDay
        
    }
    
    @EnvironmentObject var sharedData: SharedData
    @Environment(\.dismiss) var dismiss
    @Binding var workoutDay: WorkoutDay
//    @Binding var path: NavigationPath
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    var body: some View {
        VStack {
            Rectangle()
                .fill(.linearGradient(
                    Gradient(colors:[Color("royalBlueLight"), Color("royalBlueLight").opacity(0.5)]),
                startPoint: UnitPoint(x: 0, y: 0.5),
                endPoint: UnitPoint(x: 1, y: 0.5)
            ))
                .aspectRatio(1.618, contentMode: .fit)
                .overlay(
                    EmptyView()
                        .background(
                            HStack {
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color("royalBlue"))
                                        .frame(width: width*0.4, height: width*0.4, alignment: .center)
                                    Text(workoutDay.emoji)
                                        .font(.system(size: 120))
                                    
                                }
                                .padding()
                            }
                        )
                )
            List {
                ForEach($workoutDay.workouts) { $workout in
//                    NavigationLink {
//                        WorkoutView(workout: $workout)
//                    } label: {
//                        EmptyView()
//                    }
                    NavigationLink(value: $workout) {
                        EmptyView()
                    }
                    .listRowSeparatorTint(.yellow)
                    .background(
                        HStack {
                            Text(workout.name)
                                .foregroundColor(Color("angelYellow"))
                            
                            Spacer()
                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color("angelYellow"))
                        }
                    )
                }
                
                .listRowBackground(
                    Color("royalBlueLight")
                )
            }
            .scrollContentBackground(.hidden)
            Spacer()
        }
//        .navigationBarBackButtonHidden(true)
        .tint(Color.yellow)
        .accentColor(Color.yellow)
        .navigationDestination(for: Binding<Workout>.self) { workout in
            WorkoutView(workout: workout)
        }
        .background(Color("royalBlue"))
//        .toolbarBackground(Color("royalBlue"), for: .navigationBar)
//        .toolbarBackground(Color("royalBlue"), for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
                    .foregroundColor(Color.yellow)
            }
            ToolbarItem {
                Button{
                    print("hi")
                } label: {
                    Label("Add Item", systemImage: "plus")
                        .foregroundColor(Color.yellow)
                }
            }
        }
        .navigationTitle(workoutDay.name)
//        .toolbarColorScheme(.dark, for: .navigationBar)
//        .toolbarBackground(.visible, for: .navigationBar)
        .onChange(of: sharedData.presented) { presented in
        }
    }
        
}

struct WorkoutDayView_Previews: PreviewProvider {
    static var previews: some View {
        @State var workoutsPath = NavigationPath()
        NavigationStack(path: $workoutsPath) {
            Group {
                WorkoutDayView(workoutDay: .constant(WorkoutDay.sampleData[0]))
            }.environmentObject(SharedData())
        }
    }
}
