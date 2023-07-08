//
//  CartViewIO.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

// MARK: - CartViewInput
protocol CartViewInput: AnyObject {
}

// MARK: - CartViewOutput
protocol CartViewOutput: AnyObject {
    func deinitEvent()
}
