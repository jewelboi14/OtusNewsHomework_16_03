//
//  Transition.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 18.03.2022.
//

import Foundation
import SwiftUI

enum Transition {
    case none
    case custom(AnyTransition)
}

enum NavigationType {
    case pop
    case push
    case popToRoot
}
