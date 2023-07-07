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
    
    func configureCell(_ cell: SettingTableViewCell, at indexPath: IndexPath) {
        if indexPath.item == 1 {
            cell.configureCell(
                title: "Город",
                helpData: "Казань"
            )
        } else {
            cell.configureCell(title: "Тема")
        }
    }
    
    func selectSetting(at indexPath: IndexPath) {
        print("go to setting")
    }
    
    func profileTapped() {
        output?.goToUserInfoModule()
    }
    
    func cashInTapped() {
        print("present for cashing bonus")
    }
}
