//
//  StructGameSchedule.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
struct GameSchedule: Codable {
    var gameTime: String
    var timeLeft: String
    
    init(_ gameTime: String,
         _ timeLeft: String) {
        self.gameTime = gameTime
        self.timeLeft = timeLeft
    }
}
