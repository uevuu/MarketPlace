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
    private let signUpService: SignUpService
    
    init(
        output: SignUpPresenterOutput?,
        signUpService: SignUpService
    ) {
        self.output = output
        self.signUpService = signUpService
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
        checkEmailFormat(signUpData.email)
        checkPhoneNumberFormat(signUpData.phoneNumber)
        checkPasswordFormat(signUpData.password)
        if signUpData.isValid() {
            signUpService.signUp(with: signUpData) { result in
                switch result {
                case .sameEmail:
                    print("same email")
                case .samePhoneNumber:
                    print("same phone")
                case .sameEmailAndPhoneNumber:
                    print("same email and phone")
                case .success:
                    print("nice")
                case .serviceError:
                    print("service error")
                }
            }
        }
    }
    
    private func checkEmailFormat(_ email: String) {
        if email.isEmpty {
            view?.showEmptyEmailError()
        } else if !email.isValidEmail() {
            view?.showEmailValidationError()
        } else {
            view?.hideEmailValidationError()
        }
    }
    
    private func checkPhoneNumberFormat(_ phoneNumber: String) {
        if phoneNumber.isEmpty {
            view?.showEmptyPhoneNumberError()
        } else if !phoneNumber.isValidPhoneNumber() {
            view?.showPhoneNumberValidationError()
        } else {
            view?.hidePhoneNumberValidationError()
        }
    }
    
    private func checkPasswordFormat(_ password: String) {
        if password.isEmpty {
            view?.showEmptyPasswordError()
        } else if !password.isValidPassword() {
            view?.showPasswordValidationError()
        } else {
            view?.hidePasswordValidationError()
        }
    }
}
