//
//  OrderInfoViewController.swift
//  MarketPlace
//
//  Created by Nikita Marin on 10.07.2023.
//

import UIKit

// MARK: - OrderInfoViewController
class OrderInfoViewController: UIViewController {
    private let output: OrderInfoViewOutput
    
    // MARK: - UI
    
    private lazy var productsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UserOrderInfoTableViewCell.self)
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.tableHeaderView = headerView
        return tableView
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        return view
    }()

    // MARK: - Init
    
    init(output: OrderInfoViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit Order Info view")
        output.deinitEvent()
    }
    
    // MARK: - Lifecycle
       
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        view.addSubview(productsTableView)
        view.backgroundColor = R.color.background()
        setConstraints()
    }
    
    private func configureNavigationBar() {
        title = R.string.localizable.orderingInformation()
        navigationController?.navigationBar.titleTextAttributes = [
            .font: R.font.robotoRegular(size: 15) ?? UIFont()
        ]
        navigationItem.leftBarButtonItem = BackBarButton()
        navigationItem.leftBarButtonItem?.action = #selector(backButtonTapped)
        navigationItem.leftBarButtonItem?.target = self
    }
    
    private func setConstraints() {
        productsTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    // MARK: - Private
    
    @objc private func backButtonTapped() {
        output.backTapped()
    }
}

// MARK: - OrderInfoViewInput
extension OrderInfoViewController: OrderInfoViewInput {
}

// MARK: - UITableViewDataSource
extension OrderInfoViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return output.getProductsCount()
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(UserOrderInfoTableViewCell.self, for: indexPath)
        output.configureCell(cell, at: indexPath)
        return cell
    }
}
