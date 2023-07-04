//
//  SignUpService.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

import Alamofire

// MARK: - SignUpService
final class SignUpService {
    func signUp(
        with data: SignUpData,
        completion: @escaping (SignUpResult) -> Void
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if data.phoneNumber == "1234567" && data.email == "Admin@mail.ru" {
                return completion(.sameEmailAndPhoneNumber)
            } else if data.phoneNumber == "1234567" {
                return completion(.samePhoneNumber)
            } else if data.email == "Admin@mail.ru" {
                return completion(.sameEmail)
            } else {
                return completion(.success)
            }
        }
    }
}
