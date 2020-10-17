//
//  FloatingHeart.swift
//  Animations-SwiftUI
//
//  Created by Anastasia Ryabenko on 17.10.2020.
//

import SwiftUI

struct FlyingHeart: View {
    
    let animationDuration: TimeInterval = 0.45
    let animation = Animation.spring(response: 0.75).speed(0.75)
    
    @State private var scale: CGFloat = 1
    @State private var offset: CGSize = CGSize(width: 0, height: 0)
    @State private var rotationAngle: Angle = Angle.degrees(-4)
    @State private var opacity: Double = 1
    
    @Binding var isAnimating: Bool
    
    var body: some View {
        ZStack{
            HeartImageView(size: 30)
                .foregroundColor(Colors.violet.opacity(0.7))
        }
        .rotationEffect(rotationAngle)
        .scaleEffect(scale)
        .offset(offset)
        .opacity(opacity)
        .onAppear() {
            if isAnimating {
                flying()
            }
        }
    }
    
    func flying() {
        withAnimation(animation) {
            offset = CGSize(width: 10, height: -100)
            rotationAngle = .degrees(-45)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration * 0.5) {
            withAnimation(animation) {
                scale = 0.35
                offset = CGSize(width: -10, height: -200)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration * 0.75) {
            withAnimation(animation) {
                rotationAngle = .degrees(90)
                offset = CGSize(width: -10, height: -300)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
            withAnimation(animation) {
                rotationAngle = .degrees(0)
                opacity = 0
            }
        }
    }
}

struct FloatingLike_Previews: PreviewProvider {
    static var previews: some View {
        FlyingHeart(isAnimating: .constant(true))
    }
}
