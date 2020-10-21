//
//  SplashViewController.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.
//

import UIKit
protocol SplashView: BaseView {
    var openGameSchedules: (() -> Void)? { get set }
}
class SplashViewController: UIViewController, SplashView {
    var openGameSchedules: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        openGameSchedules?()
    }
}

extension SplashViewController: UIViewStyling {
    func setupViews() {
        UserDefaultsHandler.shared.isAppOpenedFirstTime = true
    }
}
