//
//  SignUpPresenter.swift
//  MarketPlace
//
//  Created by Nikita Marin on 03.07.2023.
//
import Foundation

// MARK: - SignUpPresenter
final class SignUpPresenter {
    weak var view: SignUpViewInput?
    private var output: SignUpPresenterOutput?
    
    init(output: SignUpPresenterOutput?) {
        self.output = output
    }
}

// MARK: - SignUpPresenter
extension SignUpPresenter: SignUpViewOutput {
    func backTapped() {
        output?.goToPreviousModule()
    }
    
    func signUpTapped(signUpData: SignUpData) {
        if signUpData.firstName.isEmpty {
            view?.showEmptyFirstNameError()
        }
        if signUpData.lastName.isEmpty {
            view?.showEmptyLastNameError()
        }
        if signUpData.email.isEmpty {
            view?.showEmptyEmailError()
        } else if !signUpData.email.isValidEmail() {
            view?.showEmailValidationError()
        } else {
            view?.hideEmailValidationError()
        }
        if signUpData.phoneNumber.isEmpty {
            view?.showEmptyPhoneNumberError()
        } else if !signUpData.phoneNumber.isValidPhoneNumber() {
            view?.showPhoneNumberValidationError()
        } else {
            view?.hidePhoneNumberValidationError()
        }
        if signUpData.password.isEmpty {
            view?.showEmptyPasswordError()
        } else if !signUpData.password.isValidPassword() {
            view?.showPasswordValidationError()
        } else {
            view?.hidePasswordValidationError()
        }
    }
}
