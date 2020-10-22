//
//  CustomAlertView.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
import UIKit
class CustomAlertView: UIView {
    
    private enum Constants {
        static let cornerRadius = CGFloat(12)
        static let backgroundColor = UIColor.alertBackgroundColor
    }
    
    //MARK:- Alert outlets
    let alertImageView: CustomAlertImageView = {
        return CustomAlertImageView()
    }()
    
    let alertTitleLabel: CustomAlertLabel = {
        return CustomAlertLabel()
    }()

    let alertMessageLabel: CustomAlertLabel = {
        return CustomAlertLabel()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = Constants.cornerRadius
        self.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Constants.backgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK:- Set alert data

    func setAlert(_ alertData: CustomAlertData) {
        alertTitleLabel.text = alertData.title ?? ""
        alertMessageLabel.text = alertData.message
        
        alertData.image != nil ? populateAlertWithImage(alertData) : populateAlertWithoutImage(alertData)
    }
    
        
    //MARK:- Populate alert with image
    private func populateAlertWithImage(_ alertData: CustomAlertData) {
        self.setAlertImageView(alertData.image)
        self.setTitleLabel(isWithImage: true)
    }
    
    //MARK:- Populate alert without image
    private func populateAlertWithoutImage(_ alertData: CustomAlertData) {
        self.setTitleLabel(isWithImage: false)
    }
    
    //MARK:- Add image to alert
    private func setAlertImageView(_ image: UIImage?) {
        guard let image = image else { return }
        self.addSubview(alertImageView)
        alertImageView.setConstraints(self)
        alertImageView.image = image
    }
    
    //MARK:- Set alert background constraints
    func setAlertBackgroundConstraints(backgroundView: UIView) {
        self.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        
        let widthPriorityConstraint = self.widthAnchor.constraint(lessThanOrEqualToConstant: 300)
        widthPriorityConstraint.priority = UILayoutPriority(1000)
        widthPriorityConstraint.isActive = true
        
        let widthLesserConstraint = self.widthAnchor.constraint(equalToConstant: backgroundView.bounds.width * 0.9)
        widthLesserConstraint.priority = UILayoutPriority(750)
        widthLesserConstraint.isActive = true
    }
    
    //MARK:- Set alert title
    private func setTitleLabel(isWithImage:Bool){
        self.addSubview(alertTitleLabel)
        alertTitleLabel.setTitleConstraints(topAnchor: isWithImage ? alertImageView.bottomAnchor : self.topAnchor,
                                            alertBackgroundView: self)
        self.setMessageLabel()
    }
     
    //MARK:- Set alert message
    private func setMessageLabel() {
        let lastSubview = self.subviews.last
        self.addSubview(alertMessageLabel)
        alertMessageLabel.setMessageConstraints(topAnchor: lastSubview?.bottomAnchor ?? self.topAnchor,
                                                alertBackgroundView: self)
    }
    
    func add(_ pickerView: CustomAlertPicker) {
        guard let lastSubview = self.subviews.last else { return }
        self.addSubview(pickerView)
        pickerView.setConstraints(lastSubview: lastSubview,
                                  alertBackgroundView: self)
    }
    
    //MARK:- Set alert buttons
    
    //MARK: Add single button
    func addButton(_ button: CustomAlertButton, _ isLast: Bool) {
        guard let lastSubview = self.subviews.last else { return }
        self.addSubview(button)
        button.setConstraints(lastSubview: lastSubview,
                              alertBackgroundView: self,
                              isLastItem: isLast)
    }
    
    //MARK: Create alert with two buttons
    func addTwoButtons(_ firstButton: CustomAlertButton, _ secondButton: CustomAlertButton) {
        guard let previousSubview = self.subviews.last else { return }
        self.addSubview(firstButton)
        firstButton.setLeftButtonConstraints(previousSubview: previousSubview,
                                             alertBackground: self)
        
        self.addSubview(secondButton)
        secondButton.setRightButtonConstraints(previousSubview: previousSubview,
                                               alertBackground: self)
    }
    
}
