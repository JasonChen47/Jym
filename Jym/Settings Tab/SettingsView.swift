//
//  SettingsView.swift
//  Jym
//
//  Created by John Smith on 6/19/23.
//

import SwiftUI

struct SettingsView: View {
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    let cornerRadius: CGFloat = 10
    enum weightUnit: String, CaseIterable, Identifiable {
        case lb, kg
        var id: Self { self }
    }
    @State private var selectedWeightUnit: weightUnit = .lb
    var body: some View {
        NavigationStack {
            List {
                VStack {
                    HStack {
                        Text("Settings")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .bold()
                        Spacer()
                    }
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(
                    Color("royalBlue")
                )
                Section {
                    NavigationLink {
                        Text("hi")
                    } label: {
                        Text("About")
                    }
                    .listRowSeparatorTint(.yellow)
                    .foregroundColor(Color("angelYellow"))
                    .listRowBackground(Color("royalBlueLight"))
                }
                Section {
                    HStack {
                        Text("Weight Units")
                        Spacer()
                        Picker("Weight Units", selection: $selectedWeightUnit) {
                            ForEach(weightUnit.allCases) { unit in
                                Text(unit.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        .frame(width: width/3)
                    }
                    .listRowSeparatorTint(.white)
                    .foregroundColor(Color("angelYellow"))
                    .listRowBackground(Color("royalBlueLight"))
                }
                Section(header: Text("Upload or Download Data")) {
                    Button{
                        print("hi")
                    } label: {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                            Text("Upload Data")
                        }
                    }
                    Button{
                        print("hi")
                    } label: {
                        HStack {
                            Image(systemName: "square.and.arrow.down")
                            Text("Download Data")
                        }
                    }
                }
                .listRowSeparatorTint(.white)
                .foregroundColor(Color("angelYellow"))
                .listRowBackground(Color("royalBlueLight"))
            }
            .foregroundColor(.white)
            .scrollContentBackground(.hidden)
            .scrollIndicators(.hidden)
            .background(Color("royalBlue"))
            .toolbarBackground(Color("royalBlue"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .accentColor(Color("angelYellow"))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
