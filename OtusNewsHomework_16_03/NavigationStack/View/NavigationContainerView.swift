//
//  NavigationContainerView.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 18.03.2022.
//

import Foundation
import SwiftUI

struct NavigationContainerView<Content:View>: View {
    
    //MARK: - Stored Properties
    
    @ObservedObject var viewModel = NavigationContainerViewModel()
    
    private let content: Content
    private let animation: Animation = .easeOut(duration: 0.3)
    private let transition: (push: AnyTransition, pop: AnyTransition)
    
    //MARK: - Lifecycle
    
    init(transition: Transition, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        switch transition {
        case .none:
            self.transition = (.identity , .identity)
        case .custom(let transition):
            self.transition = (transition, transition)
        }
    }
    
    //MARK: - View Properties
    
    var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            if isRoot {
                self.content.environmentObject(self.viewModel)
                    .animation(animation)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            } else {
                viewModel.currentScreen?.view.environmentObject(self.viewModel)
                    .animation(animation)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            }
        }
    }
}
