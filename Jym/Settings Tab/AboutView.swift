//
//  AboutView.swift
//  Jym
//
//  Created by John Smith on 7/15/23.
//

import SwiftUI

struct AboutView: View {
    
    init() {
        Utils.navigationBarConfig()
    }
    
    var body: some View {
        List {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .listRowSeparatorTint(.white)
                .foregroundColor(Color("angelYellow"))
                .listRowBackground(Color("royalBlueLight"))
        }
        .navigationTitle("About")
        .foregroundColor(.white)
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .background(Color("royalBlue"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        @State var path = NavigationPath()
        NavigationStack(path: $path) {
            AboutView()
        }
    }
}
