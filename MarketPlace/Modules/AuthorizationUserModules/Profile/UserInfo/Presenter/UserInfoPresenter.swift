//
//  UserInfoPresenter.swift
//  MarketPlace
//
//  Created by Nikita Marin on 06.07.2023.
//

// MARK: - UserInfoPresenter
final class UserInfoPresenter {
    weak var view: UserInfoViewInput?
    private var output: UserInfoPresenterOutput?
    
    init(
        output: UserInfoPresenterOutput?
    ) {
        self.output = output
    }
    
    deinit {
        print("deinit User Info presenter")
    }
}

// MARK: - UserInfoViewOutput
extension UserInfoPresenter: UserInfoViewOutput {
}

