//
//  UserInfoService.swift
//  MarketPlace
//
//  Created by Nikita Marin on 12.07.2023.
//

import Alamofire

// MARK: - UserInfoService
final class UserInfoService {
    private let networkService = NetworkService()
    
    func addPointCount(
        _ point: Int,
        completion: @escaping (Result<UserInfo, Error>) -> Void
    ) {
        networkService.sendPutRequest(
            endpoint: "/users",
            parameters: [
                "points": point
            ],
            completion: completion
        )
    }
    
    func getInfo(completion: @escaping (Result<UserInfo, Error>) -> Void) {
        if let userId = UserDefaults.standard.string(forKey: "id") {
            print(userId)
            networkService.sendGetRequest(
                endpoint: "/users/\(userId)",
                completion: completion
            )
        }
    }
}
