//
//  SignUpViewController.swift
//  MarketPlace
//
//  Created by Nikita Marin on 03.07.2023.
//

import UIKit

// MARK: - SignUpViewController
class SignUpViewController: UIViewController {
    private let output: SignUpViewOutput
    
    // MARK: - UI
    
    private lazy var firstNameView = CustomTextFieldView(.firstName)
    private lazy var lastNameView = CustomTextFieldView(.lastName)
    private lazy var emailView = CustomTextFieldView(.email)
    private lazy var phoneNumberView = CustomTextFieldView(.phone)
    private lazy var passwordView = CustomTextFieldView(.passwordInSignUp)
    
    private lazy var sellerStatuSwitch: UISwitch = {
        let statusSwitch = UISwitch()
        statusSwitch.isOn = false
        statusSwitch.onTintColor = R.color.blue()
        statusSwitch.layer.cornerRadius = statusSwitch.frame.height / 2
        statusSwitch.backgroundColor = R.color.backButton()
        statusSwitch.clipsToBounds = true
        statusSwitch.translatesAutoresizingMaskIntoConstraints = false
        return statusSwitch
    }()
    
    private lazy var sellerLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.iAmSeller()
        label.font = R.font.robotoRegular(size: 14)
        label.textColor = R.color.secondaryFont()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textFiledsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            firstNameView,
            lastNameView,
            emailView,
            phoneNumberView,
            passwordView
        ])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var signUpButton = SimpleButton(title: R.string.localizable.signUp())

    // MARK: - Init
    
    init(output: SignUpViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
       
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        view.addSubview(textFiledsStackView)
        view.addSubview(signUpButton)
        view.addSubview(sellerStatuSwitch)
        view.addSubview(sellerLabel)
        view.backgroundColor = R.color.background()
        setConstraints()
    }
    
    private func configureNavigationBar() {
        title = R.string.localizable.registration()
        navigationController?.navigationBar.titleTextAttributes = [
            .font: R.font.robotoRegular(size: 15) ?? UIFont()
        ]
        navigationItem.leftBarButtonItem = BackBarButton()
        navigationItem.leftBarButtonItem?.action = #selector(backButtonTapped)
        navigationItem.leftBarButtonItem?.target = self
    }
    
    private func setConstraints() {
        textFiledsStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(27)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().inset(12)
        }
        sellerStatuSwitch.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.top.equalTo(textFiledsStackView.snp.bottom).offset(15)
        }
        sellerLabel.snp.makeConstraints { make in
            make.leading.equalTo(sellerStatuSwitch.snp.trailing).offset(15)
            make.centerY.equalTo(sellerStatuSwitch.snp.centerY)
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(sellerStatuSwitch.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - Private
    
    @objc private func backButtonTapped() {
        output.backTapped()
    }
    
    @objc private func signUpButtonTapped() {
        output.signUpTapped(signUpData: SignUpData(
            firstName: firstNameView.getInputText(),
            lastName: lastNameView.getInputText(),
            email: emailView.getInputText(),
            phoneNumber: phoneNumberView.getInputText(),
            password: passwordView.getInputText(),
            isSeller: sellerStatuSwitch.isOn
        ))
    }
}

// MARK: - SignUpViewInput
extension SignUpViewController: SignUpViewInput {
    func showEmailValidationError() {
        emailView.fieldError(name: R.string.localizable.incorrectFormat())
    }
    
    func showPhoneNumberValidationError() {
        phoneNumberView.fieldError(name: R.string.localizable.incorrectFormat())
    }
    
    func showPasswordValidationError() {
        passwordView.fieldError(name: R.string.localizable.passwordValidation())
    }
    
    func showEmptyFirstNameError() {
        firstNameView.existError()
    }
    
    func showEmptyLastNameError() {
        lastNameView.existError()
    }
    
    func showEmptyEmailError() {
        emailView.existError()
    }
    
    func showEmptyPhoneNumberError() {
        phoneNumberView.existError()
    }
    
    func showEmptyPasswordError() {
        passwordView.existError()
    }
    
    func hideEmailValidationError() {
        emailView.isCorrect()
    }
    
    func hidePhoneNumberValidationError() {
        phoneNumberView.isCorrect()
    }
    
    func hidePasswordValidationError() {
        passwordView.isCorrect()
    }
}
