//
//  NavigationStackViewModel.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 18.03.2022.
//

import Foundation

struct NavigationStack {
    
    //MARK: - Navigation Stack Methods
    
    private var screens = [Screen]()
    
    mutating func push(_ s: Screen) {
        self.screens.append(s)
    }
    
    mutating func pop() {
        _ = self.screens.popLast()
    }
    
    mutating func popToRoot() {
        self.screens.removeAll()
    }
    
    func top()->Screen? {
        return self.screens.last
    }
    
}
