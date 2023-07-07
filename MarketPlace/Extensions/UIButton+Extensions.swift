//
//  UIButton+Extensions.swift
//  MarketPlace
//
//  Created by Nikita Marin on 07.07.2023.
//

import UIKit

extension UIButton {
    func addTarget<T: Any>(
        _ target: T,
        for action: Selector,
        event: UIControl.Event = .touchUpInside
    ) {
        addTarget(target, action: action, for: event)
    }
}
