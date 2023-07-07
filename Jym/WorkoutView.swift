//
//  WorkoutView.swift
//  Jym
//
//  Created by John Smith on 7/4/23.
//

import SwiftUI

struct WorkoutView: View {
    @Binding var workout: Workout
    @State private var lbs: String = ""
    @State private var reps: String = ""
    @State private var sets: String = ""
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        @State var sortOrder = [KeyPathComparator(\Record.date)]
        let df: DateFormatter = {
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("M/dd/yy")
            return formatter
        }()
        var recentRecords: [Record] {
            let sorted = workout.records.sorted {
                $0.date < $1.date
            }
            return sorted.suffix(3)
        }
        List {
            VStack {
                HStack {
                    Text(workout.name)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .bold()
                }
            }
            .listRowInsets(EdgeInsets())
            .listRowBackground(
                Color("royalBlue")
            )
            Section(header: Text("Progress Chart")) {
                WorkoutChartView(workout: $workout)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(
                        Color("royalBlue")
                    )
            }
            .headerProminence(.increased)
            Section(header: HStack {
                Text("Workout Log")
                Spacer()
                NavigationLink {
                    Text("hi")
                } label: {
                    Text("Show More")
                        .font(Font.subheadline)
                        .foregroundColor(Color("angelYellow"))
                }
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
                        GridRow {
                            Text(df.string(from: record.date))
                            Text(String(record.weight))
                            Text(String(record.reps))
                            Text(String(record.sets))
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
        .padding(.top, -35)
        .foregroundColor(.white)
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .background(Color("royalBlue"))
        .toolbarBackground(Color("royalBlue"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .accentColor(Color("angelYellow"))
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(workout: .constant(WorkoutDay.sampleData[0].workouts[0]))
    }
}
