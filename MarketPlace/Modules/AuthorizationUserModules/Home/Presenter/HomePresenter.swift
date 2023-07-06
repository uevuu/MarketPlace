//
//  HomePresenter.swift
//  MarketPlace
//
//  Created by Nikita Marin on 05.07.2023.
//

// MARK: - HomePresenter
final class HomePresenter {
    weak var view: HomeViewInput?
    private var output: HomePresenterOutput?
    
    init(output: HomePresenterOutput?) {
        self.output = output
    }
    
    deinit {
        print("deinit Home presenter")
    }
}

// MARK: - HomeViewOutput
extension HomePresenter: HomeViewOutput {
}
