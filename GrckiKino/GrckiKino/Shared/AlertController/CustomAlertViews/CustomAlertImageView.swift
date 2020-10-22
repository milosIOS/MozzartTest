//
//  CustomAlertImageView.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
import UIKit
class CustomAlertImageView: UIImageView {
    
    private enum Constants {
        static let backgroundColor = UIColor.alertBackgroundColor
        static let cornerRadius = CGFloat(25)
        static let width = 50
        static let heignt = 50
    }
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFit
        self.layer.cornerRadius = Constants.cornerRadius
        self.clipsToBounds = true
        self.backgroundColor = Constants.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(_ alertBackgroundView: UIView) {
        self.centerXAnchor.constraint(equalTo: alertBackgroundView.centerXAnchor).isActive = true
        self.topAnchor.constraint(equalTo: alertBackgroundView.topAnchor, constant: 20).isActive = true
        self.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
