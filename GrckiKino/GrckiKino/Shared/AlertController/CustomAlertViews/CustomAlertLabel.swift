//
//  CustomAlertLabel.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
import UIKit
class CustomAlertLabel: UILabel {
    
    private enum Constants {
        static let messageFont = UIFont.systemFont(ofSize: 15)
        static let titleFont = UIFont.systemFont(ofSize: 17, weight: .bold)
        static let backgroundColor = UIColor.alertBackgroundColor
        static let textColor = UIColor.alertTextColor
    }
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
        self.numberOfLines = 0
        self.backgroundColor = Constants.backgroundColor
        self.textColor = Constants.textColor
        self.sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitleConstraints(topAnchor: NSLayoutYAxisAnchor, alertBackgroundView: UIView) {
        self.font = Constants.titleFont
        self.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        self.leadingAnchor.constraint(equalTo: alertBackgroundView.leadingAnchor, constant: 10).isActive = true
        self.trailingAnchor.constraint(equalTo: alertBackgroundView.trailingAnchor, constant: -10).isActive = true
    }
    
    func setMessageConstraints(topAnchor: NSLayoutYAxisAnchor, alertBackgroundView: UIView) {
        self.font = Constants.messageFont
        self.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        self.leadingAnchor.constraint(equalTo: alertBackgroundView.leadingAnchor, constant: 10).isActive = true
        self.trailingAnchor.constraint(equalTo: alertBackgroundView.trailingAnchor, constant: -10).isActive = true
    }
    
}
