//
//  ProfilePresenter.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

import UIKit

// MARK: - ProfilePresenter
final class ProfilePresenter {
    weak var view: ProfileViewInput?
    private var output: ProfilePresenterOutput?
    
    init(output: ProfilePresenterOutput?) {
        self.output = output
    }
    
    deinit {
        print("deinit Profile presenter")
    }
}

// MARK: - ProfileViewOutput
extension ProfilePresenter: ProfileViewOutput {
    func getSettingCount() -> Int {
        return 3
    }
    
    func getReuseIdentifierForItemAt(indexPath: IndexPath) -> String {
        return SettingTableViewCell.reuseIdentifier
    }
    
    func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        switch cell {
        case let settingCell as SettingTableViewCell:
            if indexPath.item == 1 {
                settingCell.configureCell(
                    title: "Город",
                    helpData: "Казань"
                )
            } else {
                settingCell.configureCell(title: "Тема")
            }
        default:
            break
        }
    }
    
    func selectSetting(at indexPath: IndexPath) {
        print("go to setting")
    }
    
    func profileTapped() {
        print("go to profile")
    }
    
    func cashInTapped() {
        print("present for cashing bonus")
    }
}
