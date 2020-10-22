//
//  TalonViewModel.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
protocol TalonViewModelDelegate: class {
    func reloadCollectionView(at row: Int)
}
class TalonViewModel {
    weak var delegate: TalonViewModelDelegate?
    
    private enum Constants {
        static let maximumSelectionNumbers = 15
    }
    
    var arrayOfPossibleNumbers: [TalonNumber] = []
    var arrayOfSelectedNumbers: Set<TalonNumber> = []
    
    /// Tell us is it possible to select more numbers
    var isPossibleToSelectMore: Bool {
        return arrayOfSelectedNumbers.count < Constants.maximumSelectionNumbers
    }
    
    init(_ delegate: TalonViewModelDelegate) {
        self.delegate = delegate
        self.populateArrayOfPossibilities()
    }
    
    /// Populate array of selectable numbers
    private func populateArrayOfPossibilities() {
        var number = 1
        repeat {
            arrayOfPossibleNumbers.append(TalonNumber(value: number, isSelected: false))
            number += 1
        } while number <= 80
    }
    
    private func changeElement(completion: (Bool)->()) {
        completion(true)
    }
    
    func changeStateOfNumber( number: inout TalonNumber) {
        if number.isSelected {
            arrayOfSelectedNumbers.remove(number)
            number.isSelected = !number.isSelected
            arrayOfPossibleNumbers[number.value - 1] = number
            delegate?.reloadCollectionView(at: number.value - 1)
        }else {
            guard isPossibleToSelectMore else {
                CustomAlertViewController(title: "Alert.Title.MaximumNumbersSelected".localized,
                                          message: "Alert.Message.MaximumNumbersSelected".localized).present()
                return
            }
            number.isSelected = !number.isSelected
            arrayOfPossibleNumbers[number.value - 1] = number
            arrayOfSelectedNumbers.insert(number)
            delegate?.reloadCollectionView(at: number.value - 1)
        }
    }
}

