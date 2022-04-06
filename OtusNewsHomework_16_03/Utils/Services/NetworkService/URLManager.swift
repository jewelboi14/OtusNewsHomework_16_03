//
//  URLManager.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 06.04.2022.
//

import Foundation

struct URLManager {
    
    static let apiKey = "09b27589cedc4ee0997888c6e70a877e"
    
    static func getMainUrl(page: Int, category: String) -> String {
        "https://newsapi.org/v2/top-headlines?country=us&\(page)=1&category=\(category)&apiKey=\(apiKey)"
    }
}
