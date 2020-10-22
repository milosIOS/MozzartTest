//
//  TalonViewController.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import UIKit

protocol TalonView: BaseView {
    var selectedGame: SheduledGame! { get set }
}

class TalonViewController: UIViewController, TalonView {
    @IBOutlet weak var gameAditionalInfoView: TalonCollectionViewHeader!
    @IBOutlet weak var talonCollectionView: UICollectionView!
    var selectedGame: SheduledGame!
    var viewModel: TalonViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

//MARK:- UIViewStyling
extension TalonViewController: UIViewStyling {
    func setupViews() {
        talonCollectionView.allowsMultipleSelection = true
        self.viewModel = TalonViewModel(self)
        self.setTimerNotificationCenter()
        gameAditionalInfoView.populate(selectedGame)
    }
}

//MARK:- CollectionView Delegate & DataSource
extension TalonViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.arrayOfPossibleNumbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(TalonCollectionViewCell.self, for: indexPath)
        cell.number = viewModel.arrayOfPossibleNumbers[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width/5, height: collectionView.frame.width/5)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell: TalonCollectionViewCell = collectionView.cellForItem(at: indexPath) as? TalonCollectionViewCell else { return }
        viewModel.changeStateOfNumber(number: &cell.number)
    }
}

//MARK:- Reload CollectionView when user select/deselect number
extension TalonViewController: TalonViewModelDelegate {
    func reloadCollectionView(at index: Int) {
        talonCollectionView.reloadItems(at: [IndexPath(row: index, section: 0)])
        gameAditionalInfoView.numOfSelectedBallsLabel.text = "Talon.CountOfSelectedNumbers".localized + "\(viewModel.arrayOfSelectedNumbers.count)"
    }
}

//MARK:- Set timer Notification Center
extension TalonViewController {
    func setTimerNotificationCenter() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reloadTimeLeft),
                                               name: .reloadScheduledGamesTimeLeft,
                                               object: nil)
    }
    
    @objc private func reloadTimeLeft() {
        self.gameAditionalInfoView.timeLeftIndicator(timeLeft: self.selectedGame.timeLeft)
        if !selectedGame.isBettingAvailable {
            NotificationCenter.default.removeObserver(self)
        }
    }
}
