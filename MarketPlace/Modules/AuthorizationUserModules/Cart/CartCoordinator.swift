//
//  CartCoordinator.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

import UIKit
import Swinject

// MARK: - CartCoordinator
final class CartCoordinator: FlowCoordinatorProtocol {
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
        print("deinit Cart Coordinator")
    }
    
    func start(animated: Bool) {
        let cartBuilder = CartBuilder(
            resolver: resolver,
            moduleOutput: self
        )
        let viewController = cartBuilder.build()
        let navigationController = UINavigationController(rootViewController: viewController)
        parentTabBar?.addViewController(
            viewController: navigationController,
            image: UIImage(systemName: "cart")
        )
    }
    
    func finish(animated: Bool, completion: (() -> Void)?) {
    }
}

// MARK: - CartPresenterOutput
extension CartCoordinator: CartPresenterOutput {
}
