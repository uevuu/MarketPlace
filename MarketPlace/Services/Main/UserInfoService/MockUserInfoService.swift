//
//  MockUserInfoService.swift
//  MarketPlace
//
//  Created by Nikita Marin on 04.11.2023.
//

import Combine

// MARK: - MockUserInfoService
final class MockUserInfoService {
    var userInfoPublisher: CurrentValueSubject<UserInfo, Never>

    init() {
        self.userInfoPublisher = CurrentValueSubject<UserInfo, Never>(info)
    }
    
    private var info = UserInfo(
        id: "1",
        role: "user",
        email: "super_bob@mail.ru",
        name: "Bob",
        surname: "Ragovski",
        patronymic: nil,
        gender: nil,
        birthDate: nil,
        phone: "89174567892",
        profilePicture: nil,
        points: 3000,
        city: nil
    )
}

extension MockUserInfoService: UserInfoService {
    func loadData() {
        userInfoPublisher.send(info)
    }
    
    func addPoints(_ points: Int) {
        info.points += points
        userInfoPublisher.send(info)
    }
}
