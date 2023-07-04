//
//  AllWorkoutsView.swift
//  Jym
//
//  Created by John Smith on 5/4/23.
//

import SwiftUI
import UIKit

struct WorkoutDaysView: View {
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    @Binding var sampleWorkoutDays: [WorkoutDay]
    @Binding var mainWorkoutDay: WorkoutDay
    @State private var searchText = ""
    let cornerRadius: CGFloat = 10
    let subtitleSize: CGFloat = 20
    let dateSize: CGFloat = 15
    let outlineSize: CGFloat = 1
    let emojiSize: CGFloat = 35

    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack {
                        HStack {
                            Text(Date.now, style: .date)
                                .font(.system(size: dateSize))
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Text("Workout Days")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .bold()
                            Spacer()
                        }
                        HStack {
                            VStack {
                                ZStack {
                                    Circle()
                                        .stroke(Color.red, lineWidth: 10)
                                        .frame(width: width/3)
                                    Circle()
                                        .stroke(Color("angelYellow"), lineWidth: 10)
                                        .frame(width: width/4)
                                    Circle()
                                        .stroke(Color("gold"), lineWidth: 10)
                                        .frame(width: width/6)
                                }
                                Text("Arms")
                            }
                            VStack {
                                VStack {
                                    ZStack {
                                        Circle()
                                            .stroke(Color.red, lineWidth: 10)
                                            .aspectRatio(contentMode: .fit)
                                    }
                                    Text("Back")
                                        .fixedSize()
                                }
                                .padding()
                                ZStack {
                                    Circle()
                                        .stroke(Color.red, lineWidth: 10)
                                        .frame(width: width/7)
                                    Circle()
                                        .stroke(Color("angelYellow"), lineWidth: 10)
                                        .frame(width: width/15)
                                }
                                Text("Legs")
                            }
                            .padding([.leading, .trailing])
                            VStack {
                                ZStack {
                                    Circle()
                                        .stroke(Color.red, lineWidth: 10)
                                        .frame(width: width/5)
                                    Circle()
                                        .stroke(Color("angelYellow"), lineWidth: 10)
                                        .frame(width: width/8)
                                }
                                Text("Shoulders")
                                Spacer()
                            }
                        }
                        .padding([.leading, .trailing])
                    }
                } footer: {
                    Text("The outermost rings represent streaks for each workout day. Ten weeks in a row yields a full circle. The four workouts with the longest streaks are shown.")
                        .padding([.leading, .trailing])
                        .foregroundColor(.gray)
                }
                .padding([.bottom])
                .font(.system(size: 12))
                .listRowInsets(EdgeInsets())
                .listRowBackground(
                    Color("royalBlue")
                )
                Section(header: Text("Recommended Next Workout")) {
                    NavigationLink {
                        WorkoutView(workoutDay: $mainWorkoutDay)
                    } label: {
                        CardView(workoutDay: $mainWorkoutDay)
                    }
                    .listRowSeparatorTint(.yellow)
                    .foregroundColor(Color("angelYellow"))
                    .listRowBackground(
                        Color("royalBlueLight")
                    )
                    .listRowInsets(EdgeInsets())
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .stroke(Color("angelYellow"), lineWidth: 2)
                            
                    )
                }
                .headerProminence(.increased)
                Section(header: Text("Browse Workouts")) {
                    ForEach($sampleWorkoutDays) { $workoutDay in
                        NavigationLink {
                            WorkoutView(workoutDay: $workoutDay)
                        } label: {
                            CardView(workoutDay: $workoutDay)
                        }
                        .listRowSeparatorTint(.yellow)
                        .foregroundColor(Color("gold"))
                        .listRowBackground(
                            Color("royalBlueLight")
                        )
                    }
                }
                .headerProminence(.increased)
            }
            .padding(.top, -35)
            .foregroundColor(.white)
            .scrollContentBackground(.hidden)
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
            .background(Color("royalBlue"))
            .toolbarBackground(Color("royalBlue"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .accentColor(Color("angelYellow"))
    }
    
    private func getStreak(workoutDay: WorkoutDay) {
        
    }
    
}

struct AllWorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDaysView(sampleWorkoutDays: .constant(WorkoutDay.sampleData), mainWorkoutDay: .constant(WorkoutDay.sampleData[3]))
    }
}
