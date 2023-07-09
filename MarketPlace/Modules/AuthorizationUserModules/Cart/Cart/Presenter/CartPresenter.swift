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
    
    func deleteAll() {
        print("delete all")
    }
    
    func selectAll() {
        print("select all")
    }
    
    func selectProduct(at index: Int) {
        print("select at \(index)")
    }
    
    func deleteProduct(at index: Int) {
        print("delete at \(index)")
    }
    
    func selectCount(at index: Int) {
        output?.goToSelectProductCountModule()
    }
    
    func proceedToCheckout() {
        print("proceedToCheckout")
    }
    
    func selectProduct(at indexPath: IndexPath) {
        output?.goToProductModule()
    }
    
    func deinitEvent() {
        output?.moduleDidUnload()
    }
}
