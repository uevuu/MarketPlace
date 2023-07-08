//
//  ProductInfoView.swift
//  MarketPlace
//
//  Created by Nikita Marin on 09.07.2023.
//

import UIKit

// MARK: - ProductInfoView
final class ProductInfoView: UICollectionReusableView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoMedium(size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var sellerNameLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoRegular(size: 16)
        label.textColor = R.color.secondary()
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoBold(size: 16)
        return label
    }()
    
    private lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.description()
        label.font = R.font.robotoRegular(size: 18)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoRegular(size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var addToCartButton: UIButton = SimpleButton(title: R.string.localizable.addToCart())
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            sellerNameLabel,
            priceLabel,
            descriptionTitleLabel,
            descriptionLabel,
            addToCartButton
        ])
        stackView.setCustomSpacing(6, after: titleLabel)
        stackView.setCustomSpacing(14, after: sellerNameLabel)
        stackView.setCustomSpacing(18, after: priceLabel)
        stackView.setCustomSpacing(12, after: descriptionTitleLabel)
        stackView.setCustomSpacing(30, after: descriptionLabel)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(stackView)
        setConstraints()
    }
    
    private func setConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(27)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    func configureCell(
        title: String,
        sellerName: String,
        price: String,
        description: String
    ) {
        titleLabel.text = title
        sellerNameLabel.text = sellerName
        priceLabel.text = price
        descriptionLabel.text = description
    }
}
