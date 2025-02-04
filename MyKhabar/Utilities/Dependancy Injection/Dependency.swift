//
//  Injected.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 30/01/25.
//

import Foundation

@MainActor
@propertyWrapper
struct Dependency<Dependency> {
    
    var dependency: Dependency
    
    init(_ dependencyType: DependencyType = .newInstance) {
        guard let dependency = DependencyInjectionContainer.resolve(dependencyType: dependencyType,
                                                                    Dependency.self) else {
            fatalError("No dependency of type \(String(describing: Dependency.self)) registered!")
        }
        
        self.dependency = dependency
    }
    
    var wrappedValue: Dependency {
        get { self.dependency }
        mutating set { dependency = newValue }
    }
}
