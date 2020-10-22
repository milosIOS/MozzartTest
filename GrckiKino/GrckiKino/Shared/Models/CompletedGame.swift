//
//  CompletedGame.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/26/20.
//

import Foundation
struct CompletedGames: Codable {
    let content: [CompletedGameContent]
    let totalPages: Int
    let totalElements: Int
    let last: Bool
    let numberOfElements: Int
    let first: Bool
    let sort: [Sort]
    let size: Int
    let number: Int
}

struct Sort: Codable {
    let direction: String
    let property: String
    let ignoreCase: Bool
    let nullHandling: String
    let descending: Bool
    let ascending: Bool
    let size: Int?
    let number: Int?
}
struct CompletedGameContent: Codable {
    let gameId: Int
    let drawId: Int
    let drawTime: Double
    let status: String
    let drawBreak: Int
    let visualDraw: Int
    let pricePoints: PricePoint
    let winningNumbers: WinningNumbers
    let prizeCategories: [PrizeCategory]
    let wagerStatistics: WagerStatistic
}
struct WinningNumbers: Codable {
    let list: [Int]
    let bonus: [Int]?
    let sidebets: SideBets?
}

struct SideBets: Codable {
    let evenNumbersCount: Int
    let oddNumbersCount: Int
    let winningColumn: Int
    let winningParity: String
    let oddNumbers: [Int]
    let evenNumbers: [Int]
    let columnNumbers: [Int:[Int]]
}

