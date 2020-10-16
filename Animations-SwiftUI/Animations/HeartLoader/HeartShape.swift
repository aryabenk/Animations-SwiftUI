//
//  Letter.swift
//  Animations-SwiftUI
//
//  Created by Anastasia Ryabenko on 16.10.2020.
//

import SwiftUI

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }

    var centeredSquare: CGRect {
        let width = ceil(min(size.width, size.height))
        let height = width*0.8

        let newOrigin = CGPoint(x: origin.x + (size.width - width) / 2, y: origin.y + (size.height - height) / 2)
        let newSize = CGSize(width: width, height: height)
        return CGRect(origin: newOrigin, size: newSize)
    }
    
    func flatten() -> (CGFloat, CGFloat, CGFloat, CGFloat) {
        return (origin.x, origin.y, size.width, size.height)
    }
}

struct HeartShape: Shape {

    func path(in rect: CGRect) -> Path {
        let (x, y, width, height) = rect.centeredSquare.flatten()
        let lowerPoint = CGPoint(x: x + width / 2, y: (y + height))
                
        let path = Path { p in
            p.move(to: lowerPoint)
            p.addCurve(to: CGPoint(x: x, y: (y + (height / 4))),
                          control1: CGPoint(x: (x + (width / 2) - 10),
                                            y: (y + (height * 3 / 4))),
                          control2: CGPoint(x: x, y: (y + (height / 2))))
            p.addArc(center: CGPoint(x: (x + (width / 4)), y: (y + (height / 4))),
                         radius: (width / 4),
                         startAngle: .degrees(180),
                         endAngle: .zero,
                         clockwise: false)
            p.addArc(center: CGPoint(x: (x + (width * 3 / 4)), y: (y + (height / 4))),
                        radius: (width / 4),
                        startAngle: .degrees(180),
                        endAngle: .zero,
                        clockwise: false)
            p.addCurve(to: lowerPoint,
                          control1: CGPoint(x: (x + width), y: (y + (height / 2))),
                          control2: CGPoint(x: (x + (width / 2) + 10), y: (y + (height * 3 / 4))))
        }
        return path
    }
}

struct LetterShape_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            HeartShape()
                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round, miterLimit: 8))
                .foregroundColor(Color.white)
        }
    }
}
