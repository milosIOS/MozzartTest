//
//  AlertMessage.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
class AlertMessage: Error {
    private enum Constants {
        static let noConnection = (title: "Alert.Title.NoInternet".localized,
                                   message: "Alert.Message.NoInternet".localized)
    }
    // MARK: - Vars & Lets
    
    var title = ""
    var message = ""
    
    // MARK: - Intialization
    
    init(title: String, body: String) {
        self.title = title
        self.message = body
    }
    
    /// No connection init
    convenience init() {
        self.init(title: Constants.noConnection.title, body: Constants.noConnection.message)
    }
}
