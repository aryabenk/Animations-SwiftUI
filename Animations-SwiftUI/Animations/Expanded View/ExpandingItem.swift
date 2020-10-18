//
//  ExpandingItem.swift
//  Animations-SwiftUI
//
//  Created by Anastasia Ryabenko on 18.10.2020.
//

import SwiftUI

struct ExpandingItem: View {
    private var color: Color!
    private var iconName: String!
    private var direction: Direction!
    private var isAnimating: Bool!
    private var diameter: CGFloat = 80
    
    init(color: Color, iconName: String, direction: Direction, isAnimating: Bool) {
        self.color = color
        self.isAnimating = isAnimating
        self.direction = direction
        self.iconName = iconName
    }
    
    var body: some View {
        ZStack {
            ZStack {
                Image(systemName: iconName)
                    .font(.system(size: 30, weight: .regular, design: .rounded))
                    .foregroundColor(Color.white)
                    .opacity(isAnimating ? 1 : 0)
                    .scaleEffect(isAnimating ? 1 : 0)
            }
            .frame(width: diameter, height: diameter)
            .background(color)
            .cornerRadius(diameter/2)
            .scaleEffect(isAnimating ? 1 : 0.25)
            .offset(x: isAnimating ? direction.expandedOffset.x : 0,
                    y: isAnimating ? direction.expandedOffset.y : 0)
            .animation(Animation.easeInOut(duration: 0.25))
            
        }.offset(x: direction.startOffset.x,
                 y: direction.startOffset.y)
    }
}

struct ExpandingItem_Previews: PreviewProvider {
    static var previews: some View {
        ExpandingItem(color: Colors.violet, iconName: "airpodspro", direction: .top, isAnimating: true)
    }
}
