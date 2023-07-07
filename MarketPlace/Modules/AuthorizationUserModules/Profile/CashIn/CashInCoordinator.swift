//
//  CashInCoordinator.swift
//  MarketPlace
//
//  Created by Nikita Marin on 07.07.2023.
//

import UIKit
import Swinject

// MARK: - CashInCoordinator
final class CashInCoordinator: FlowCoordinatorProtocol {
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
        print("deinit Cash In Coordinator")
    }
    
    func start(animated: Bool) {
        let cashInBuilder = CashInBuilder(
            resolver: resolver,
            moduleOutput: self
        )
        let viewController = cashInBuilder.build()
        if #available(iOS 15.0, *) {
            if let presentationController = viewController.presentationController as? UISheetPresentationController {
                if #available(iOS 16.0, *) {
                    presentationController.detents = [
                        .custom { _ in
                            return 256
                        }
                    ]
                } else {
                    presentationController.detents = [.medium()]
                }
            }
        }
        navigationController?.topViewController?.present(
            viewController,
            animated: animated
        )
    }
    
    func finish(animated: Bool, completion: (() -> Void)?) {
    }
}

// MARK: - CashInPresenterOutput
extension CashInCoordinator: CashInPresenterOutput {
}
