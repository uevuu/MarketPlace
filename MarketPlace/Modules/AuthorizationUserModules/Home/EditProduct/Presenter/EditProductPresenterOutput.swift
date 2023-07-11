//
//  EditProductPresenterOutput.swift
//  MarketPlace
//
//  Created by Nikita Marin on 11.07.2023.
//

// MARK: - EditProductPresenterOutput
protocol EditProductPresenterOutput: AnyObject {
    func goToHomeModule()
    func goToSetProductModule()
    func goToEditModule()
    func moduleDidUnload()
}
