//
//  ProductInfoPresenter.swift
//  MarketPlace
//
//  Created by Nikita Marin on 08.07.2023.
//

import Foundation

// MARK: - ProductInfoPresenter
final class ProductInfoPresenter {
    weak var view: ProductInfoViewInput?
    private weak var output: ProductInfoPresenterOutput?
    
    init(output: ProductInfoPresenterOutput?) {
        self.output = output
    }
    
    deinit {
        print("deinit Product Info presenter")
    }
}

// MARK: - ProductInfoViewOutput
extension ProductInfoPresenter: ProductInfoViewOutput {
    func getImagesCount() -> Int {
        return 4
    }
    
    func configureCell(
        _ cell: ProductImageCell,
        at indexPath: IndexPath
    ) {
        cell.configureCell(imageUrl: "productImage")
    }
    
    func configureFooter(
        _ footer: ProductInfoView,
        at indexPath: IndexPath
    ) {
        footer.configureCell(
            title: "Платье женское черное",
            sellerName: "Anna S",
            price: "3 500 б.",
            description: R.string.localizable.mockDescription()
        )
    }
    
    func addToCartTapped() {
        print("add to cart")
    }
    
    func backTapped() {
        output?.goToHomeModule()
    }
    
    func deinitEvent() {
        output?.moduleDidUnload()
    }
}
