//
//  Letter.swift
//  Animations-SwiftUI
//
//  Created by Anastasia Ryabenko on 16.10.2020.
//

import SwiftUI

struct CircleLoader: View {
    
    let diameter: CGFloat!
    let thick: CGFloat!
    let loadingColor: LinearGradient!
    let animationDuration: Double!
    private let rotationsCount: Double = 3
    
    private var loaderStartPoint: CGFloat = 0.15
    @State private var loaderEndPoint: CGFloat = 0.325
    
    @State private var rotationDegree = Angle.degrees(0)
    
    init(color: Color, diameter: CGFloat, thick: CGFloat, animationDuration: Double) {
        self.loadingColor = LinearGradient(gradient: .init(colors: [color,
                                                                    color.opacity(0.5)]),
                                           startPoint: .top,
                                           endPoint: .bottom)
        self.diameter = diameter
        self.thick = thick
        self.animationDuration = animationDuration
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: thick))
                .fill(Colors.lightGray)
            Circle()
                .trim(from: loaderStartPoint, to: loaderEndPoint)
                .stroke(style: StrokeStyle(lineWidth: thick, lineCap: .butt))
                .fill(loadingColor)
                .rotationEffect(rotationDegree)
        }.frame(width: diameter, height: diameter)
        .onAppear() {
            animateLoader()
            Timer.scheduledTimer(withTimeInterval: self.rotationsCount * animationDuration + (animationDuration), repeats: true) {_ in
                animateLoader()
            }
        }
    }
    
    private func getRotationAngle() -> Angle {
        return .degrees(360 * rotationsCount) + .degrees(45)
    }
    
    private func animateLoader() {
        withAnimation(Animation.spring(response: animationDuration * 2 )) {
            rotationDegree = .degrees(-45)
        }
        
        Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
            withAnimation(Animation.easeInOut(duration: rotationsCount * animationDuration)) {
                rotationDegree += getRotationAngle()
                loaderEndPoint = 0.9
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: rotationsCount * animationDuration, repeats: false) { _ in
            rotationDegree = .degrees(45)
            withAnimation(Animation.easeOut(duration: animationDuration)) {
                loaderEndPoint = 0.325
            }
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        CircleLoader(color: Colors.violet, diameter: 40, thick: 8, animationDuration: 0.7)
    }
}
