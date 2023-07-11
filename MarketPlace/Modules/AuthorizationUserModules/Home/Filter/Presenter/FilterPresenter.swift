//
//  FilterPresenter.swift
//  MarketPlace
//
//  Created by Nikita Marin on 10.07.2023.
//

import UIKit

// MARK: - FilterPresenter
final class FilterPresenter {
    weak var view: FilterViewInput?
    private var output: FilterPresenterOutput?
    
    init(
        output: FilterPresenterOutput?
    ) {
        self.output = output
    }
    
    deinit {
        print("deinit Filter Presenter")
    }
}

// MARK: - FilterViewOutput
extension FilterPresenter: FilterViewOutput {
    func getFilterCount() -> Int {
        return 10
    }
    
    func configureCell(
        _ cell: UITableViewCell,
        at indexPath: IndexPath
    ) {
    }
    
    func selectCategory(at indexPath: IndexPath) {
        print(indexPath)
        view?.reloadFilter()
    }
    
    func handleMinPriceInput(_ text: String) {
        print(text)
    }
    
    func handleMaxPriceInput(_ text: String) {
        print(text)
    }
    
    func applyTapped() {
        print("Применить")
    }
    
    func backTapped() {
        output?.goToHomeModule()
    }
    
    func deinitEvent() {
        output?.moduleDidUnload()
    }
}
