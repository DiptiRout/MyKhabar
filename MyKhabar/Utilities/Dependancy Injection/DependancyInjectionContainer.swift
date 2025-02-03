//
//  DependancyInjectionContainer.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 30/01/25.
//

import Foundation

enum DependencyType {
    case singleton
    case newInstance
    case automatic
}


@MainActor
final class DependencyInjectionContainer {
    
    private static var cache: [String: Any] = [:]
    private static var generators: [String: () -> Any] = [:]
    
    static func register<Dependancy>(type: Dependancy.Type, as dependencyType: DependencyType = .automatic, _ factory: @autoclosure @escaping () -> Dependancy) {
        generators[String(describing: type.self)] = factory
        
        if dependencyType == .singleton {
            cache[String(describing: type.self)] = factory()
        }
    }
    
    static func resolve<Dependancy>(dependencyType: DependencyType = .automatic, _ type: Dependancy.Type) -> Dependancy? {
        let key = String(describing: type.self)
        switch dependencyType {
        case .singleton:
            if let cachedDependancy = cache[key] as? Dependancy {
                return cachedDependancy
            } else {
                fatalError("\(String(describing: type.self)) is not registeres as singleton")
            }
            
        case .automatic:
            if let cachedDependancy = cache[key] as? Dependancy {
                return cachedDependancy
            }
            fallthrough
            
        case .newInstance:
            if let dependancy = generators[key]?() as? Dependancy {
                cache[String(describing: type.self)] = dependancy
                return dependancy
            } else {
                return nil
            }
        }
    }
}

