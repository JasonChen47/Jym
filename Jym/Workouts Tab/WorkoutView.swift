//
//  WorkoutView.swift
//  Jym
//
//  Created by John Smith on 7/4/23.
//

import SwiftUI

struct WorkoutView: View {

    @Binding var workout: Workout
    @Binding var workoutDay: WorkoutDay
    
    @State private var newRecord = Record.emptyRecord
    @State private var showingSheet = false
    @State private var lbs: Double = 0
    @State private var recentRecords: [Record] = []
    @State private var reps: Double = 0
    @State private var sets: Double = 0
    @State var workoutDays = WorkoutDay.sampleData
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        let df: DateFormatter = {
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("M/dd/yy")
            return formatter
        }()
//        @State var sortOrder = [KeyPathComparator(\Record.date)]
        var recentRecords1: [Record] {
            let sorted = workout.records.sorted {
                $0.date < $1.date
            }
            
            return sorted.suffix(3)
        }
        var mostRecentWorkout = recentRecords1.last
        
        List {
            Section(header: HStack {
                Text("Workout Log")
                Spacer()
                NavigationLink(destination: WorkoutLogView(workout: $workout)) {
                    Text("Show More")
                        .font(Font.subheadline)
                        .foregroundColor(Color("angelYellow"))
                }
            }
                
            ) 
            {
                Grid {
                    GridRow {
                        Text("Date")
                        Text("Lbs")
                        Text("Reps")
                        Text("Sets")
                    }
                    .bold()
                    Divider()
                        .overlay(.yellow)
                    ForEach(recentRecords) { record in
                        if record != recentRecords.last {
                            GridRow {
                                Text(df.string(from: record.date))
                                Text(String(record.weight))
                                Text(String(record.reps))
                                Text(String(record.sets))
                            }
                            .foregroundColor(Color("gold"))
                        }
                        else {
                            GridRow {
                                Text(df.string(from: record.date))
                                Text(String(record.weight))
                                Text(String(record.reps))
                                Text(String(record.sets))
                            }
                            .bold()
                        }
                    }
                }
                .listRowSeparatorTint(.yellow)
                .foregroundColor(Color("angelYellow"))
                .listRowBackground(
                    Color("royalBlueLight")
                )
            }
            .headerProminence(.increased)
            Section(header: Text("Record Workout")) {
                VStack {
                    HStack {
                        TextField("", value: $newRecord.weight, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .frame(width: width/8)
                            .foregroundColor(.black)
                        Text("lbs")
                        Spacer()
                        TextField("", value: $newRecord.reps, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .frame(width: width/8)
                            .foregroundColor(.black)
                        Text("Reps")
                        Spacer()
                        TextField("", value: $newRecord.sets, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .frame(width: width/8)
                            .foregroundColor(.black)
                        Text("Sets")
                    }
                    .listRowSeparatorTint(.yellow)
                    .foregroundColor(Color("angelYellow"))
                    .listRowBackground(
                        Color("royalBlueLight")
                    )
                    Button{
                        withAnimation {
                            // Make sure there are no duplicates in the same day
                            if !workout.records.isEmpty {
                                if Calendar.current.isDate(workout.records.last?.date ?? Date.distantPast, inSameDayAs: Date.now) {
                                    workout.records.removeLast()
                                }
                            }
                            if !recentRecords.isEmpty {
                                if Calendar.current.isDate(recentRecords.last?.date ?? Date.distantPast, inSameDayAs: Date.now) {
                                    recentRecords.removeLast()
                                }
                            }
                            workout.records.append(newRecord)
                            recentRecords.append(newRecord)
                            if recentRecords.count > 3 {
                                recentRecords.removeFirst()
                            }
                            if Calendar.current.isDateInYesterday(workoutDay.lastWorkoutDay) {
                                workoutDay.streak += 1
                            }
                            else {
                                workoutDay.streak = 1
                            }
                            workoutDay.lastWorkoutDay = Date.now
                            
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Image(systemName: "square.and.pencil")
                            Text("Record")
                            Spacer()
                        }
                        .foregroundColor(Color("angelYellow"))
                        .bold()
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color("angelYellow"), lineWidth: 2)
                        )
                    }
                    .padding()
                }
                .foregroundColor(Color("royalBlue"))
                .listRowSeparatorTint(Color("royalBlueLight"))
                .listRowBackground(Color("royalBlueLight"))
            }
            .headerProminence(.increased)
        }
        .foregroundColor(.white)
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .background(Color("royalBlue"))
        .navigationTitle(workout.name)

        .onAppear {
            if !recentRecords.isEmpty {
                lbs = recentRecords.last?.weight ?? 0
                reps = recentRecords.last?.reps ?? 0
                sets = recentRecords.last?.sets ?? 0
            }
            recentRecords = recentRecords1
            newRecord = Record(id: UUID(), date: Date.now, weight: mostRecentWorkout?.weight ?? 0, reps: mostRecentWorkout?.reps ?? 0, sets: mostRecentWorkout?.sets ?? 0)
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        @State var workoutsPath = NavigationPath()
        Group {
            NavigationStack(path: $workoutsPath) {
                WorkoutView(workout: .constant(WorkoutDay.sampleData[0].workouts[0]), workoutDay: .constant(WorkoutDay.sampleData[0]))
            }
        }
    }
}
