//
//  HomeCoordinator.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

import UIKit
import Swinject

// MARK: - HomeCoordinator
final class HomeCoordinator: FlowCoordinatorProtocol {
    private let resolver: Resolver
    private weak var parentTabBar: UITabBarController?
    
    init(
        resolver: Resolver,
        tabBar: UITabBarController
    ) {
        self.resolver = resolver
        self.parentTabBar = tabBar
    }
    
    deinit {
        print("deinit Home Coordinator")
    }
    
    func start(animated: Bool) {
        let homeBuilder = HomeBuilder(
            resolver: resolver,
            moduleOutput: self
        )
        let viewController = homeBuilder.build()
        let navigationController = UINavigationController(rootViewController: viewController)
        parentTabBar?.addViewController(
            viewController: navigationController,
            image: UIImage(systemName: "house")
        )
    }
    
    func finish(animated: Bool, completion: (() -> Void)?) {
    }
}

// MARK: - HomePresenterOutput
extension HomeCoordinator: HomePresenterOutput {
}
