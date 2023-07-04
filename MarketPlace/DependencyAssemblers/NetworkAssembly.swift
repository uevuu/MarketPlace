//
//  NetworkAssembly.swift
//  MarketPlace
//
//  Created by Nikita Marin on 03.07.2023.
//

import Swinject

final class NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LogInService.self) { _ in
            LogInService()
        }
        .inObjectScope(.container)
        
        container.register(SignUpService.self) { _ in
            SignUpService()
        }
        .inObjectScope(.container)
    }
}
