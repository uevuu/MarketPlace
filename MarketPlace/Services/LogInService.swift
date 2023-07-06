//
//  LogInService.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

import Alamofire

// MARK: - LogInService
final class LogInService {
    func login(
        emailOrPhoneNumber: String,
        password: String,
        completion: @escaping (LogInResult) -> Void
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if ["Adm@ma.ru", "Nikita@qq.q", "1234567"].contains(where: { $0 == emailOrPhoneNumber }) {
                if password == "123" {
                    return completion(.success)
                } else {
                    return completion(.incorrectPassword)
                }
            } else {
                return completion(.userExist)
            }
        }
    }
}
