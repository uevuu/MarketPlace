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
    private let selectedProduct: Product
    
    init(
        output: ProductInfoPresenterOutput?,
        productLocalDataSources: ProductLocalDataSources
    ) {
        self.output = output
        self.selectedProduct = productLocalDataSources.getSelectedProduct()
    }
    
    deinit {
        print("deinit Product Info presenter")
    }
}

// MARK: - ProductInfoViewOutput
extension ProductInfoPresenter: ProductInfoViewOutput {
    func getImagesCount() -> Int {
        return selectedProduct.moreImages.count + 1
    }
    
    func configureCell(
        _ cell: ProductImageCell,
        at indexPath: IndexPath
    ) {
        if indexPath.item == 0 {
            cell.configureCell(imageUrl: selectedProduct.image)
        } else {
            cell.configureCell(imageUrl: selectedProduct.moreImages[indexPath.item - 1])
        }
    }
    
    func configureFooter(
        _ footer: ProductInfoView,
        at indexPath: IndexPath
    ) {
        footer.configureCell(
            title: selectedProduct.title,
            sellerName: selectedProduct.sellerName,
            price: "\(selectedProduct.price) б.",
            description: selectedProduct.description
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
