//
//  CoordinatorFactoryImp.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.
//

import Foundation
import UIKit

final class CoordinatorFactoryImp: CoordinatorFactory {
    func makeMainCoordinator(router: Router, startWithScrenn: MainOutputScreen) -> Coordinator & MainCoordinatorOutput {
        return MainCoordinator(router: router,
                               factory: MainFactoryImp(),
                               startWithScreen: startWithScrenn)
    }
    
    
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController.controllerFromStoryboard(.main) }
    }
}

