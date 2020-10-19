//
//  CheckBox.swift
//  Animations-SwiftUI
//
//  Created by Anastasia Ryabenko on 18.10.2020.
//

import SwiftUI

struct CheckBox: View {
    private let animationDuration: Double = 0.35
    private let size: CGFloat = 80
    @State private var isChecked: Bool = false
    
    @State private var checkMarkColor = Colors.violet
    @State private var loadingColor = LinearGradient(gradient: .init(colors: [Colors.violet, Colors.violet.opacity(0.3)]),
                                                     startPoint: .top,
                                                     endPoint: .bottom)
    
    var body: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6, style: .circular)
                    .stroke(style: StrokeStyle(lineWidth: 6))
                    .fill(Colors.lightGray)
                RoundedRectangle(cornerRadius: 6, style: .circular)
                    .trim(from: 0, to: isChecked ? 1 : 0)
                    .stroke(style: StrokeStyle(lineWidth: 6))
                    .fill(loadingColor)
                    .animation(.easeIn(duration: animationDuration))
                    .rotationEffect(Angle.degrees(-90))
                СheckMark()
                    .trim(from: 0, to: isChecked ? 1 : 0)
                    .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round))
                    .foregroundColor(checkMarkColor)
                    .offset(x: -4, y: 4)
                    .animation(.easeIn(duration: animationDuration))
            }
            .frame(width: size, height: size)
            .onTapGesture {
                isChecked.toggle()
                if isChecked {
                    Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
                        withAnimation(Animation.easeIn(duration: animationDuration)) {
                            loadingColor = LinearGradient(gradient: .init(colors: [Colors.violet,
                                                                                   Colors.violet]),
                                                           startPoint: .top,
                                                           endPoint: .bottom)
                        }
                    }
                } else {
                    loadingColor = LinearGradient(gradient: .init(colors: [Colors.violet,
                                                                           Colors.violet.opacity(0.3)]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                }
            }
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox()
    }
}
