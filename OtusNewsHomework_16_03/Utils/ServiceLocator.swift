//
//  ServiceLocator.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 06.04.2022.
//

import Foundation

protocol ServiceLocating {
    func getService<T: AnyObject>(type: T.Type) -> T?
}

final class ServiceLocator: NSObject {
    
    private var containerServices = [String: AnyObject]()
    
    func addService<T:AnyObject>(service: T) {
        let key = "\(T.self)"
        if containerServices[key] == nil {
            containerServices[key] = service
        }
    }
    
    func getService<T:AnyObject>(type: T.Type)->T? {
        let key = "\(T.self)"
        return containerServices[key] as? T
    }
}

extension ServiceLocator: ServiceLocating { }


