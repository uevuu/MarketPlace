//
//  CustomTextFieldView.swift
//  MarketPlace
//
//  Created by Nikita Marin on 04.07.2023.
//

import UIKit

// MARK: - CustomTextFieldView:
final class CustomTextFieldView: UIView {
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = R.font.robotoRegular(size: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = R.font.robotoRegular(size: 12)
        label.textColor = R.color.secondaryFont()
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.placeholderBottomLine()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoRegular(size: 12)
        label.textColor = R.color.error()
        label.numberOfLines = 0
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(_ type: TextFieldType) {
        super.init(frame: .zero)
        switch type {
        case .firstName:
            titleLabel.text = R.string.localizable.firstName()
            textField.setPlaceHolderWithSecondaryColor(R.string.localizable.firstName())
        case .lastName:
            titleLabel.text = R.string.localizable.lastName()
            textField.setPlaceHolderWithSecondaryColor(R.string.localizable.lastName())
        case .email:
            titleLabel.text = R.string.localizable.email()
            textField.setPlaceHolderWithSecondaryColor(R.string.localizable.email())
            errorLabel.text = R.string.localizable.incorrectFormat()
        case .phone:
            titleLabel.text = R.string.localizable.phoneNumber()
            textField.setPlaceHolderWithSecondaryColor(R.string.localizable.phoneNumber())
            errorLabel.text = R.string.localizable.incorrectFormat()
        case .passwordInLogIn:
            titleLabel.text = R.string.localizable.password()
            textField.setPlaceHolderWithSecondaryColor(R.string.localizable.password())
            textField.isSecureTextEntry = true
            errorLabel.text = R.string.localizable.incorrectPassword()
        case .passwordInSignUp:
            titleLabel.text = R.string.localizable.password()
            textField.setPlaceHolderWithSecondaryColor(R.string.localizable.password())
            textField.isSecureTextEntry = true
            errorLabel.text = R.string.localizable.passwordValidation()
        case .emailOrPhone:
            titleLabel.text = R.string.localizable.emailOrPhoneNumber()
            textField.setPlaceHolderWithSecondaryColor(R.string.localizable.emailOrPhoneNumber())
            errorLabel.text = R.string.localizable.emailOrPhoneNumberNotExist()
        }
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        textField.addTarget(self, action: #selector(textFieldTextChanged), for: .editingChanged)
        addSubview(textField)
        addSubview(titleLabel)
        addSubview(bottomLine)
        addSubview(errorLabel)
        setConstraints()
    }
    
    private func setConstraints() {
        textField.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(45)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        
        bottomLine.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(textField.snp.bottom)
            make.height.equalTo(2)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(bottomLine.snp.bottom).offset(5)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    @objc private func textFieldTextChanged() {
        titleLabel.isHidden = textField.text?.isEmpty ?? true
        bottomLine.backgroundColor = (textField.text?.isEmpty ?? true) ?
            R.color.error() : R.color.placeholderBottomLine()
        textField.textColor = R.color.mainFont()
    }
    
    func fieldError() {
        errorLabel.isHidden = false
        textField.textColor = R.color.error()
        bottomLine.backgroundColor = R.color.error()
    }
    
    func existError() {
        bottomLine.backgroundColor = R.color.error()
    }
    
    func getInputText() -> String {
        return textField.text ?? ""
    }
    
    func isCorrect() {
        errorLabel.isHidden = true
    }
}
