//
//  DaDataApiService.swift
//  MarketPlace
//
//  Created by Nikita Marin on 07.07.2023.
//

import Alamofire

// MARK: - DaDataApiService
final class DaDataApiService {
    private let networkService = NetworkApiService(
        baseUrl: R.string.daDataApi.baseUrl(),
        apiKey: R.string.daDataApi.secretKey()
    )
    
    func getPopulatedAreas(
        by query: String,
        completion: @escaping (Result<PopulatedAreas, Error>) -> Void
    ) {
        networkService.sendRequest(
            endpoint: R.string.daDataApi.suggestAddress(),
            parameters: [
                R.string.daDataApi.query(): query,
                R.string.daDataApi.bounds(): R.string.daDataApi.citySettlement(),
                R.string.daDataApi.count(): 20
            ],
            completion: completion
        )
    }
}

struct PopulatedAreas: Codable {
    let suggestions: [Area]
}

struct Area: Codable {
    let value: String
    let data: AreaData
}

struct AreaData: Codable {
    let postalCode: String?
    
    private enum CodingKeys: String, CodingKey {
        case postalCode = "postal_code"
    }
}
