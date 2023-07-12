//
//  Product.swift
//  MarketPlace
//
//  Created by Nikita Marin on 12.07.2023.
//

import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let sellerId: String
    let price: Int
    let categoryId: Int
    let quantity: Int
    let description: String
}
