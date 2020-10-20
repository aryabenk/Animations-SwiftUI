//
//  SearchBar.swift
//  Animations-SwiftUI
//
//  Created by Anastasia Ryabenko on 20.10.2020.
//

import SwiftUI

struct SearchBar: View {
    
    @State var text: String = ""
    @State var placeholder: String = ""
    
    @State var iconColor = Colors.violet
    @State var textPadding: CGFloat = 0
    
    @State var iconX: CGFloat = 0
    @State var iconY: CGFloat = -40
    
    var appearingIconX: CGFloat = 0
    var staticIconX: CGFloat = 130
    var staticIconY: CGFloat = 0
    
    @State var searchBarWidth: CGFloat = 50
    @State var searchBarHeight: CGFloat = 50
    
    var appearingSearchBarDiameter: CGFloat = 50
    var staticSearchBarWidth: CGFloat = 300
    
    @State private var rotationDegree = Angle.degrees(0)
    
    @State private var didAppear = false
    @State private var didSearch = false

    var body: some View {
        HStack {
        	ZStack {
        	    TextField(placeholder, text: self.$text)
                    .font(.system(size: 17, weight: .regular, design: .rounded))
        	        .disableAutocorrection(true)
        	        .foregroundColor(Color.black)
        	        .frame(width: searchBarWidth, height: searchBarHeight)
        	        .padding(.leading, textPadding)
        	        .background(
        	            Colors.lightGray.opacity(0.3).cornerRadius(25)
        	        )
                    .scaleEffect(didAppear ? 1 : 0)
                Image(systemName: didSearch ? "checkmark.circle.fill" : "magnifyingglass")
                    .font(.system(size: 24, weight: .medium, design: .monospaced))
                    .foregroundColor(iconColor)
                    .offset(x: iconX, y: iconY)
                    .rotationEffect(rotationDegree, anchor: .center)
                    .scaleEffect(didAppear ? 1 : 0)
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                                        to: nil, from: nil, for: nil)
                        withAnimation(Animation.easeOut(duration: 0.25)) {
                            hideSearchBar()
                        }
                    }
        	}
        }.onAppear() {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                showSearchBar()
                showIcon()
            }
        }
    }

    private func showIcon() {
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: false) { _ in
            withAnimation(Animation.easeOut(duration: 0.3)) {
                rotationDegree = Angle.init(degrees: -360)
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { _ in
            withAnimation(Animation.easeIn(duration: 0.1)) {
                iconY = staticIconY
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 1.1, repeats: false) { _ in
            withAnimation(Animation.easeOut(duration: 0.2)) {
                iconX = staticIconX
            }
        }
    }
    
    private func showSearchBar() {
        withAnimation(Animation.easeOut(duration: 0.25)) {
            didAppear = true
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { _ in
            withAnimation(Animation.easeOut(duration: 0.2)) {
                searchBarWidth = staticSearchBarWidth
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 1.1, repeats: false) {_ in
            withAnimation(Animation.easeOut(duration: 0.2)) {
                textPadding = 20
                placeholder = "Search"
            }
        }
    }
   
    private func hideSearchBar() {
        placeholder = ""
        text = ""
        textPadding = 0
        withAnimation(Animation.easeOut(duration: 0.3)) {
            searchBarWidth = appearingSearchBarDiameter
            iconX = appearingIconX
        }
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) {_ in
            withAnimation(Animation.easeOut(duration: 0.5)) {
                rotationDegree = Angle.init(degrees: 360)
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) {_ in
            withAnimation(Animation.easeOut(duration: 0.1)) {
                didSearch.toggle()
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) {_ in
            withAnimation(Animation.easeOut(duration: 0.15)) {
                didAppear = false
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
