//
//  CartViewIO.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

import Foundation

// MARK: - CartViewInput
protocol CartViewInput: AnyObject {
}

// MARK: - CartViewOutput
protocol CartViewOutput: AnyObject {
    func deinitEvent()
    func getItemsInCartCount() -> Int
    func configureCell(_ cell: ProductInCartTableViewCell, at indexPath: IndexPath)
}
