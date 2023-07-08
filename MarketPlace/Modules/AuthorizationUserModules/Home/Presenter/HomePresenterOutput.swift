//
//  HomePresenterOutput.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

// MARK: - HomePresenterOutput
protocol HomePresenterOutput: AnyObject {
    func moduleDidUnload()
    func goToProductModule()
}
