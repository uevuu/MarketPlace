//
//  UserInfo.swift
//  MarketPlace
//
//  Created by Nikita Marin on 11.07.2023.
//

import Foundation

struct UserInfo: Codable {
    let id: String
    let role: String
    let email: String
    let name: String
    let surname: String
    let patronymic: String
    let passwordHash: String
    let gender: String
    let birthDate: String
    let phone: String
    let profilePicture: String
    let points: Int
    let city: String
}
