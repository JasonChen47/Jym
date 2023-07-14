//
//  WorkoutView.swift
//  Jym
//
//  Created by John Smith on 7/4/23.
//

import SwiftUI

struct WorkoutView: View {
    @EnvironmentObject var sharedData: SharedData
    @Environment(\.dismiss) var dismiss
    @Binding var workout: Workout
    @State private var showingSheet = false
    @State private var lbs: String = ""
    @State private var reps: String = ""
    @State private var sets: String = ""
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
        @State var sortOrder = [KeyPathComparator(\Record.date)]
        var recentRecords: [Record] {
            let sorted = workout.records.sorted {
                $0.date < $1.date
            }
            return sorted.suffix(3)
        }
        List {
    //                Section(header: Text("Progress Chart")) {
    //                    WorkoutChartView(workout: $workout)
    //                        .listRowInsets(EdgeInsets())
    //                        .listRowBackground(
    //                            Color("royalBlue")
    //                        )
    //                }
    //                .headerProminence(.increased)
            Section(header: HStack {
                Text("Workout Log")
                Spacer()
    //                NavigationLink {
    //                    WorkoutLogView(workout: $workout)
    //                } label: {
    //                    Text("Show More")
    //                        .font(Font.subheadline)
    //                        .foregroundColor(Color("angelYellow"))
    //                }
                NavigationLink(value: [$workout]) {
                        Text("Show More")
                            .font(Font.subheadline)
                            .foregroundColor(Color("angelYellow"))
                    }
//                    NavigationLink("Show More", value: 3)
//                        .font(Font.subheadline)
//                        .foregroundColor(Color("angelYellow"))
//                Button("Show More") {
//                    showingSheet.toggle()
//                }
//                .font(Font.subheadline)
//                .foregroundColor(Color("angelYellow"))
//                .sheet(isPresented: $showingSheet) {
//                    ZStack {
//                        Color("royalBlue").edgesIgnoringSafeArea(.all)
//                        NavigationView {
//                            WorkoutLogView(workout: $workout)
//                        }
//                    }
//                    .accentColor(Color("angelYellow"))
//                }
            }
            ) {
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
                        TextField("40", text: $lbs)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: width/8)
                            .foregroundColor(.black)
                        Text("lbs")
                        Spacer()
                        TextField("40", text: $reps)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: width/8)
                            .foregroundColor(.black)
                        Text("Reps")
                        Spacer()
                        TextField("40", text: $sets)
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
                        print("hi")
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
        .navigationDestination(for: [Binding<Workout>].self) { workoutArr in
            WorkoutLogView(workout: workoutArr[0])
        }
        .foregroundColor(.white)
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .background(Color("royalBlue"))
        .toolbarBackground(Color("royalBlue"), for: .navigationBar)
        .accentColor(Color("angelYellow"))
        .navigationTitle(workout.name)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .onChange(of: sharedData.presented) { presented in
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        @State var workoutsPath = NavigationPath()
        Group {
            NavigationStack(path: $workoutsPath) {
                WorkoutView(workout: .constant(WorkoutDay.sampleData[0].workouts[0]))
            }
        }.environmentObject(SharedData())
    }
}
