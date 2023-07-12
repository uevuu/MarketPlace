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
    private let userInfoService: UserInfoService
    
    init(
        output: CashInPresenterOutput?,
        userInfoService: UserInfoService
    ) {
        self.output = output
        self.userInfoService = userInfoService
    }
    
    deinit {
        print("deinit Cash In presenter")
    }
}

// MARK: - CashInViewOutput
extension CashInPresenter: CashInViewOutput {
    func cashIn(points: String) {
        userInfoService.addPointCount(Int(points) ?? 0) { [weak self] result in
            switch result {
            case .success(let userInfo):
                let newPoints = userInfo.points
                print(newPoints)
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func deinitEvent() {
        output?.moduleDidUnload()
    }
}
