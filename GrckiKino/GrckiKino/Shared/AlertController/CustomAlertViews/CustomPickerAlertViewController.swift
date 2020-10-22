//
//  CustomPickerAlertViewController.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
protocol CustomPickerAlertDelegate {
    func alertPickerAction(_ pickerRowTitle: String?)
}

import Foundation
import UIKit
class CustomPickerAlertViewController: AlertPresentableViewController {
    private var pickerArray: [String]
    private var selectedRow = 0
    private var selectedComponent = 0
    
    private enum Constants {
        static let pickerViewNumberOfComponents = 1
        static let pickerViewTextColor = UIColor.black
        static let pickerViewHeight = CGFloat(128)
    }

    private var alertData: CustomPickerAlertData!
    
    private let alertView: CustomAlertView = {
        return CustomAlertView()
    }()
    
    private let animator: CustomAlertAnimations = {
        return CustomAlertAnimations()
    }()
    
    private lazy var picker: CustomAlertPicker = {
        let picker = CustomAlertPicker()
        picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
   /// multiple buttons setup
    init(title: String? = nil,
         message: String? = nil,
         image: UIImage? = nil,
         alertButtons:[PickerAlertButton],
         pickerArray:[String]) {
        self.pickerArray = pickerArray
        super.init(nibName: nil, bundle: nil)
        alertData = CustomPickerAlertData(title: title,
                                          message: message,
                                          image: image,
                                          alertButtons: alertButtons)
        self.alertViewSetup()
    }

    public required init?(coder aDecoder: NSCoder) {
        self.pickerArray = []
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
        self.alertView.add(picker)
        self.alertData.pickerAlertButtons.count == 2 ? setTwoButtons() : setButtons()
    }
    
    private func setTwoButtons() {
        let firstButton = CustomAlertButton()
        let secondButton = CustomAlertButton()
        
        alertView.addTwoButtons(firstButton,
                                secondButton)
        
        firstButton.setTitle(alertData.pickerAlertButtons.first?.title ?? "Common.Ok".localized, for: .normal)
        secondButton.setTitle(alertData.pickerAlertButtons[1].title ?? "Common.Cancel".localized, for: .normal)
        firstButton.addAction {[unowned self] in
            self.callActionFor(self.alertData.pickerAlertButtons[0])
        }
        
        secondButton.addAction {[unowned self] in
            self.callActionFor(self.alertData.pickerAlertButtons[1])
        }
    }
    
    private func callActionFor(_ buttonData: PickerAlertButton) {
        if buttonData.isGettingData {
            let text = self.pickerArray[selectedRow]
            buttonData.actionWithPickerRowTitle?(text)
        } else {
            buttonData.actionWithoutPickerRowTitle?()
        }
        self.animator.dismissAlertAnimation(alertController: self,
                                            animatedView: self.alertView)
    }
    
    private func setButtons() {
        var counter = 0
        guard alertData.pickerAlertButtons.count > 0 else {
            let button = PickerAlertButton("Common.Ok".localized)
            addButton(buttonData: button, isLast: true)
            return
        }
        
        for button in alertData.pickerAlertButtons {
            counter = counter + 1
            if counter == alertData.pickerAlertButtons.count {
                addButton(buttonData: button, isLast: true)
                return
            }
            addButton(buttonData: button, isLast: false)
        }
    }
    
    private func addButton(buttonData: PickerAlertButton, isLast: Bool) {
        let button = CustomAlertButton()
        alertView.addButton(button, isLast)
        button.setTitle(buttonData.title, for: .normal)
    
        button.addAction {[unowned self] in
            self.callActionFor(buttonData)
        }
    }
}

//MARK:- UIPickerView DataSource & Delegate
extension CustomPickerAlertViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constants.pickerViewNumberOfComponents
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: pickerArray[row], attributes: [.foregroundColor: Constants.pickerViewTextColor])
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
        selectedComponent = component
    }
}
