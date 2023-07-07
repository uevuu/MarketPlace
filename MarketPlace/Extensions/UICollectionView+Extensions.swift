//
//  UICollectionView+Extensions.swift
//  MarketPlace
//
//  Created by Nikita Marin on 06.07.2023.
//

import UIKit

extension UICollectionView {
    func register(_ cellClass: UICollectionViewCell.Type) {
        register(cellClass, forCellWithReuseIdentifier: "\(cellClass.self)")
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(
        _ cellClass: T.Type,
        for indexPath: IndexPath
    ) -> T {
        guard let cell = self.dequeueReusableCell(
            withReuseIdentifier: "\(cellClass.self)",
            for: indexPath
        ) as? T else {
            fatalError("Forgot register \(T.self)")
        }
        return cell
    }
}
