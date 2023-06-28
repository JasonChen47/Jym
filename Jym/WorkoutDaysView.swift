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
    @Binding var sampleWorkoutDays: [WorkoutDay]
    @Binding var mainWorkoutDay: WorkoutDay
    let cornerRadius: CGFloat = 10
    let subtitleSize: CGFloat = 20
    let dateSize: CGFloat = 15
    let outlineSize: CGFloat = 2
    let emojiSize: CGFloat = 30

    var body: some View {
        let spacing: CGFloat = width*0.05
        let columns = [
            GridItem(.flexible(), spacing: spacing),
            GridItem(.flexible(), spacing: spacing)
        ]
        let dfLong: DateFormatter = {
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("M/dd/yy")
            return formatter
        }()
        
        NavigationView {
            ScrollView {
                HStack {
                    Text(Date.now, style: .date)
                        .font(.system(size: dateSize))
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                Spacer()
                HStack {
                    Text("Good afternoon John. \nLet's get to it.")
                        .font(.system(size: 25))
                        .bold()
                        .foregroundColor(Color.white)
                    Spacer()
                }
                .padding([.bottom])
                HStack {
                    Text("Recommended Next Workout")
                        .bold()
                        .foregroundColor(Color("backText"))
                        .font(.system(size: subtitleSize))
                    Spacer()
                }
                NavigationLink {
                    WorkoutView(workoutDay: $mainWorkoutDay)
                } label: {
                    Rectangle()
                        .fill(.linearGradient(
                            Gradient(colors:[Color("gold").opacity(0.9), Color("gold").opacity(0.7)]),
                        startPoint: UnitPoint(x: 0, y: 0.5),
                        endPoint: UnitPoint(x: 1, y: 0.5)
                    ))
                        .cornerRadius(cornerRadius)
                        .aspectRatio(4, contentMode: .fit)
                        .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .strokeBorder(Color("angelYellow"), lineWidth: outlineSize)
                        )
                        .overlay(
                            HStack {
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color("royalBlue"))
                                        .frame(width: width*0.15, height: width*0.15, alignment: .center)
                                        .overlay(
                                            Circle()
                                                .stroke(Color("angelYellow"), lineWidth: outlineSize)
                                        )
                                    Text(mainWorkoutDay.emoji)
                                        .font(.system(size: 30))
                                }
                                VStack {
                                    HStack {
                                        Text(mainWorkoutDay.name)
                                            .font(.system(size: subtitleSize))
                                            .foregroundColor(Color("blueText"))
                                            .bold()
                                        Spacer()
                                    }
                                    Spacer()
                                    HStack {
                                        Image(systemName: "flame")
                                        Text(String(mainWorkoutDay.streak))
                                            
                                        + Text(" Weeks")
                                        Spacer()
                                        Image(systemName: "dumbbell")
                                        Text(dfLong.string(from: mainWorkoutDay.lastWorkoutDay))
                                        Spacer()
                                    }
                                    
                                }
                                .padding([.leading])
                                Spacer()
                            }
                                .padding()
                            
                        )
                                        }
                                HStack {
                    Text("Browse Workouts")
                        .padding([.top], width*0.05)
                        .bold()
                        .foregroundColor(Color("backText"))
                        .font(.system(size: subtitleSize))
                    Spacer()
                }
                LazyVGrid(columns: columns, spacing: spacing) {
                    ForEach($sampleWorkoutDays) { $workoutDay in
                        NavigationLink {
                            WorkoutView(workoutDay: $workoutDay)
                        } label: {
                            CardView(workoutDay: $workoutDay)
                        }
                        
                    }
                }
                Spacer()
            }
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                        .foregroundColor(Color("angelYellow"))
                }
                ToolbarItem {
                    Button{
                        print("hi")
                    } label: {
                        Label("Add Item", systemImage: "plus")
                            .foregroundColor(Color("angelYellow"))
                    }
                }
            }
            .padding([.leading, .trailing], width*0.05)
            .background(Color("royalBlue"))
            .toolbarBackground(Color("royalBlue"), for: .navigationBar)
        }
    }
    
    private func getStreak(workoutDay: WorkoutDay) {
        
    }
    
}

struct AllWorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDaysView(sampleWorkoutDays: .constant(WorkoutDay.sampleData), mainWorkoutDay: .constant(WorkoutDay.sampleData[3]))
    }
}
