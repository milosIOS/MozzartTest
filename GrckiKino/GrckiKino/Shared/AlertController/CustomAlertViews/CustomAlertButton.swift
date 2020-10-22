//
//  CustomAlertButton.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import UIKit
class CustomAlertButton: UIButton {
    
    private enum Constants {
        static let font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        static let titleColor = UIColor.alertButonTextColor
        static let backgroundColor = UIColor.alertBackgroundColor
        static let borderColor = UIColor.alertBorderColor.cgColor
        static let borderWidth = CGFloat(0.5)
        static let buttonHeight = CGFloat(50)
    }
    
    private var completion: (() -> Void?)? = nil
    
    @objc func actionCompletion() {
        completion?()
    }
    
    init() {
        super.init(frame: .zero)
        self.titleLabel?.font = Constants.font
        self.setTitleColor(Constants.titleColor, for: .normal)
        self.backgroundColor = Constants.backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderColor = Constants.borderColor
        self.layer.borderWidth = Constants.borderWidth
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Set constraint for single or more than 2 buttons
    func setConstraints(lastSubview: UIView,
                        alertBackgroundView: UIView,
                        isLastItem: Bool) {
        
        if isLastItem {
            self.bottomAnchor.constraint(equalTo: alertBackgroundView.bottomAnchor,
                                         constant: 0).isActive = true
        }
        
        self.widthAnchor.constraint(equalTo: alertBackgroundView.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true
        self.topAnchor.constraint(equalTo: lastSubview.bottomAnchor,
                                  constant: lastSubview is UIButton ? 0 : 20).isActive = true
        self.leadingAnchor.constraint(equalTo: alertBackgroundView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: alertBackgroundView.trailingAnchor).isActive = true
    }
    
    /// Set left button in 2 buttons alert
    func setLeftButtonConstraints(previousSubview: UIView, alertBackground: UIView) {
        self.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                     constant: 0).isActive = true
        self.topAnchor.constraint(greaterThanOrEqualTo: previousSubview.bottomAnchor,
                                  constant: 20).isActive = true
        self.widthAnchor.constraint(equalTo: alertBackground.widthAnchor,
                                    multiplier: 0.5).isActive = true
        self.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true
    }
    
    /// Ser right button in 2 buttons alert
    func setRightButtonConstraints(previousSubview: UIView, alertBackground: UIView) {
        self.bottomAnchor.constraint(equalTo: alertBackground.bottomAnchor,
                                     constant: 0).isActive = true
        self.topAnchor.constraint(greaterThanOrEqualTo: previousSubview.bottomAnchor,
                                  constant: 20).isActive = true
        self.widthAnchor.constraint(equalTo: alertBackground.widthAnchor,
                                    multiplier: 0.5).isActive = true
        self.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true
        self.trailingAnchor.constraint(equalTo: alertBackground.trailingAnchor, constant: 0).isActive = true
    }
}


extension CustomAlertButton {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside,
                   _ closure: @escaping ()->()) {
        self.completion = closure
        addTarget(self, action: #selector(actionCompletion), for: .touchUpInside)
    }
}
