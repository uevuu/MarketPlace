//
//  RootCoordinator.swift
//  MarketPlace
//
//  Created by Nikita Marin on 03.07.2023.
//

import UIKit
import Swinject

// MARK: - RootCoordinator
final class RootCoordinator {
    private let window: UIWindow
    private let resolver: Resolver
    
    init(window: UIWindow, resolver: Resolver) {
        self.window = window
        self.resolver = resolver
    }
    
    func start() {
        showLoginFlow()
        window.makeKeyAndVisible()
    }
    
    private func showLoginFlow() {
        let welcomeCoordinator = WelcomeCoordinator(
            resolver: resolver,
            window: window
        )
        welcomeCoordinator.start(animated: false)
    }
    
    private func showMainFlow() {
    }
}
