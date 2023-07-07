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
    
    init(
        resolver: Resolver,
        navigationController: UINavigationController?
    ) {
        self.resolver = resolver
        self.navigationController = navigationController
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
    }
}

// MARK: - MyOrdersPresenterOutput
extension MyOrdersCoordinator: MyOrdersPresenterOutput {
    func goToProfileModule() {
        navigationController?.popViewController(animated: true)
    }
    
    func goToOrderInfoModule() {
        print("build order info module")
    }
}

