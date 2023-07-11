//
//  CreateProductCoordinator.swift
//  MarketPlace
//
//  Created by Nikita Marin on 11.07.2023.
//

import UIKit
import Swinject

// MARK: - CreateProductCoordinator
final class CreateProductCoordinator: FlowCoordinatorProtocol {
    private let resolver: Resolver
    private weak var navigationController: UINavigationController?
    private var finishHandlers: [(() -> Void)] = []
    
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
        print("deinit Create Product Coordinator")
    }
    
    func start(animated: Bool) {
        let createProductBuilder = CreateProductBuilder(
            resolver: resolver,
            moduleOutput: self
        )
        let viewController = createProductBuilder.build()
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func finish(animated: Bool, completion: (() -> Void)?) {
        guard let finishHandler = completion else { return }
        finishHandlers.append(finishHandler)
        navigationController?.popViewController(animated: animated)
    }
}

// MARK: - CreateProductPresenterOutput
extension CreateProductCoordinator: CreateProductPresenterOutput {
    func goToHomeModule() {
        navigationController?.popViewController(animated: true)
    }
    
    func goToSelectCategoryModule() {
        print("go to select category")
    }
    
    func moduleDidUnload() {
        finishHandlers.forEach { $0() }
    }
}
