//
//  GameSchedulesTableCell.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
import UIKit
class GameSchedulesTableCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeLeftLabel: UILabel!
    
    var schedule: GameSchedule! {
        didSet {
            self.timeLabel.text = schedule.gameTime
            self.timeLeftLabel.text = schedule.timeLeft
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
