//
//  AllWorkoutsView.swift
//  Jym
//
//  Created by John Smith on 5/4/23.
//

import SwiftUI

struct WorkoutDaysView: View {
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    let sampleWorkoutDays = WorkoutDay.sampleData
    let mainWorkoutDay = WorkoutDay.sampleData[3]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Text("Hey John, \nLet's get to it")
                        .font(.system(size: 37))
                        .bold()
                    Spacer()
                }
                .padding([.bottom])
                HStack {
                    Text("Recommended Next Workout:")
                        .bold()
                    Spacer()
                }
                NavigationLink {
                    Text("hi")
                } label: {
                    Color.black
                        .aspectRatio(1.618, contentMode: .fit)
                        .cornerRadius(5)
                        .overlay(
                            VStack {
                                HStack {
                                    Text(mainWorkoutDay.name)
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
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        ZStack {
                                            Circle()
                                                .foregroundColor(.white)
                                                .frame(width: width*0.4, height: width*0.4, alignment: .center)
                                                .opacity(0.1)
                                            Text(mainWorkoutDay.emoji)
                                                .font(.system(size: 120))
                                        }
                                        .padding()
                                        Spacer()
                                    }
                                    
                                )
                        )

                }
                                HStack {
                    Text("Browse Workouts")
                        .padding([.top], width*0.05)
                        .bold()
                    Spacer()
                }
                LazyVGrid(columns: columns) {
                    ForEach(sampleWorkoutDays) { workoutDay in
                        NavigationLink {
                            Text("hi")
                        } label: {
                            Color.black
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(5)
                                .overlay(
                                    VStack {
                                        HStack {
                                            Text(workoutDay.name)
                                                .foregroundColor(.white)
                                                .bold()
                                            Spacer()
                                        }
                                        .padding([.leading, .top])
                                        ZStack {
                                            Circle()
                                                .foregroundColor(.white)
                                                .frame(width: width*0.25, height: width*0.25, alignment: .center)
                                                .opacity(0.1)
                                            Text(workoutDay.emoji)
                                                .font(.system(size: 70))
                                        }
                                        Spacer()
                                    }
                                )
                        }
                        
                    }
                }
                Spacer()
            }
            .scrollIndicators(.hidden)
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
            .padding([.leading, .trailing], width*0.05)
        }
        
    }
}

struct AllWorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDaysView()
    }
}
