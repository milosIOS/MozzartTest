//
//  UIView+Styling.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.
//

import Foundation

protocol UIViewStyling {
    func setupViews()
}
protocol UIConstraintStyling{
    func setupConstraints()
}
protocol UIStyleCollectionView {
    func configure()
}
protocol UIStyling : UIViewStyling, UIConstraintStyling{ }
