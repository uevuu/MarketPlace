//
//  WelcomeCoordinator.swift
//  MarketPlace
//
//  Created by Nikita Marin on 03.07.2023.
//

import UIKit
import Swinject

// MARK: - WelcomeCoordinator
final class WelcomeCoordinator: FlowCoordinatorProtocol {
    private let resolver: Resolver
    private let window: UIWindow
    private weak var navigationController: UINavigationController?
    
    init(
        resolver: Resolver,
        window: UIWindow
    ) {
        self.resolver = resolver
        self.window = window
    }
    
    func start(animated: Bool) {
        let builder = WelcomeBuilder(moduleOutput: self)
        let viewController = builder.build()
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        window.rootViewController = navigationController
    }
    
    func finish(animated: Bool, completion: (() -> Void)?) {
    }
}

// MARK: - WelcomePresenterOutput
extension WelcomeCoordinator: WelcomePresenterOutput {
    func goToLogInModule() {
        let logInCoordinator = LogInCoordinator(
            resolver: resolver,
            navigationController: navigationController
        )
        logInCoordinator.start(animated: true)
    }
    
    func goToSignUpModule() {
        let sigUpCoordinator = SignUpCoordinator(
            resolver: resolver,
            navigationController: navigationController
        )
        sigUpCoordinator.start(animated: true)
    }
}
