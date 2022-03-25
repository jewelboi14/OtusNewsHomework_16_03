//
//  ConfigManager.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 18.03.2022.
//

import Foundation

final class ConfigManager {
    
    static let shared = ConfigManager()
    
    lazy var router: Router = {
        return Router()
    }()
    
}
