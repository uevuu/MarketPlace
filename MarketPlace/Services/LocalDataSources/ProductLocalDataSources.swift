//
//  ProductLocalDataSource.swift
//  MarketPlace
//
//  Created by Nikita Marin on 14.10.2023.
//

final class ProductLocalDataSource {
    private var selectedProduct: Product?
    
    func getSelectedProduct() -> Product {
        guard let product = selectedProduct else {
            fatalError("You forgot to specify the product")
        }
        return product
    }
    
    func setSelectedProduct(product: Product) {
        selectedProduct = product
    }
}
