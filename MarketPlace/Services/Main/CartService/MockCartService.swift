//
//  MockCartService.swift
//  MarketPlace
//
//  Created by Nikita Marin on 13.10.2023.
//

// MARK: - MockCartService
final class MockCartService: CartService {
    // swiftlint:disable all
    private var productsInCar = [
        Product(
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
        Product(
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
        Product(
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
        )
    ]
    // swiftlint:enable all
    
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        completion(.success(productsInCar))
    }
    
    func deleteFromCar(products: [Product], completion: @escaping (Result<Any, Error>) -> Void) {
    }
    
    func updateCount(
        count: Int,
        product: Product,
        completion: @escaping (Result<Int, Error>) -> Void
    ) {
        completion(.success(count))
    }
    
    func addToOrder(product: Product, completion: @escaping (Result<Any, Error>) -> Void) {
        productsInCar.append(product)
        completion(.success(product))
    }
    
    func removeFromOrder(product: Product, completion: @escaping (Result<Any, Error>) -> Void) {
    }
}
