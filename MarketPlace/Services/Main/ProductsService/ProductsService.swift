//
//  ProductsService.swift
//  MarketPlace
//
//  Created by Nikita Marin on 12.07.2023.
//

import Alamofire

// MARK: - ProductsService
final class ProductsService {
    private let networkService = NetworkService()
    
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        networkService.sendGetRequest(
            endpoint: "/products",
            completion: completion
        )
    }
    
    func getSellerProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        networkService.sendGetRequest(
            endpoint: "/sellers/12/products",
            completion: completion)
    }
}
