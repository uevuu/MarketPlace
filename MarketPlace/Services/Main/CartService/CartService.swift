//
//  CartService.swift
//  MarketPlace
//
//  Created by Nikita Marin on 13.10.2023.
//

import Combine

// MARK: - CartService
protocol CartService: AnyObject {
    var currentProductsPublisher: CurrentValueSubject<[ProductInCartInfo], Never> { get }
    func loadProducts(completion: @escaping (Result<[ProductInCartInfo], Error>) -> Void)
    func getProducts() -> [ProductInCartInfo]?
    
    func productInCar(productId: Int) -> Bool
    
    func addToCar(
        product: Product
    )
    
    func removeFromCar(
        product: Product
    )
    
    func removeFromCar(
        products: [ProductInCartInfo],
        completion: @escaping (Result<Any, Error>) -> Void
    )
    
    func updateCount(
        count: Int,
        product: ProductInCartInfo
    )
    
    func addToOrder(
        product: ProductInCartInfo,
        completion: @escaping (Result<Any, Error>) -> Void
    )
    
    func removeFromOrder(
        product: ProductInCartInfo,
        completion: @escaping (Result<Any, Error>) -> Void
    )
}
