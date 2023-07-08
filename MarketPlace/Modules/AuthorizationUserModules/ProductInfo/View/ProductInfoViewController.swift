//
//  ProductInfoViewController.swift
//  MarketPlace
//
//  Created by Nikita Marin on 08.07.2023.
//

import UIKit

// MARK: - ProductInfoViewController
class ProductInfoViewController: UIViewController {
    private let output: ProductInfoViewOutput
    
    // MARK: - UI
    
    private lazy var imageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = R.color.secondary()
        pageControl.currentPageIndicatorTintColor = R.color.blue()
        return pageControl
    }()
    
    private lazy var collectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout
        )
        collectionView.register(ProductImageCell.self)
        collectionView.registerFooter(ProductInfoView.self)
        collectionView.backgroundColor = R.color.background()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var collectionViewLayout: UICollectionViewLayout = {
        let section: NSCollectionLayoutSection = {
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)
                ),
                subitems: [item]
            )
            
            let footer = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(10)
                ),
                elementKind: UICollectionView.elementKindSectionFooter,
                alignment: .bottom
            )
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [footer]
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        }()
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }()
    
    // MARK: - Init
    
    init(output: ProductInfoViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit Product Info View")
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
        view.backgroundColor = R.color.background()
        view.addSubview(collectionView)
        collectionView.addSubview(imageControl)
        imageControl.layer.zPosition = 1
        setConstraints()
    }
    
    private func configureNavigationBar() {
        title = R.string.localizable.productDescription()
        navigationController?.navigationBar.titleTextAttributes = [
            .font: R.font.robotoRegular(size: 15) ?? UIFont()
        ]
        navigationItem.leftBarButtonItem = BackBarButton()
        navigationItem.leftBarButtonItem?.action = #selector(backButtonTapped)
        navigationItem.leftBarButtonItem?.target = self
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        imageControl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.bounds.width - 35)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Private
    
    @objc private func backButtonTapped() {
        output.backTapped()
    }
    
    @objc private func addToCartButtonTapped() {
        output.addToCartTapped()
    }
}

// MARK: - ProductInfoViewInput
extension ProductInfoViewController: ProductInfoViewInput {
}

// MARK: - UICollectionViewDataSource
extension ProductInfoViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(ProductImageCell.self, for: indexPath)
        output.configureCell(cell, at: indexPath)
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableFooter(ProductInfoView.self, for: indexPath)
        footer.addToCartButton.addTarget(self, for: #selector(addToCartButtonTapped))
        output.configureFooter(footer, at: indexPath)
        return footer
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        let count = output.getImagesCount()
        imageControl.numberOfPages = count
        return count
    }
}

// MARK: - UICollectionViewDelegate
extension ProductInfoViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didEndDisplaying cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        imageControl.currentPage = collectionView.indexPathsForVisibleItems.first?.item ?? 0
    }
}
