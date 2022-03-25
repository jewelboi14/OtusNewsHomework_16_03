//
//  NavigationContainerViewModel.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 18.03.2022.
//

import Foundation
import SwiftUI

final class NavigationContainerViewModel: ObservableObject {
    
    @Published var currentScreen: Screen?
    
    var navigationType: NavigationType = .push
    
    var screenStack = NavigationStack() {
        didSet {
            self.currentScreen = screenStack.top()
        }
    }
    
    func push(screenView: AnyView) {
        self.navigationType = .push
        let screen = Screen(view: screenView)
        screenStack.push(screen)
    }
    
    func pop() {
        self.navigationType = .pop
        screenStack.pop()
    }
    
    func popToRoot() {
        self.navigationType = .popToRoot
        screenStack.popToRoot()
    }
}
