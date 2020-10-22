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
        setupViews()
    }
}

//MARK:- UIViewStyling
extension AppNavigation: UIViewStyling {
    func setupViews() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = .tabbarSelected
        navigationBarAppearace.barTintColor = .black

        // change navigation item title color
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    
    
}
