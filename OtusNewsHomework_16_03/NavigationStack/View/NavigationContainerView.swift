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
    
    @State var opacity = 0
    
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
                VStack {
                    HStack {
                        Button {
                            viewModel.pop()
                        } label: {
                            Text("Back")
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                        }
                        .padding(.leading, 35)
                        .foregroundColor(Color("textColor"))
                        Spacer()
                    }
                    .frame(height: 40)
                    .background(Color("cellColor"))
                    .onAppear {
                        withAnimation {
                            opacity += 1
                        }
                    }
                    .onDisappear(perform: {
                        withAnimation {
                            opacity -= 1
                        }
                    })
                    .opacity(Double(opacity))
                    Spacer()
                }
                viewModel.currentScreen?.view.environmentObject(self.viewModel)
                    .animation(animation)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
                    .padding(.top, 40)
            }
        }
    }
}
