//
//  MockCartService.swift
//  MarketPlace
//
//  Created by Nikita Marin on 13.10.2023.
//

import Combine

// MARK: - MockCartService
final class MockCartService: CartService {
    // swiftlint:disable all
    
    init() {
        self.currentProductsPublisher = CurrentValueSubject<[ProductInCartInfo], Never>(productsInCar)
    }
    
    var currentProductsPublisher: CurrentValueSubject<[ProductInCartInfo], Never>
    var lastAddedProductPublisher = PassthroughSubject<Product, Never>()
    
    private var productsInCar = [
        ProductInCartInfo(
            product: Product(
                id: 1,
                title: "Футболка",
                sellerName: "ТВОЕ",
                price: 999,
                categoryId: 1,
                quantity: 34,
                description: "Модель изготовлена из хлопка, поэтому легко очищается от загрязнений, хорошо держит форму и отличается высокой прочностью.",
                image: "https://ir.ozone.ru/s3/multimedia-d/wc750/6707461189.jpg",
                moreImages: []
            ),
            count: 1,
            addedToOrder: false
        ),
        ProductInCartInfo(
            product: Product(
                id: 2,
                title: "Штаны",
                sellerName: "ТВОЕ",
                price: 1699,
                categoryId: 2,
                quantity: 71,
                description: "Штаны давно стали важным элементом гардероба практически каждого мужчины. Они практичны и комфортны.",
                image: "https://ir.ozone.ru/s3/multimedia-x/wc750/6614303217.jpg",
                moreImages: []
            ),
            count: 2,
            addedToOrder: true
        ),
        ProductInCartInfo(
            product: Product(
                id: 3,
                title: "Худи",
                sellerName: "ARISTARHOV",
                price: 2199,
                categoryId: 3,
                quantity: 28,
                description: "Оригинальная толстовка с капюшоном из плотного материала и удобна в повседневной носке.",
                image: "https://ir.ozone.ru/s3/multimedia-u/wc750/6718746738.jpg",
                moreImages: [
                    "https://ir.ozone.ru/s3/multimedia-y/wc750/6718746850.jpg",
                    "https://ir.ozone.ru/s3/multimedia-9/wc750/6718746861.jpg",
                    "https://ir.ozone.ru/s3/multimedia-8/wc750/6718746824.jpg"
                ]
            ),
            count: 1,
            addedToOrder: false
        )
    ]
    // swiftlint:enable all
    
    func loadProducts(completion: @escaping (Result<[ProductInCartInfo], Error>) -> Void) {
        completion(.success(productsInCar))
    }
    func getProducts() -> [ProductInCartInfo]? {
        return productsInCar
    }
    
    func productInCar(productId: Int) -> Bool {
        return productsInCar.contains(where: { $0.product.id == productId })
    }
    
    func addToCar(
        product: Product
    ) {
        if !productsInCar.contains(where: { $0.product.id == product.id }) {
            productsInCar.append(
                ProductInCartInfo(
                    product: product,
                    count: 1,
                    addedToOrder: false
                )
            )
            currentProductsPublisher.send(productsInCar)
        }
    }
    
    func removeFromCar(
        product: Product
    ) {
        productsInCar.removeAll(where: { $0.product.id == product.id })
        currentProductsPublisher.send(productsInCar)
//        if !productsInCar.contains(where: { $0.product.id == product.id }) {
//            productsInCar.append(
//                ProductInCartInfo(
//                    product: product,
//                    count: 1,
//                    addedToOrder: false
//                )
//            )
//            currentProductsPublisher.send(productsInCar)
//        }
    }
    
    func removeFromCar(
        products: [ProductInCartInfo],
        completion: @escaping (Result<Any, Error>) -> Void
    ) {
    }
    
    func updateCount(
        count: Int,
        product: ProductInCartInfo,
        completion: @escaping (Result<Int, Error>) -> Void
    ) {
        
    }
    
    func addToOrder(
        product: ProductInCartInfo,
        completion: @escaping (Result<Any, Error>) -> Void
    ) {
        
    }
    
    func removeFromOrder(
        product: ProductInCartInfo,
        completion: @escaping (Result<Any, Error>) -> Void
    ) {
        
    }
}
