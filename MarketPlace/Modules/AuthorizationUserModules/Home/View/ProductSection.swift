//
//  ProductSection.swift
//  MarketPlace
//
//  Created by Nikita Marin on 06.07.2023.
//

import UIKit

protocol Section {
    func layoutSection() -> NSCollectionLayoutSection
}

// MARK: - ProductSection
final class ProductSection: Section {
    func layoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
             layoutSize: NSCollectionLayoutSize(
                 widthDimension: .fractionalWidth(1),
                 heightDimension: .fractionalHeight(1)
             )
         )
         item.contentInsets = NSDirectionalEdgeInsets(
             top: 4,
             leading: 4,
             bottom: 4,
             trailing: 4
         )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalWidth(0.7)
             ),
            subitems: [item, item]
        )
//         let group = NSCollectionLayoutGroup.vertical(
//             layoutSize: NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(0.5),
//                heightDimension: .fractionalWidth(0.7)
//             ),
//             subitem: item,
//             count: 2
//             )
        
        
         
         
         let section = NSCollectionLayoutSection(group: group)

         return section
    }
}
