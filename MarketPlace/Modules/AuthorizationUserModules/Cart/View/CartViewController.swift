//
//  CartViewController.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

import UIKit

// MARK: - CartViewController
class CartViewController: UIViewController {
    private let output: CartViewOutput
    
    // MARK: - UI
    
    // MARK: - Init
    
    init(output: CartViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit Cart view")
    }
    
    // MARK: - Lifecycle
       
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = R.color.background()
        setConstraints()
    }
    
    private func configureNavigationBar() {
    }
    
    private func setConstraints() {
    }
    
    // MARK: - Private
    
}

// MARK: - CartViewInput
extension CartViewController: CartViewInput {
}
