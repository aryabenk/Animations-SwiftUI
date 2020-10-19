//
//  Letter.swift
//  Animations-SwiftUI
//
//  Created by Anastasia Ryabenko on 16.10.2020.
//

import SwiftUI

@main
struct Animations_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack{
                Color.white
                    .edgesIgnoringSafeArea(.all)
                //CircleLoader(color: Colors.violet, diameter:  40, thick: 8, animationDuration: 0.7)
                //HeartLoader(color: Colors.violet, diameter:   50, thick: 6, animationDuration: 0.15)
                //Like(color: Colors.violet, size: 60,  animationDuration: 0.25)
                //ExpandingView(color: Colors.violet)
                CheckBox()
            }
        }
    }
}

struct Animations_SwiftUIApp_Previews: PreviewProvider {
    static var previews: some View {
        //HeartLoader(color: Colors.violet, diameter: 50, thick: 6, animationDuration: 0.15)
        //CircleLoader(color: Colors.violet, diameter: 40, thick: 8, animationDuration: 0.7)
        //ExpandingView(color: Colors.violet)
        CheckBox()
    }
}
