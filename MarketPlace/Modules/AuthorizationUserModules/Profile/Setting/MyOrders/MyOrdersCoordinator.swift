//
//  MyOrdersCoordinator.swift
//  MarketPlace
//
//  Created by Nikita Marin on 07.07.2023.
//

import UIKit
import Swinject

// MARK: - MyOrdersCoordinator
final class MyOrdersCoordinator: FlowCoordinatorProtocol {
    private let resolver: Resolver
    private weak var navigationController: UINavigationController?
    private var finishHandlers: [(() -> Void)] = []
    private var childCoordinators: [FlowCoordinatorProtocol] = []
    
    init(
        resolver: Resolver,
        navigationController: UINavigationController?,
        finishHandler: @escaping (() -> Void)
    ) {
        self.resolver = resolver
        self.navigationController = navigationController
        finishHandlers.append(finishHandler)
    }
    
    deinit {
        print("deinit My Orders Coordinator")
    }
    
    func start(animated: Bool) {
        let myOrdersBuilder = MyOrdersBuilder(
            resolver: resolver,
            moduleOutput: self
        )
        let viewController = myOrdersBuilder.build()
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func finish(animated: Bool, completion: (() -> Void)?) {
        guard let finishHandler = completion else { return }
        finishHandlers.append(finishHandler)
        childCoordinators.finishAll(animated: animated, completion: nil)
        navigationController?.popViewController(animated: animated)
    }
}

// MARK: - MyOrdersPresenterOutput
extension MyOrdersCoordinator: MyOrdersPresenterOutput {
    func goToProfileModule() {
        navigationController?.popViewController(animated: true)
    }
    
    func goToOrderInfoModule() {
        let orderInfoCoordinator = OrderInfoCoordinator(
            resolver: resolver,
            navigationController: navigationController
        ) { [weak self] in
            self?.childCoordinators.removeFlowCoordinator(ofType: OrderInfoCoordinator.self)
        }
        childCoordinators.append(orderInfoCoordinator)
        orderInfoCoordinator.start(animated: true)
    }
    
    func moduleDidUnload() {
        finishHandlers.forEach { $0() }
    }
}
