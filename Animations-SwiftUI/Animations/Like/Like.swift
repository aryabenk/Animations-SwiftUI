//
//  Like.swift
//  Animations-SwiftUI
//
//  Created by Anastasia Ryabenko on 17.10.2020.
//

import SwiftUI

import SwiftUI

struct Like: View {
    let color: Color!
    let size: CGFloat!
    let animationDuration: Double!
    
    @State private var isLiked: Bool = false
    @State private var increaseIconSize: Bool = false
    @State private var reduceIconSize: Bool = false
    @State private var isHeartFloating: Bool = false
    
    init(color: Color, size: CGFloat, animationDuration: Double) {
        self.color = color
        self.size = size
        self.animationDuration = animationDuration
    }
    
    var body: some View {
        ZStack {
            HeartImageView(size: size)
                .foregroundColor(isLiked ? Colors.violet : Colors.lightGray)
                .scaleEffect(increaseIconSize ? 1.25 : reduceIconSize ? 0.75 : 1)
                .animation(Animation.spring(response: animationDuration, dampingFraction: 1, blendDuration: 1))
            if isHeartFloating {
                FlyingHeart(isAnimating: $isHeartFloating)
            }
        }
        .onTapGesture {
            isHeartFloating.toggle()
            isLiked.toggle()
            if isLiked {
                increaseIconSize = true
            } else {
                reduceIconSize = true
            }
            Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
                increaseIconSize = false
                reduceIconSize = false
            }
        }
    }
}

struct Like_Previews: PreviewProvider {
    static var previews: some View {
        Like(color: Colors.violet, size: 60, animationDuration: 0.25)
    }
}
