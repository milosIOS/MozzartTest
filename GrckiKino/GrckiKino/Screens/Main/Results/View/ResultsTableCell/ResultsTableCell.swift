//
//  ResultsTableCell.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/26/20.
//

import UIKit

class ResultsTableCell: UITableViewCell {

    @IBOutlet var numbers: [UILabel]!
    @IBOutlet weak var timeOfDrawAndRoundLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    fileprivate func populateSelectedNumbers() {
        var counter = 0
        for number in finishedGame.winningNumbers.list.sorted() {
            numbers[counter].text = String(number)
            counter += 1
        }
    }
    
    var finishedGame: CompletedGameContent! {
        didSet {
            let time = DateHandler().drawCompletedAt(drawTime: finishedGame.drawTime)
            //TODO:- Not tested, could be some problems. But I promised to send
            timeOfDrawAndRoundLabel.text = "Vreme izvlacenja:\(time) Kolo: \(finishedGame.drawId)"
            populateSelectedNumbers()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
