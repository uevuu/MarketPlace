//
//  ProductInfoBuilder.swift
//  MarketPlace
//
//  Created by Nikita Marin on 08.07.2023.
//

import UIKit
import Swinject

// MARK: - ProductInfoBuilder
final class ProductInfoBuilder {
    private let resolver: Resolver
    private var moduleOutput: ProductInfoPresenterOutput?
    
    init(
        resolver: Resolver,
        moduleOutput: ProductInfoPresenterOutput?
    ) {
        self.resolver = resolver
        self.moduleOutput = moduleOutput
    }
    
    func build() -> UIViewController {
        let presenter = ProductInfoPresenter(
            output: moduleOutput,
            productLocalDataSources: resolver.resolve()
        )
        
        let view = ProductInfoViewController(output: presenter)
        presenter.view = view
        return view
    }
}
