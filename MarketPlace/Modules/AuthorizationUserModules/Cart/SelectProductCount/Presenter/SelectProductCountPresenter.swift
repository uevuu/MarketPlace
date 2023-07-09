//
//  SelectProductCountPresenter.swift
//  MarketPlace
//
//  Created by Nikita Marin on 09.07.2023.
//

import UIKit

// MARK: - SelectProductCountPresenter
final class SelectProductCountPresenter {
    weak var view: SelectProductCountViewInput?
    private var output: SelectProductCountPresenterOutput?
    
    private var selectedCount = 1
    private var previousIndexPath: IndexPath?
    
    init(
        output: SelectProductCountPresenterOutput?
    ) {
        self.output = output
    }
    
    deinit {
        print("deinit Select Product Count presenter")
    }
}

// MARK: - SelectProductCountViewOutput
extension SelectProductCountPresenter: SelectProductCountViewOutput {
    func getCityCount() -> Int {
        return 9
    }
    
    func configureCell(
        _ cell: UITableViewCell,
        at indexPath: IndexPath
    ) {
        cell.textLabel?.text = "\(indexPath.item + 1)"
        if indexPath.item + 1 == selectedCount {
            previousIndexPath = indexPath
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func selectCount(at indexPath: IndexPath) {
        view?.clearTextField()
        selectedCount = indexPath.item + 1
        DispatchQueue.main.async { [weak view, previousIndexPath] in
            if let previousIndexPath = previousIndexPath {
                view?.reloadCount(at: [
                    previousIndexPath,
                    indexPath
                ])
            } else {
                view?.reloadCount(at: [indexPath])
            }
        }
    }
    
    func readyTapped(with count: String) {
        print(selectedCount)
    }
    
    func handleTextInput(_ text: String) {
        if let number = Int(text) {
            view?.setUncheck(at: [0, selectedCount - 1])
            selectedCount = number
        } else {
            selectedCount = 1
            previousIndexPath = [0, selectedCount - 1]
            view?.setCheck(at: [0, selectedCount - 1])
        }
    }
    
    func deinitEvent() {
        output?.moduleDidUnload()
    }
}
