//
//  AlertPresentableViewController.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
import UIKit
class AlertPresentableViewController: UIViewController {
}

extension AlertPresentableViewController {
    //MARK:- Presenter methods
    func present(){
        AlertControllerPresenter.shared.present(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        AlertControllerPresenter.shared.presentNextAlert()
    }
}
