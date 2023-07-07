//
//  UserInfoViewIO.swift
//  MarketPlace
//
//  Created by Nikita Marin on 06.07.2023.
//

// MARK: - UserInfoViewInput
protocol UserInfoViewInput: AnyObject {
    func hideReadyButton()
}

// MARK: - UserInfoViewOutput
protocol UserInfoViewOutput: AnyObject {
    func backTapped()
    func logOutTapped()
    func deleteAccountTapped()
    func readyTapped()
}
