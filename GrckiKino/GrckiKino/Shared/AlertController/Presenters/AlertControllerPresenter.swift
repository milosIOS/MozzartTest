//
//  AlertControllerPresenter.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
import UIKit
protocol AlertPresentationDelegate {
    func present()
    func dismiss()
}

class AlertControllerPresenter {
    static let shared = AlertControllerPresenter()

    private var alertWindow: UIWindow
    private var alertQueue = [AlertPresentableViewController]()
    private let homeWindow = UIApplication.shared.delegate?.window

    private(set) var presentedAlert: AlertPresentableViewController?

    private init() {
        alertWindow = UIWindow(frame: UIScreen.main.bounds)
        let blankVC = UIViewController()
        blankVC.view.backgroundColor = UIColor.clear
        alertWindow.rootViewController = blankVC
        alertWindow.backgroundColor = .clear
        alertWindow.windowLevel = UIWindow.Level.alert + 1
    }

    func present(_ alert: AlertPresentableViewController,
                 animated: Bool = false,
                 completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            if self.presentedAlert == nil {
                self.presentedAlert = alert
                self.alertWindow.makeKeyAndVisible()
                self.alertWindow.isUserInteractionEnabled = true
                self.alertWindow.isHidden = false
                alert.modalPresentationStyle = .overCurrentContext
                self.alertWindow.rootViewController!.present(alert, animated: animated, completion: completion)
            } else {
                self.alertQueue.append(alert)
            }
        }
    }

    func presentNextAlert() {
        guard presentedAlert != nil else { return }
        presentedAlert = nil
        if let nextAlert = alertQueue.first {
            alertQueue.removeFirst()
            present(nextAlert)
        } else {
            dismiss()
        }
    }

    private func dismiss() {
        alertWindow.isUserInteractionEnabled = false
        alertWindow.isHidden = true
        alertWindow.resignKey()
        homeWindow??.makeKeyAndVisible()
    }
}
