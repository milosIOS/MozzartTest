//
//  CoordinatorFactory.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.
//

import Foundation
import UIKit
protocol CoordinatorFactory {
    func makeMainCoordinator(router : Router,
                                 startWithScrenn : MainOutputScreen) -> Coordinator & MainCoordinatorOutput
}
