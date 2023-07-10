//
//  FilterViewIO.swift
//  MarketPlace
//
//  Created by Nikita Marin on 10.07.2023.
//

import Foundation

// MARK: - FilterViewInput
protocol FilterViewInput: AnyObject {
    func reloadFilter()
}

// MARK: - FilterViewOutput
protocol FilterViewOutput: AnyObject {
    func getFilterCount() -> Int
    func configureCell(_ cell: ProductCell, at indexPath: IndexPath)
    func selectCategory(at indexPath: IndexPath)
    func handleMinPriceInput(_ text: String)
    func handleMaxPriceInput(_ text: String)
    func applyTapped()
    func backTapped()
    func deinitEvent()
}
