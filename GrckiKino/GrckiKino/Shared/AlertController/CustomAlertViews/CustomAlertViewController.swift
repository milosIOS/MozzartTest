//
//  CustomAlertViewController.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
import UIKit
class CustomAlertViewController: AlertPresentableViewController {
    private var alertData: AlertControllerData!
    private let alertView: CustomAlertView = {
        return CustomAlertView()
    }()
    
    private let animator: CustomAlertAnimations = {
        return CustomAlertAnimations()
    }()
    
    /// multiple buttons setup
    init(title: String? = nil,
         message: String? = nil,
         image: UIImage? = nil,
         alertButtons:[AlertButton]) {
        super.init(nibName: nil, bundle: nil)
        
        alertData = AlertControllerData(title: title,
                                        message: message,
                                        image: image,
                                        alertButtons: alertButtons)
        alertViewSetup()
    }

    //MARK:- Init
    
    ///Alert without custom buttons. It dismiss itself on default button with title "Ok".
    init(title: String? = nil,
         message: String? = nil,
         image: UIImage? = nil) {
        super.init(nibName: nil, bundle: nil)
        alertData = AlertControllerData(title: title,
                                        message: message,
                                        image: image,
                                        alertButtons: [])
        alertViewSetup()
    }
    
    ///Alert with simple title and message without image or custom buttons. It dismiss itself on default button with title "Ok".
    init(title: String? = nil,
         message: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        
        alertData = AlertControllerData(title: title,
                                        message: message)
        alertViewSetup()
    }
    
    ///Alert without title or custom buttons.  It dismiss itself on default button with title "Ok".
    
    init(message: String) {
        super.init(nibName: nil, bundle: nil)
        
        alertData = AlertControllerData(title: "",
                                        message: message)
        alertViewSetup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAlertView()
    }
     
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animator.presentAlertViewAnimation(alertController: self,
                                           animatedView: alertView)
    }
    
    //MARK:- Setup alert view
    private func setUpAlertView() {
        view.addSubview(alertView)
        alertView.setAlertBackgroundConstraints(backgroundView: view)
    }
    
    //MARK:- Alert actions
    
     private func alertViewSetup() {
        self.alertView.setAlert(alertData)
        self.alertData.alertButtons.count == 2 ? setTwoButtons() : setButtons()
    }
    
    private func setTwoButtons() {
        let firstButton = CustomAlertButton()
        let secondButton = CustomAlertButton()
        
        alertView.addTwoButtons(firstButton,
                                secondButton)
        
        firstButton.setTitle(alertData.alertButtons.first?.title ?? "Common.Ok".localized, for: .normal)
        secondButton.setTitle(alertData.alertButtons[1].title ?? "Common.Cancel".localized, for: .normal)
        
        firstButton.addAction {[unowned self] in
            self.alertData.alertButtons.first?.action?()
            self.animator.dismissAlertAnimation(alertController: self,
                                                animatedView: self.alertView)
        }
        
        secondButton.addAction {[unowned self] in
            self.alertData.alertButtons[1].action?()
            self.animator.dismissAlertAnimation(alertController: self,
                                                animatedView: self.alertView)
        }
    }
    
    private func setButtons() {
        var counter = 0
        guard alertData.alertButtons.count > 0 else {
            let button = AlertButton("Common.Ok".localized)
            addButton(buttonData: button, isLast: true)
            return
        }
        
        for button in alertData.alertButtons {
            counter = counter + 1
            if counter == alertData.alertButtons.count {
                addButton(buttonData: button, isLast: true)
                return
            }
            addButton(buttonData: button, isLast: false)
        }
    }
    
    private func addButton(buttonData: AlertButton, isLast: Bool) {
        let button = CustomAlertButton()
        alertView.addButton(button, isLast)
        button.setTitle(buttonData.title, for: .normal)
        button.addAction {[unowned self] in
            buttonData.action?()
            self.animator.dismissAlertAnimation(alertController: self,
                                                animatedView: self.alertView)
        }
    }
    
}
