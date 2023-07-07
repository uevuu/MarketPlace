//
//  NetworkApiService.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

import Alamofire

// MARK: - NetworkApiService
final class NetworkApiService {
    private let baseURL: String
    private let apiKey: String
    
    init(
        baseUrl: String,
        apiKey: String
    ) {
        self.baseURL = baseUrl
        self.apiKey = apiKey
    }
    
    func sendRequest<T: Codable>(
        endpoint: String,
        parameters: Parameters = [:],
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        AF.request(
            baseURL + endpoint,
            parameters: parameters,
            headers: HTTPHeaders([R.string.daDataApi.authorization(): apiKey])
        )
        .validate()
        .responseDecodable { (response: DataResponse<T, AFError>) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
