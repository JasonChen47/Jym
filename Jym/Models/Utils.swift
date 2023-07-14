//
//  Utils.swift
//  Jym
//
//  Created by John Smith on 7/13/23.
//

import Foundation
import SwiftUI

class Utils {
   static func navigationBarConfig(){
       let appearance = UINavigationBarAppearance()
       appearance.configureWithOpaqueBackground()
       appearance.backgroundColor = UIColor(Color("royalBlue"))
       appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
       appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
       let buttonAppearance = UIBarButtonItemAppearance()
       buttonAppearance.normal.titleTextAttributes = [
           .foregroundColor: UIColor(Color("angelYellow"))
       ]
       appearance.buttonAppearance = buttonAppearance
       appearance.backButtonAppearance = buttonAppearance
       appearance.doneButtonAppearance = buttonAppearance

       UINavigationBar.appearance().standardAppearance = appearance
       UINavigationBar.appearance().compactAppearance = appearance
       UINavigationBar.appearance().scrollEdgeAppearance = appearance

       UINavigationBar.appearance().tintColor = .white
   }
}

