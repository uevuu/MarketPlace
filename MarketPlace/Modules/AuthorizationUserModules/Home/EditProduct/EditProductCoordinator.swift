//
//  EditProductCoordinator.swift
//  MarketPlace
//
//  Created by Nikita Marin on 11.07.2023.
//

import UIKit
import Swinject

// MARK: - EditProductCoordinator
final class EditProductCoordinator: FlowCoordinatorProtocol {
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
        print("deinit Edit Product Coordinator")
    }
    
    func start(animated: Bool) {
        let editProductBuilder = EditProductBuilder(
            resolver: resolver,
            moduleOutput: self
        )
        let viewController = editProductBuilder.build()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func finish(animated: Bool, completion: (() -> Void)?) {
        guard let finishHandler = completion else { return }
        finishHandlers.append(finishHandler)
        childCoordinators.finishAll(animated: animated, completion: nil)
        navigationController?.viewControllers = []
    }
}

// MARK: - EditProductPresenterOutput
extension EditProductCoordinator: EditProductPresenterOutput {
    func goToHomeModule() {
        navigationController?.popViewController(animated: true)
    }
    
    func goToSetProductModule() {
        print("next")
    }
    
    func goToEditModule() {
        print("modal show")
    }
    
    func moduleDidUnload() {
        finishHandlers.forEach { $0() }
    }
}
