//
//  ExpandingView.swift
//  Animations-SwiftUI
//
//  Created by Anastasia Ryabenko on 18.10.2020.
//

import SwiftUI

enum Direction {
    case bottom
    case left
    case right
    case top
    
    var startOffset: (x: CGFloat, y: CGFloat) {
        switch self {
        case .bottom:
            return (16, 16)
        case .left:
            return (-16, 16)
        case .top:
            return (-16, -16)
        case .right:
            return (16, -16)
        }
    }
    
    var expandedOffset: (x: CGFloat, y: CGFloat) {
        switch self {
        case .bottom:
            return (-16, 50)
        case .left:
            return (-50, -16)
        case .top:
            return (16, -50)
        case .right:
            return (50, 16)
        }
    }
}

struct ExpandingView: View {
    private var color: Color!
    @State private var isAnimating: Bool = false
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        ZStack {
            ZStack {
                ExpandingItem(color: color, iconName: "applewatch", direction: .bottom, isAnimating: isAnimating)
                ExpandingItem(color: color, iconName: "airpods", direction: .left, isAnimating: isAnimating)
                ExpandingItem(color: color, iconName: "homepod", direction: .right, isAnimating: isAnimating)
                ExpandingItem(color: color, iconName: "airpodspro", direction: .top, isAnimating: isAnimating)
            }
        }
        .onTapGesture {
            isAnimating.toggle()
        }
    }
}

struct AExpandingView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandingView(color: Colors.violet)
    }
}
