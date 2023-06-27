//
//  ProfileView.swift
//  Jym
//
//  Created by John Smith on 6/5/23.
//

import SwiftUI

struct ProfileView: View {
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    var body: some View {
        VStack {
            Color.clear
                .frame(height: height/2)
                .overlay(
                    VStack {
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: width/2.3)
                            Circle()
                                .overlay(
                                    Image("ShawnMendes")
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(Circle())
                                )
                                .frame(width: width/2.5)
                            
                        }
                        Text("Shawn Mendes")
                            .bold()
                            .font(.system(size: 20))
                    }
                    
                    
                )
                .background(
                    VStack {
                        Color.black
                            .cornerRadius(20)
                            .padding()
                        Color.white
                            .padding()
                    }
                )
            
            
            Spacer()
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
