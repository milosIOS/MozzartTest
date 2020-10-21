//
//  Coordinator.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.
//

import Foundation

protocol Coordinator : class {
    func start()
    func start(with option: LauncerManagerOption?)
}
