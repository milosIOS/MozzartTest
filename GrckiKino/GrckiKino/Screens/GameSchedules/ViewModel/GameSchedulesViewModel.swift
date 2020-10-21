//
//  GameSchedulesViewModel.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
import UIKit

protocol GameSchedulesDelegate: UITableViewDelegate, UITableViewDataSource {}

class GameSchedulesViewModel: NSObject {
    var arrayOfSchedules = [GameSchedule("1", "1"),
                            GameSchedule("2", "2")]
}

