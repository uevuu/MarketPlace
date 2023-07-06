//
//  ProfilePresenter.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

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
}
