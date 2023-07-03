//
//  ViewController.swift
//  MarketPlace
//
//  Created by Nikita Marin on 03.07.2023.
//

import UIKit
import RswiftResources

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.color.error()
        print(R.string.localizable.welcomeText())
    }
}
