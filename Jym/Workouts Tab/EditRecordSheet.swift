//
//  EditRecordSheet.swift
//  Jym
//
//  Created by John Smith on 1/9/24.
//

import SwiftUI

struct EditRecordSheet: View {
    
    @Binding var record: Record
    @Binding var records: [Record]
    @Binding var isPresentingEditRecordsSheet: Bool
    
    @State private var editingRecord = Record.emptyRecord
    @State private var displayRecord = Record.emptyRecord
    
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        let df: DateFormatter = {
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("M/dd/yy")
            return formatter
        }()
        List {
            Section(header: Text("Workout Record").foregroundColor(.white)) {
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
                    GridRow {
                        Text(df.string(from: displayRecord.date))
                        Text(String(displayRecord.weight))
                        Text(String(displayRecord.reps))
                        Text(String(displayRecord.sets))
                    }
                }
            }
            .listRowSeparatorTint(.yellow)
            .foregroundColor(Color("angelYellow"))
            .listRowBackground(
                Color("royalBlueLight")
            )
            Section(header: Text("Edit Date").foregroundColor(.white)) {
                DatePicker(
                        "Workout Date",
                        selection: $editingRecord.date,
                        in: ...Date(),
                        displayedComponents: [.date]
                    )
            }
//            Section(header: Text("Edit Stats").foregroundColor(.white)) {
//            }
            Section(header: Text("Edit Stats").foregroundColor(.white)) {
                VStack {
                    HStack {
                        TextField("", value: $editingRecord.weight, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .frame(width: width/8)
                            .foregroundColor(.black)
                        Text("lbs")
                        Spacer()
                        TextField("", value: $editingRecord.reps, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .frame(width: width/8)
                            .foregroundColor(.black)
                        Text("Reps")
                        Spacer()
                        TextField("", value: $editingRecord.sets, formatter: NumberFormatter())
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
                            // Remove all other records in the same day other than the one with the UUID of the record that was just added
                            records.removeAll {
                                Calendar.current.isDate($0.date, inSameDayAs: editingRecord.date) && $0.id != record.id
                            }
                            // Set the record equal to what has been edited with a new UUID
                            record = Record(date: editingRecord.date, weight: editingRecord.weight, reps: editingRecord.reps, sets: editingRecord.sets)
                            // Update the display record to show what the record has been changed to
                            displayRecord = editingRecord
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
        }
        .scrollContentBackground(.hidden)
        .background(Color("royalBlue"))
        .onAppear {
            editingRecord = record
            displayRecord = record
        }
        
    }
}

#Preview {
    NavigationStack {
        EditRecordSheet(record: .constant(WorkoutDay.sampleData[0].workouts[0].records[0]), records: .constant(WorkoutDay.records), isPresentingEditRecordsSheet: .constant(true))
    }
    
}
