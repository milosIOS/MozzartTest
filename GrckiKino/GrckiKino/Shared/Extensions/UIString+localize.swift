//
//  UIString+localize.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import UIKit
import Foundation
extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    func bounds(with font: UIFont, maxWidth: CGFloat) -> CGRect {
        let bounds = NSString(string: self).boundingRect(with: CGSize(width: maxWidth, height:  CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil)
        return bounds.integral
    }
}
