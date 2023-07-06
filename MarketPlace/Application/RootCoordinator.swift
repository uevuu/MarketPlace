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
    
    init(window: UIWindow, resolver: Resolver) {
        self.window = window
        self.resolver = resolver
    }
    
    deinit {
        print("deinit")
    }
    
    func start() {
//        showLoginFlow()
        showUserFlow()
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
        let userTabBarCoordinator = UserTabBarCoordinator(
            window: window,
            resolver: resolver
        ) { [weak self] in
            self?.childCoordinators.removeFlowCoordinator(ofType: UserTabBarCoordinator.self)
        }
        userTabBarCoordinator.start(animated: false)
        childCoordinators.append(userTabBarCoordinator)
    }
}
