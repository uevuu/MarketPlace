//
//  CartPresenter.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

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
    func deinitEvent() {
        output?.moduleDidUnload()
    }
}
