//
//  HomeBuilder.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

import UIKit
import Swinject

// MARK: - HomeBuilder
final class HomeBuilder {
    private let resolver: Resolver
    private var moduleOutput: HomePresenterOutput?
    
    init(resolver: Resolver, moduleOutput: HomePresenterOutput?) {
        self.resolver = resolver
        self.moduleOutput = moduleOutput
    }
    
    func build() -> UIViewController {
        let presenter = HomePresenter(output: moduleOutput)
        let view = HomeViewController(output: presenter)
        presenter.view = view
        return view
    }
}
