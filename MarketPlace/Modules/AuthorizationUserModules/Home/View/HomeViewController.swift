//
//  HomeViewController.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

import UIKit

// MARK: - HomeViewController
class HomeViewController: UIViewController {
    private let output: HomeViewOutput
    
    // MARK: - UI
    
    private lazy var collectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout
        )
        collectionView.register(ProductCell.self)
        collectionView.backgroundColor = R.color.background()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 8) / 2
        let itemHeight = 293 * itemWidth / 175
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        return layout
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searсhBar = UISearchBar()
        searсhBar.searchTextField.font = R.font.robotoRegular(size: 14)
        searсhBar.searchTextField.clearButtonMode = .never
        searсhBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Название товара",
            attributes: [
                .foregroundColor: R.color.secondary() ?? UIColor.gray,
                .font: R.font.robotoRegular(size: 14) ?? UIFont.systemFont(ofSize: 14)
            ]
        )
        searсhBar.delegate = self
        return searсhBar
    }()
    
    // MARK: - Init
    
    init(output: HomeViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit Home view")
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
        view.addSubview(collectionView)
        setConstraints()
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal.decrease.circle"),
            style: .plain,
            target: self,
            action: #selector(filterButtonTapped)
        )
        navigationItem.rightBarButtonItem?.tintColor = R.color.secondary()
        navigationItem.titleView = searchBar
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    // MARK: - Private
    
    @objc private func filterButtonTapped() {
        output.filterTapped()
    }
}

// MARK: - HomeViewInput
extension HomeViewController: HomeViewInput {
    func reloadView() {
        DispatchQueue.main.async { [weak collectionView] in
            collectionView?.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return output.getProductsCount()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(ProductCell.self, for: indexPath)
        output.configureCell(cell, at: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        output.selectProduct(at: indexPath)
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBar(
        _ searchBar: UISearchBar,
        textDidChange searchText: String
    ) {
        output.handleTextInput(searchText)
    }
}
