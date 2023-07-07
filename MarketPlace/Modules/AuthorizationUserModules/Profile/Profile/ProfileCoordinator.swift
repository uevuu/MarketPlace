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
    private var navigationController: UINavigationController?
    
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
        navigationController.addBottomLine(with: R.color.placeholderBottomLine())
        self.navigationController = navigationController
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
    func goToUserInfoModule() {
        let userInfoCoordinator = UserInfoCoordinator(
            resolver: resolver,
            navigationController: navigationController
        )
        userInfoCoordinator.start(animated: true)
    }
    
    func goToCashInModule() {
        let cashInCoordinator = CashInCoordinator(
            resolver: resolver,
            navigationController: navigationController
        )
        cashInCoordinator.start(animated: true)
    }
    
    func goToMyOrderModule() {
        let myOrdersCoordinator = MyOrdersCoordinator(
            resolver: resolver,
            navigationController: navigationController
        )
        myOrdersCoordinator.start(animated: true)
    }
    
    func goToChooseCityModule() {
        let chooseCityCoordinator = ChooseCityCoordinator(
            resolver: resolver,
            navigationController: navigationController
        )
        chooseCityCoordinator.start(animated: true)
    }
    
    func goToAppColorTheme() {
        print("build app color module")
    }
}
