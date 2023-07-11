//
//  HomePresenter.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

import UIKit

// MARK: - HomePresenter
final class HomePresenter {
    weak var view: HomeViewInput?
    private weak var output: HomePresenterOutput?
    
    init(output: HomePresenterOutput?) {
        self.output = output
    }
    
    deinit {
        print("deinit Home presenter")
    }
}

// MARK: - HomeViewOutput
extension HomePresenter: HomeViewOutput {
    func getProductsCount() -> Int {
        return 10
    }
    
    func configureCell(
        _ cell: ProductCell,
        at indexPath: IndexPath
    ) {
        cell.configureCell(
            imageUrl: "productImage",
            price: 2000,
            title: "Брюки женские серые",
            sellerName: "Anna S"
        )
    }
    
    func selectProduct(at indexPath: IndexPath) {
        output?.goToProductModule()
    }
    
    func handleTextInput(_ text: String) {
        print("search some")
    }
    
    func filterTapped() {
        output?.goToFilterModule()
    }
    
    func addProductTapped() {
        output?.goToCreateProductModule()
    }
    
    func deinitEvent() {
        output?.moduleDidUnload()
    }
}
