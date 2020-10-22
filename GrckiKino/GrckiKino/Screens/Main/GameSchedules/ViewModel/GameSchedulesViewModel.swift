//
//  GameSchedulesViewModel.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
import UIKit

protocol GameSchedulesDelegate {
    var reloadTable: (() -> Void)? { get set }
}

class GameSchedulesViewModel: NSObject {
    var reloadTable: (() -> Void)?
    private var timer: Timer?
    
    var arrayOfSchedules: [SheduledGame]  = [] {
        didSet {
            reloadTable?()
        }
    }
    
    override init() {
        super.init()
        getFirst20Games()
        self.timer = Timer.scheduledTimer(timeInterval: 1,
                                          target: self,
                                          selector: #selector(self.reloadGamesTimeLeft),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    deinit {
        timer?.invalidate()
    }
    
    @objc private func reloadGamesTimeLeft() {
        NotificationCenter.default.post(name: .reloadScheduledGamesTimeLeft, object: nil)
    }
    
    func getFirst20Games(){
        APIManager.shared.sendRequest(url: .gameSchedules, method: .get) { [weak self] (result: Swift.Result<[SheduledGame],AlertMessage>) in
            switch result {
            case .success(let data):
                self?.arrayOfSchedules = data
                self?.reloadTable?()
            case .failure(let error):
                CustomAlertViewController(title: error.title,
                                          message: error.message,
                                          alertButtons: [AlertButton("Common.Reload".localized,
                                                                     {[weak self] in
                                                                        self?.getFirst20Games()
                                                                     }),
                                                         AlertButton("Common.ExitApp".localized,
                                                                     {[weak self] in
                                                                        exit(0)
                                                                     })]).present()
            }
        }
    }
}

