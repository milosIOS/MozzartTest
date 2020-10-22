//
//  CustomAlertAnimations.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import UIKit
class CustomAlertAnimations {
    
    //MARK:- Alert animations
    func dismissAlertAnimation(alertController: UIViewController,
                               animatedView: UIView) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 4, options: .curveEaseIn, animations: {
            animatedView.transform = .init(scaleX: 0, y: 0)
            alertController.view.backgroundColor = UIColor(white: 0, alpha: 0.0)
        }) { (completed) in
            alertController.dismiss(animated: false, completion: nil)
        }
    }
    
    func presentAlertViewAnimation(alertController: UIViewController,
                                   animatedView: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 6, options: .curveEaseOut, animations: {
            animatedView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            alertController.view.backgroundColor = UIColor(white: 0, alpha: 0.25)
        }, completion: nil)
    }
}
