//
//  Letter.swift
//  Animations-SwiftUI
//
//  Created by Anastasia Ryabenko on 16.10.2020.
//

import SwiftUI

struct HeartLoader: View {
    var color: Color!
    let animationDuration: Double!
    let diameter: CGFloat!
    let thick: CGFloat!
    
    @State private var loaderStartPoint: CGFloat = 0
    @State private var loaderEndPoint: CGFloat = 0

    init(color: Color, diameter: CGFloat, thick: CGFloat, animationDuration: Double) {
        self.color = color
        self.diameter = diameter
        self.thick = thick
        self.animationDuration = animationDuration
    }
    
    var body: some View {
        ZStack {
            HeartShape()
                .stroke(style: StrokeStyle(lineWidth: thick,
                                           lineCap: .round,
                                           lineJoin: .round))
                .foregroundColor(color)
                .opacity(0.5)
            HeartShape()
                .trim(from: loaderStartPoint, to: loaderEndPoint)
                .stroke(style: StrokeStyle(lineWidth: thick,
                                           lineCap: .round,
                                           lineJoin: .round))
                .foregroundColor(color)
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: true) { timer in
                        animate()
                    }
                }
        }.frame(width: diameter, height: diameter)
    }
    
    private func animate() {
        if loaderEndPoint >= 1 && loaderStartPoint < 1 {
            withAnimation(Animation.easeOut(duration: animationDuration)) {
                loaderStartPoint += 0.1
            }
        }
        if loaderEndPoint >= 1 && loaderStartPoint >= 1 {
            Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
                loaderEndPoint = 0
                loaderStartPoint = 0
            }
        }
        if loaderEndPoint < 1 {
            withAnimation(Animation.easeOut(duration: animationDuration)) {
                loaderEndPoint += 0.1
            }
        }
        
    }
}

struct HeartLoader_Previews: PreviewProvider {
    static var previews: some View {
        HeartLoader(color: Colors.violet, diameter: 50, thick: 6, animationDuration: 0.15)
    }
}
