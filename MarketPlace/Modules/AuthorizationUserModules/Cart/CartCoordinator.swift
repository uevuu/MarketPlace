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
    private var navigationController: UINavigationController?
    private var finishHandlers: [(() -> Void)] = []
    private var childCoordinators: [FlowCoordinatorProtocol] = []
    
    init(
        resolver: Resolver,
        tabBar: UITabBarController,
        finishHandler: @escaping (() -> Void)
    ) {
        self.resolver = resolver
        self.parentTabBar = tabBar
        finishHandlers.append(finishHandler)
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
        navigationController.addBottomLine(with: R.color.placeholderBottomLine())
        self.navigationController = navigationController
        parentTabBar?.addViewController(
            viewController: navigationController,
            image: UIImage(systemName: "cart")
        )
    }
    
    func finish(animated: Bool, completion: (() -> Void)?) {
        guard let finishHandler = completion else { return }
        finishHandlers.append(finishHandler)
        childCoordinators.finishAll(animated: animated, completion: nil)
        navigationController?.viewControllers = []
    }
}

// MARK: - CartPresenterOutput
extension CartCoordinator: CartPresenterOutput {
    func moduleDidUnload() {
        finishHandlers.forEach { $0() }
    }
}
