//
//  SwitchState.swift
//  Animations-SwiftUI
//
//  Created by Anastasia Ryabenko on 19.10.2020.
//

import Foundation
import SwiftUI

enum SwitchState {
    case on
    case off
    
    var startOffset: (x: CGFloat, y: CGFloat) {
        switch self {
        case .on:
            return (38,0)
        case .off:
            return (38,0)
        }
    }
    
    var endOffset: (x: CGFloat, y: CGFloat) {
        switch self {
        case .on:
            return (76,0)
        case .off:
            return (0,0)
        }
    }
}
