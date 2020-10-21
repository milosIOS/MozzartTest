//
//  AppNavigation.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.
//

import UIKit

class AppNavigation: UINavigationController {
    
    private lazy var applicationCoordinator: Coordinator  = {
        return self.makeCoordinator()
    }()
    
    private func makeCoordinator() -> Coordinator {
        return MainCoordinator(router: RouterImp(rootController: self),
                               factory: MainFactoryImp(),
                               startWithScreen: .showSplash)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applicationCoordinator.start()
    }
}
