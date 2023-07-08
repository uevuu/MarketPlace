//
//  ProductInfoViewIO.swift
//  MarketPlace
//
//  Created by Nikita Marin on 08.07.2023.
//

import Foundation

// MARK: - ProductInfoViewInput
protocol ProductInfoViewInput: AnyObject {
}

// MARK: - ProductInfoViewOutput
protocol ProductInfoViewOutput: AnyObject {
    func configureCell(_ cell: ProductImageCell, at indexPath: IndexPath)
    func configureFooter(_ footer: ProductInfoView, at indexPath: IndexPath)
    func getImagesCount() -> Int
    func addToCartTapped()
    func backTapped()
    func deinitEvent()
}
