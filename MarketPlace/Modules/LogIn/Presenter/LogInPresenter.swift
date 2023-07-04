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
            if emailOrPhone.isValidEmailOrPhoneNumber() {
                if ["Adm@ma.ru", "Nikita@qq.q"].contains(where: { $0 == emailOrPhone }) {
                    view?.hideUserExistError()
                    if password == "123" {
                        view?.hidePasswordError()
                    } else {
                        view?.showPasswordError()
                    }
                } else {
                    view?.showUserExistError()
                    view?.showPasswordError()
                }
            } else {
                view?.showPhoneNumberOrEmailValidationError()
                view?.showPasswordError()
            }
        } else {
            if emailOrPhone.isEmpty {
                view?.showEmptyEmailOrPhoneError()
            } else {
                if emailOrPhone.isValidEmailOrPhoneNumber() {
                    view?.hideUserExistError()
                } else {
                    view?.showPhoneNumberOrEmailValidationError()
                }
            }
            if password.isEmpty {
                view?.showEmptyPasswordError()
            }
        }
    }
}
