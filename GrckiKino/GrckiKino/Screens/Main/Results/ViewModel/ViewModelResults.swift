//
//  ViewModelResults.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/26/20.
//

import Foundation

protocol ResultsDelegate: class {
    var reloadTable: (() -> Void)? { get set }
}

class ViewModelResults: ResultsDelegate {
    var reloadTable: (() -> Void)?
    var arrayOfPreviousResults = [CompletedGameContent]()
    init() {
        self.getPreviousDrawsResults()
    }
    
    func getPreviousDrawsResults() {
        APIManager.shared.sendRequest(url: .previousDraws,
                                      method: .get,
                                      parameters: nil) { [weak self] (result: Swift.Result<CompletedGames,AlertMessage>) in
            switch result {
            case .success(let data):
                self?.arrayOfPreviousResults = data.content
                self?.reloadTable?()
            case .failure(let error):
                CustomAlertViewController(title: error.title,
                                          message: error.message,
                                          alertButtons: [AlertButton("Common.Reload".localized,
                                                                     {[weak self] in
                                                                        self?.getPreviousDrawsResults()
                                                                     }),
                                                         AlertButton("Common.ExitApp".localized,
                                                                     {[weak self] in
                                                                        exit(0)
                                                                     })]).present()
            }
        }
    }
    
}
