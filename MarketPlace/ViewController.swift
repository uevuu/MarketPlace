//
//  ViewController.swift
//  MarketPlace
//
//  Created by Nikita Marin on 03.07.2023.
//

import UIKit
import RswiftResources

class ViewController: UIViewController {
    private lazy var boldLabel: UILabel = {
        let label = UILabel()
        label.text = "SOME TEXT"
        label.textColor = .black
        label.font = R.font.robotoBold(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var regularLabel: UILabel = {
        let label = UILabel()
        label.text = "SOME TEXT"
        label.textColor = .black
        label.font = R.font.robotoRegular(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.color.background()
        view.addSubview(boldLabel)
        view.addSubview(regularLabel)
        boldLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(130)
            make.centerX.equalToSuperview()
        }
        regularLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(160)
            make.centerX.equalToSuperview()
        }
    }
}
