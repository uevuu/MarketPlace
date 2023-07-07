//
//  MyOrdersBuilder.swift
//  MarketPlace
//
//  Created by Nikita Marin on 07.07.2023.
//

import UIKit
import Swinject

// MARK: - MyOrdersBuilder
final class MyOrdersBuilder {
    private let resolver: Resolver
    private var moduleOutput: MyOrdersPresenterOutput?
    
    init(
        resolver: Resolver,
        moduleOutput: MyOrdersPresenterOutput?
    ) {
        self.resolver = resolver
        self.moduleOutput = moduleOutput
    }
    
    func build() -> UIViewController {
        let presenter = MyOrdersPresenter(output: moduleOutput)
        let view = MyOrdersViewController(output: presenter)
        presenter.view = view
        return view
    }
}
