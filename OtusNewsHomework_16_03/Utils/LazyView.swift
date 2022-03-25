//
//  LazyView.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 18.03.2022.
//

import Foundation
import SwiftUI

struct LazyView<Content: View>: View {
    
    let build: ()-> Content
    init(_ build: @autoclosure @escaping ()-> Content) {
        self.build = build
    }
    
    var body: some View {
        build()
    }
}
