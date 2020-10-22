//
//  UIViewController+AlertSheet.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
import UIKit
extension UIViewController {
    func presentCustomAlertSheet(title: String? = nil,
                                 message: String? = nil,
                                 alertButtons:[AlertButton],
                                 sender: UIView? = nil) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .actionSheet)
        
        if alertButtons.count < 0 {
            alert.addAction(UIAlertAction(title: "Common.Cancel".localized,
                                          style: .cancel,
                                          handler: { _ in
                                            alert.dismiss(animated: true,
                                                          completion: nil)
            }))
        } else {
            for button in alertButtons {
                alert.addAction(UIAlertAction(title: button.title ?? "Common.Ok".localized,
                                              style: (button.title ?? "") == "Common.Cancel".localized ? .cancel : .default,
                                              handler: { _ in
                                                button.action?()
                                                alert.dismiss(animated: true,
                                                              completion: nil)
                }))
            }
        }
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            guard sender != nil else { return }
            if let popoverPresentationController = alert.popoverPresentationController {
                popoverPresentationController.sourceView = sender
                popoverPresentationController.sourceRect = (sender as AnyObject).bounds
                popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirection.up
                self.present(alert, animated: true, completion: nil)
            }
            return
        }
        self.present(alert, animated: true, completion: nil)
    }
}
