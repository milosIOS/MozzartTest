//
//  CustomAlertPicker.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//


import Foundation
import UIKit
class CustomAlertPicker: UIPickerView {
    
    private enum Constants {
        static let height = CGFloat(128)
    }
    
    func setConstraints(lastSubview: UIView,
                        alertBackgroundView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: alertBackgroundView.widthAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: Constants.height).isActive = true
        topAnchor.constraint(equalTo: lastSubview.bottomAnchor,
                             constant: lastSubview is UIButton ? 0 : 20).isActive = true
        leadingAnchor.constraint(equalTo: alertBackgroundView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: alertBackgroundView.trailingAnchor).isActive = true
    }
}
