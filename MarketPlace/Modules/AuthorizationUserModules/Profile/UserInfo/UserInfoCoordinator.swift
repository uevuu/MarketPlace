//
//  UserInfoCoordinator.swift
//  MarketPlace
//
//  Created by Nikita Marin on 06.07.2023.
//

import UIKit
import Swinject

// MARK: - UserInfoCoordinator
final class UserInfoCoordinator: FlowCoordinatorProtocol {
    private let resolver: Resolver
    private weak var navigationController: UINavigationController?
    
    init(
        resolver: Resolver,
        navigationController: UINavigationController?
    ) {
        self.resolver = resolver
        self.navigationController = navigationController
    }
    
    deinit {
        print("deinit User Info Coordinator")
    }
    
    func start(animated: Bool) {
        let profileBuilder = UserInfoBuilder(
            resolver: resolver,
            moduleOutput: self
        )
        let viewController = profileBuilder.build()
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func finish(animated: Bool, completion: (() -> Void)?) {
    }
}

// MARK: - UserInfoCoordinator
extension UserInfoCoordinator: UserInfoPresenterOutput {
    func goToUserInfoModule() {
        navigationController?.popViewController(animated: true)
    }
    
    func goToWelcomeModule() {
        print("go wo welcome screen")
    }
}
