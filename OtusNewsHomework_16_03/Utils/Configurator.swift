//
//  Configurator.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 06.04.2022.
//

import Foundation

class Configurator {
    static let shared = Configurator()
    let serviceLocator = ServiceLocator()
    
    func setup() {
        registerServices()
    }
    
   private func registerServices() {
        serviceLocator.addService(service: ArticleListNetworkService())
    }
}
