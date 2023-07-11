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
    private var childCoordinators: [FlowCoordinatorProtocol] = []
    private var isAuth = true
    
    init(window: UIWindow, resolver: Resolver) {
        self.window = window
        self.resolver = resolver
    }
    
    deinit {
        print("deinit")
    }
    
    func start() {
        isAuth ? showUserFlow() : showLoginFlow()
        window.makeKeyAndVisible()
    }
    
    private func showLoginFlow() {
        let welcomeCoordinator = WelcomeCoordinator(
            resolver: resolver,
            window: window
        ) { [weak self] in
            self?.childCoordinators.removeFlowCoordinator(ofType: WelcomeCoordinator.self)
            self?.showUserFlow()
        }
        welcomeCoordinator.start(animated: false)
        childCoordinators.append(welcomeCoordinator)
    }
    
    private func showUserFlow() {
        let userTabBarCoordinator = SellerTabBarCoordinator(
            window: window,
            resolver: resolver
        ) { [weak self] in
            self?.childCoordinators.removeFlowCoordinator(ofType: SellerTabBarCoordinator.self)
            self?.showLoginFlow()
        }
        userTabBarCoordinator.start(animated: false)
        childCoordinators.append(userTabBarCoordinator)
    }
}
