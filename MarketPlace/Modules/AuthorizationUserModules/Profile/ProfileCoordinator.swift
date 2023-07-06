//
//  ProfileCoordinator.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

import UIKit
import Swinject

// MARK: - ProfileCoordinator
final class ProfileCoordinator: FlowCoordinatorProtocol {
    private let resolver: Resolver
    private weak var tabBar: UITabBarController?
    
    init(
        resolver: Resolver,
        tabBar: UITabBarController
    ) {
        self.resolver = resolver
        self.tabBar = tabBar
    }
    
    deinit {
        print("deinit Home Coordinator")
    }
    
    func start(animated: Bool) {
        let profileBuilder = ProfileBuilder(
            resolver: resolver,
            moduleOutput: self
        )
        let viewController = profileBuilder.build()
        let navigationController = UINavigationController(rootViewController: viewController)
        tabBar?.addViewController(
            viewController: navigationController,
            image: UIImage(systemName: "person.crop.circle")
        )
    }
    
    func finish(animated: Bool, completion: (() -> Void)?) {
    }
}

// MARK: - ProfilePresenterOutput
extension ProfileCoordinator: ProfilePresenterOutput {
}
