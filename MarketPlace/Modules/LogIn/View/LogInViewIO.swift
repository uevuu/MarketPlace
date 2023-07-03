//
//  LogInViewIO.swift
//  MarketPlace
//
//  Created by Nikita Marin on 03.07.2023.
//

import Foundation

// MARK: - LogInViewInput
protocol LogInViewInput: AnyObject {
}

// MARK: - LogInViewOutput
protocol LogInViewOutput: AnyObject {
    func backTapped()
}
