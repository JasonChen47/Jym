//
//  WorkoutDayView.swift
//  Jym
//
//  Created by John Smith on 5/9/23.
//

import SwiftUI

struct WorkoutDayView: View {
    @Binding var workoutDay: WorkoutDay
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
                    VStack {
                        HStack {
                            Text(workoutDay.name)
                                .font(.system(size: 37))
                                .foregroundColor(.white)
                                .bold()
                            
                            Spacer()
                        }
                        .padding([.leading, .top])
                        Spacer()
                    }
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
                    NavigationLink {
                        WorkoutView(workout: $workout)
                    } label: {
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
        .background(Color("royalBlue"))
        .toolbarBackground(Color("royalBlue"), for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                Button{
                    print("hi")
                } label: {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
    }
}

struct WorkoutDayView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDayView(workoutDay: .constant(WorkoutDay.sampleData[0]))
    }
}
