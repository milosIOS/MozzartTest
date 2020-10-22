//
//  UIColor+Theme.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience public init(hexString: String) {
        let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let redComponent = Int(color >> 16) & mask
        let greenComponent = Int(color >> 8) & mask
        let blueComponent = Int(color) & mask
        
        let red   = CGFloat(redComponent) / 255.0
        let green = CGFloat(greenComponent) / 255.0
        let blue  = CGFloat(blueComponent) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat,alpha:CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha:alpha)
    }
    
}

//TODO:- When we get design here will be imported app colors
extension UIColor {
    static let primaryGreen = UIColor(hexString: "1A8B7E")
    
    //MARK:- Alert colors
    static let alertTextColor = UIColor(hexString: "#3E3E3E")
    static let alertBackgroundColor = UIColor(hexString: "#F8F8F8")
    static let alertBorderColor = UIColor(hexString: "#DCEBEB")
    static let alertButonTextColor = UIColor(hexString: "#0070FF")
    
    //MARK:- Tabbar colors
    static let tabbarSelected = UIColor(hexString: "#B5A77D")
    static let tabbarInactive = UIColor(hexString: "#FFFFFF")
    
    //MARK:- Side bar colors
    static let sideBarSelected = UIColor(hexString: "#B5A77D")
    static let sideBarInactive = UIColor(hexString: "#FFFFFF")
}
