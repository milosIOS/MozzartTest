//
//  TalonCollectionViewHeader.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/25/20.
//

import UIKit

class TalonCollectionViewHeader: UIView {
    @IBOutlet weak var numOfSelectedBallsLabel: UILabel!
    @IBOutlet weak var drawTimeLabel: UILabel!
    @IBOutlet weak var timeUntilDrawLabel: UILabel!
    @IBOutlet weak var drawRound: UILabel!
    
    private enum Constants {
        static let drawTime = "Talon.DrawTime:".localized
        static let selectedNumbersCount = "Talon.CountOfSelectedNumbers".localized
        static let timeLeftUntilDraw = "Talon.TimeLeft".localized
        static let drawRound = "Talon.Round".localized
    }
    
    /// Initial population of labels
    func populate(_ selectedGame: SheduledGame) {
        drawTimeLabel.text = Constants.drawTime + selectedGame.localTime
        numOfSelectedBallsLabel.text = Constants.selectedNumbersCount + "\(0)"
        drawRound.text = Constants.drawRound + "\(selectedGame.drawId)"
        timeLeftIndicator(timeLeft: selectedGame.timeLeft)
    }
    
    /// Populate time left indicator label
    func timeLeftIndicator(timeLeft: String) {
        timeUntilDrawLabel.text = Constants.timeLeftUntilDraw + timeLeft
    }
    
}
