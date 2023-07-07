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
    private let settings: [SettingType] = [
        .myOrder,
        .city,
        .theme
    ]
    
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
        return settings.count
    }
    
    func configureCell(_ cell: SettingTableViewCell, at indexPath: IndexPath) {
        let setting = settings[indexPath.item]
        switch setting {
        case .theme:
            cell.configureCell(title: R.string.localizable.applicationTheme())
        case .city:
            cell.configureCell(
                title: R.string.localizable.city(),
                helpData: "Казань"
            )
        case .myOrder:
            cell.configureCell(title: R.string.localizable.myOrder())
        }
    }
    
    func selectSetting(at indexPath: IndexPath) {
        let setting = settings[indexPath.item]
        switch setting {
        case .theme:
            output?.goToAppColorTheme()
        case .city:
            output?.goToChooseCityModule()
        case .myOrder:
            output?.goToMyOrderModule()
        }
    }
    
    func profileTapped() {
        output?.goToUserInfoModule()
    }
    
    func cashInTapped() {
        output?.goToCashInModule()
    }
}
