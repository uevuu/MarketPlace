//
//  CartService.swift
//  MarketPlace
//
//  Created by Nikita Marin on 13.10.2023.
//

// MARK: - CartService
protocol CartService: AnyObject {
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void)
    
    func deleteFromCar(
        products: [Product],
        completion: @escaping (Result<Any, Error>) -> Void
    )
    func updateCount(
        count: Int,
        product: Product,
        completion: @escaping (Result<Int, Error>) -> Void
    )
    
    func addToOrder(
        product: Product,
        completion: @escaping (Result<Any, Error>) -> Void
    )
    
    func removeFromOrder(
        product: Product,
        completion: @escaping (Result<Any, Error>) -> Void
    )
}
