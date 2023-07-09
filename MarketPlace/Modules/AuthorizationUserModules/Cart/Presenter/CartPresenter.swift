//
//  CartPresenter.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

import Foundation

// MARK: - CartPresenter
final class CartPresenter {
    weak var view: CartViewInput?
    private weak var output: CartPresenterOutput?
    
    init(output: CartPresenterOutput?) {
        self.output = output
    }
    
    deinit {
        print("deinit Cart presenter")
    }
}

// MARK: - CartViewOutput
extension CartPresenter: CartViewOutput {
    func getItemsInCartCount() -> Int {
        return 6
    }
    func configureCell(
        _ cell: ProductInCartTableViewCell,
        at indexPath: IndexPath
    ) {
        cell.configureCell(
            title: "Кроссовки Nike",
            sellerName: "Anna S",
            count: "1 шт.",
            price: "3 500 б.",
            imageUrlString: "productImage"
        )
    }
    
    func deinitEvent() {
        output?.moduleDidUnload()
    }
}
