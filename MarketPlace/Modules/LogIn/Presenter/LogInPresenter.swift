//
//  LogInPresenter.swift
//  MarketPlace
//
//  Created by Nikita Marin on 03.07.2023.
//

// MARK: - LogInPresenter
final class LogInPresenter {
    weak var view: LogInViewInput?
    private var output: LogInPresenterOutput?
    
    init(output: LogInPresenterOutput?) {
        self.output = output
    }
}

// MARK: - LogInViewOutput
extension LogInPresenter: LogInViewOutput {
    func backTapped() {
        output?.goToPreviousModule()
    }
    
    func logInTapped(
        emailOrPhone: String,
        password: String
    ) {
        if !emailOrPhone.isEmpty && !password.isEmpty {
            if emailOrPhone != "admin" {
                view?.showUserExistError()
            } else {
                view?.hideUserExistError()
            }
            if password != "123" {
                view?.showPasswordError()
            } else {
                view?.hidePasswordError()
            }
        }
        if emailOrPhone.isEmpty {
            view?.showEmptyEmailOrPhoneError()
        }
        if password.isEmpty {
            view?.showEmptyPasswordError()
        }
    }
}
