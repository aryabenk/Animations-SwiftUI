//
//  Loader.swift
//  Animations-SwiftUI
//
//  Created by Anastasia Ryabenko on 19.10.2020.
//

import SwiftUI

struct SwitchLoader: View {
    var activeColor: Color = Colors.violet
    var inactiveColor: Color = Colors.lightGray
    
    var capsuleDiameter: CGFloat = 44
    
    @Binding var isAnimating: Bool
    var animationDuration: Double = 0.2
    
    @Binding var switchState: SwitchState
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            Capsule()
                .foregroundColor(switchState == .on ? activeColor : inactiveColor)
                .frame(width: isAnimating ? 120 : capsuleDiameter,
                       height: isAnimating ? capsuleDiameter-10 : capsuleDiameter,
                       alignment: .center)
                .animation(.easeIn(duration: animationDuration))
                .offset(x: isAnimating ? switchState.startOffset.x : switchState.endOffset.x,
                        y: 0)
        })
    }
}

struct SwitchLoader_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            //SwitchLoader(switchState: `$`.on, isAnimating: $true)
        }
    }
}
