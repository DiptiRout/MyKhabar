//
//  DependencyInjector.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 30/01/25.
//


final class DependencyInjector {
    @MainActor static func setup() {
        let newsAPIRepo = DefaultNewsAPIRepository()
        let newsAPIUseCase = NewsAPIUseCase(repository: newsAPIRepo)

        DependencyInjectionContainer.register(type: NewsAPIUseCaseProtocol.self, newsAPIUseCase)
        
        let authRepo = DefaultGoogleAuthenticationRepository()
        let faceIDRepo = DefaultFaceIDAuthRepository()
        let authUseCase = AuthenticationUseCase(gooleRepository: authRepo, faceIDAuthRepository: faceIDRepo)


        DependencyInjectionContainer.register(type: NewsAPIUseCaseProtocol.self, newsAPIUseCase)
        DependencyInjectionContainer.register(type: AuthenticationUseCaseProtocol.self, authUseCase)


    }
}
