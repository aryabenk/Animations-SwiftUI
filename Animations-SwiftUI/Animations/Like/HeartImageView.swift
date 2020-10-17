//
//  HeartImageView.swift
//  Animations-SwiftUI
//
//  Created by Anastasia Ryabenko on 17.10.2020.
//

import SwiftUI

struct HeartImageView: View {
    
    var size: CGFloat!
    
    init(size: CGFloat) {
        self.size = size
    }
    
    var body: some View {
        Image(systemName: "suit.heart.fill")
            .font(.system(size: size, weight: .medium, design: .monospaced))
    }
}

struct HeartImageView_Previews: PreviewProvider {
    static var previews: some View {
        HeartImageView(size: 40)
    }
}
