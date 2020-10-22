//
//  GameSchedulesTableCell.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
import UIKit

protocol ReloadScheduledGamesDelegate: class {
    func reloadScheduledGames()
}

class GameSchedulesTableCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeLeftLabel: UILabel!
    weak var delegate: ReloadScheduledGamesDelegate?
    
    var schedule: SheduledGame! {
        didSet {
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(reloadTimeLeft),
                                                   name: .reloadScheduledGamesTimeLeft,
                                                   object: nil)
            
            self.timeLabel.text = schedule.localTime
            self.timeLeftLabel.text = schedule.timeLeft
            
            if !schedule.isBettingAvailable {
                NotificationCenter.default.removeObserver(self)
                delegate?.reloadScheduledGames()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @objc private func reloadTimeLeft() {
        self.timeLeftLabel.text = self.schedule.timeLeft
        if !schedule.isBettingAvailable {
            NotificationCenter.default.removeObserver(self)
            delegate?.reloadScheduledGames()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

