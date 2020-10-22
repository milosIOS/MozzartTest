//
//  TalonCollectionViewCell.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import UIKit

class TalonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    var selectionIndicatorLayer: CAShapeLayer?
    
    var number: TalonNumber! {
        didSet {
            guard let _number = number else { return }
            numberLabel.text = String(_number.value)
            indicateSelectionOrDeselection(_number.isSelected)
        }
    }
    
    func indicateSelectionOrDeselection(_ isSelected: Bool) {
        if isSelected {
            self.drawSelection(layer: selectionIndicatorLayer)
        } else {
            removeSelectionIndicator()
        }
    }
    
    func removeSelectionIndicator() {
        for sublayer in self.contentView.layer.sublayers ?? [] {
            if sublayer.name == "layerName" {
                sublayer.removeFromSuperlayer()
            }
        }
    }
}

//MARK:-
//TODO:- refactor so it can be reusable
private extension TalonCollectionViewCell {
    func drawSelection(layer: CAShapeLayer?) {
        let storkeLayer = CAShapeLayer()
        storkeLayer.name = "layerName"
        storkeLayer.fillColor = UIColor.clear.cgColor
        storkeLayer.strokeColor = UIColor.random.cgColor
        storkeLayer.lineWidth = 2
        
        // Create a rounded rect path using button's bounds.
        storkeLayer.path = CGPath(ellipseIn: self.bounds.insetBy(dx: 2 / 2, dy: 2 / 2), transform: nil)
        // Add layer to the button
        self.contentView.layer.addSublayer(storkeLayer)
        
        // Create animation layer and add it to the stroke layer.
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = CGFloat(0.0)
        animation.toValue = CGFloat(1.0)
        animation.duration = 1
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        storkeLayer.add(animation, forKey: "circleAnimation")
        
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
//MARK:-
