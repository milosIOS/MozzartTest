//
//  GamesSchedule.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
struct SheduledGames: Codable {
    
}
struct SheduledGame: Codable {
    let gameId: Int
    let drawId: Int
    var drawTime: Double
    var status: String
    var drawBreak: Int
    var visualDraw: Int
    var pricePoints: PricePoint
    var prizeCategories: [PrizeCategory]?
    var wagerStatistics: WagerStatistic
    
    private enum Constants {
        ///
        static let drawHasStarted = "BettingClosed".localized
    }
    
    //MARK:- Time management
    /// Returns formatted time when draw will happen
    var localTime: String {
        let date = Date(timeIntervalSince1970:(drawTime/1000))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
    
    /// Return us how much time we have selected game available to bet on 
    var timeLeft: String {
        let currentTime = Date()
        let date = Date(timeIntervalSince1970:(drawTime/1000))
        let difference = Calendar.current.dateComponents([.hour, .minute, .second],
                                                         from: currentTime,
                                                         to: date)
        let hours = difference.hour ?? 0
        let minutes = difference.minute ?? 0
        let seconds = difference.second ?? 0
        guard hours >= 0, minutes >= 0, seconds >= 0 else {
            return Constants.drawHasStarted.capitalized
        }
        
        var _timeLeft = ""
        if hours != 0  {
            _timeLeft = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            _timeLeft = String(format: "%02d:%02d", minutes, seconds)
        }
        return _timeLeft
    }
   
    var isBettingAvailable: Bool {
        return timeLeft != Constants.drawHasStarted
    }
}

struct PricePoint: Codable {
    var addOn: [AddOn]
    var amount: Double
}


struct AddOn: Codable {
    var amount: Double
    var gameType: String
}

struct PrizeCategory: Codable {
    let id: Int
    var divident: Double
    var winners: Int
    var distributed: Double
    var jackpot: Int
    var fixed: Double
    var categoryType: Int
    var gameType: String
}

struct WagerStatistic: Codable {
    let columns: Int
    let wagers: Int
    var addOn: [AddOn]
}
