//
//  CashInPresenter.swift
//  MarketPlace
//
//  Created by Nikita Marin on 07.07.2023.
//

// MARK: - CashInPresenter
final class CashInPresenter {
    weak var view: CashInViewInput?
    private var output: CashInPresenterOutput?
    
    init(
        output: CashInPresenterOutput?
    ) {
        self.output = output
    }
    
    deinit {
        print("deinit Cash In presenter")
    }
}

// MARK: - CashInViewOutput
extension CashInPresenter: CashInViewOutput {
}
