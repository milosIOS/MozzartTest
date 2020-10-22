//
//  UICollectionView+Extensions.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import UIKit
extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type, reuseIdentifier: String? = nil) {
        self.register(T.self,
                      forCellWithReuseIdentifier: reuseIdentifier ?? String(describing: T.self))
    }
    
    func dequeue<T: UICollectionViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self),
                                             for: indexPath) as? T
        else { fatalError("Could not deque cell with type \(T.self)") }
        return cell
    }
    
    func dequeueCell(reuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
    
    
    func registerCellNib<T:UICollectionViewCell>(_:T.Type){
        self.register(UINib(nibName: String(describing:T.self),
                            bundle: nil),
                      forCellWithReuseIdentifier: String(describing:T.self))
    }
}
