//
//  AlertControllerData.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//


import Foundation
import UIKit
protocol CustomAlertData {
    var title: String? { get set }
    var message: String? { get set }
    var image: UIImage? { get set }
}

//MARK:- Default Custom Alert
struct AlertControllerData: CustomAlertData {
    var title: String?
    var message: String?
    var image: UIImage?
    
    var alertButtons: [AlertButton] = []
    
    init(title: String? = nil,
         message: String? = nil,
         image: UIImage? = nil,
         alertButtons: [AlertButton]? = nil) {
        self.title = title
        self.message = message
        self.image = image
        self.alertButtons = alertButtons ?? []
    }
}

struct AlertButton {
    let title: String?
    var action: (() -> Void)? = nil
    
    init(_ title: String? = nil,
         _ action:(() -> Void)? = nil) {
        self.title = title
        self.action = action
    }
}


//MARK:- Picker Alert Data
struct CustomPickerAlertData: CustomAlertData {
    var title: String?
    var message: String?
    var image: UIImage?
    var pickerAlertButtons: [PickerAlertButton] = []
    
    init(title: String? = nil,
         message: String? = nil,
         image: UIImage? = nil,
         alertButtons: [PickerAlertButton]? = nil) {
        self.title = title
        self.message = message
        self.pickerAlertButtons = alertButtons ?? []
    }

}

struct PickerAlertButton {
    let title: String?
    var actionWithPickerRowTitle: ((_ text: String) -> Void)? = nil
    var actionWithoutPickerRowTitle : (() -> Void)? = nil
    
    var isGettingData: Bool {
        return actionWithPickerRowTitle != nil
    }
    
    
    init(_ title: String? = nil,
         _ confirmAction: ((_ pickerRawTitle: String) -> Void)? = nil,
         _ dismissAction: (() -> Void)? = nil) {
        self.title = title
        
        switch confirmAction != nil {
        case true:
            self.actionWithPickerRowTitle = confirmAction
        default:
            self.actionWithoutPickerRowTitle = dismissAction
        }
    }
}
