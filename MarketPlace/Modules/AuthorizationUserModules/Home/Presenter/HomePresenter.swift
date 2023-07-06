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
    private var output: HomePresenterOutput?
    
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
    
    func getReuseIdentifierForItemAt(indexPath: IndexPath) -> String {
        return ProductCell.reuseIdentifier
    }
    
    func configureCell(
        _ cell: UICollectionViewCell,
        at indexPath: IndexPath
    ) {
        switch cell {
        case let  productCell as ProductCell:
            productCell.configureCell(
                imageUrl: "productImage",
                price: 2000,
                title: "Брюки женские серые",
                sellerName: "Anna S"
            )
        default:
            break
        }
    }
    
    func selectProduct(at indexPath: IndexPath) {
        print("go to product view")
    }
    
    func handleTextInput(_ text: String) {
        print("search some")
    }
    
    func filterTapped() {
        print("go to filter")
    }
}
