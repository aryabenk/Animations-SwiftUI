//
//  CheckMark.swift
//  Animations-SwiftUI
//
//  Created by Anastasia Ryabenko on 18.10.2020.
//

import SwiftUI


struct СheckMark: Shape {
    let scaleFactor: CGFloat = 0.4
    
    func path(in rect: CGRect) -> Path {
        let centerX = rect.midX + 4
        let centerY = rect.midY - 3
        
        var path = Path()
        path.move(to: CGPoint(x: centerX - (42 * scaleFactor),
                              y: centerY - (4 * scaleFactor)))
        path.addLine(to: CGPoint(x: centerX - (scaleFactor * 18),
                                 y: centerY + (scaleFactor * 28)))
        path.addLine(to: CGPoint(x: centerX + (scaleFactor * 40),
                                 y: centerY - (scaleFactor * 36)))
        return path
    }
}

struct CheckMark_Previews: PreviewProvider {
    static var previews: some View {
        СheckMark()
    }
}
