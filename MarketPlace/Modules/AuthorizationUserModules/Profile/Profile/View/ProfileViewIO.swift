//
//  ProfileViewIO.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

import UIKit

// MARK: - ProfileViewInput
protocol ProfileViewInput: AnyObject {
    func reloadSetting(at indexPath: IndexPath)
}

// MARK: - ProfileViewOutput
protocol ProfileViewOutput: AnyObject {
    func getSettingCount() -> Int
    func configureCell(_ cell: SettingTableViewCell, at indexPath: IndexPath)
    func selectSetting(at indexPath: IndexPath)
    func profileTapped()
    func cashInTapped()
}
