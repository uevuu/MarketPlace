//
//  SignUpPresenter.swift
//  MarketPlace
//
//  Created by Nikita Marin on 03.07.2023.
//

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
}
