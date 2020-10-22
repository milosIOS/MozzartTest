//
//  NotificationCenter+Name.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
extension Notification.Name {
    /// Key for sending notification to cells to refresh timers untill game starts
    static let reloadScheduledGamesTimeLeft = Notification.Name("key.reloadScheduledGamesTimeLeft")
}
