//
//  Switch.swift
//  Animations-SwiftUI
//
//  Created by Anastasia Ryabenko on 19.10.2020.
//

import SwiftUI

struct Switch: View {
    var activeColor: Color = Colors.violet
    var inactiveColor: Color = Colors.lightGray
    @State var width: CGFloat = 140
    @State var height: CGFloat = 60
    @State var state: SwitchState = .off
    var animationDuration: Double = 0.4
    var stroke: CGFloat = 6
    
    @State private var isAnimating: Bool = false
    @State private var xOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: height/2, style: .circular)
                    .stroke(style: StrokeStyle(lineWidth: stroke))
                    .fill(state == .on ? activeColor : inactiveColor)
                    .frame(width: width, height: height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .animation(.easeIn(duration: animationDuration/2))
                    .offset(x: xOffset, y: 0)
                SwitchLoader(activeColor: activeColor,
                             inactiveColor: inactiveColor,
                             capsuleDiameter: height-16,
                             isAnimating: $isAnimating,
                             animationDuration: animationDuration,
                             switchState: $state)
                    .offset(x: -38, y: 0)
            }
        }.onTapGesture {
            changeState()
            
            Timer.scheduledTimer(withTimeInterval: animationDuration/2, repeats: false) { _ in
                isAnimating = false
            }
            
            Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
                animateHit()
            }
        }
    }
    
    func changeState() {
        isAnimating = true
        if state == .on {
            state = .off
        } else {
            state = .on
        }
    }
    
    private func animateHit() {
        withAnimation(Animation.easeInOut(duration: 0.05)) {
            width += 4
            if state == .on {
                xOffset += 4
            } else {
                xOffset -= 4
            }
        }
        width -= 4
        xOffset = 0
    }
}

struct Switch_Previews: PreviewProvider {
    static var previews: some View {
        Switch()
    }
}
