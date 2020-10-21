//
//  Presentable.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}
extension UIViewController: Presentable {
    func toPresent() -> UIViewController? {
        return self
    }
}
