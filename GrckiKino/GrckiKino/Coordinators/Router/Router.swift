//
//  Router.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.
//

import Foundation

//TODO:- Include navigation hide/present into coordinator
protocol Router: Presentable {
    func presentModalyWithNavigation(_ module: Presentable?, animated: Bool)
    func pushFromPresentedVC(_ module:Presentable?,animated:Bool)
    
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    
    func popModule()
    func popModule(animated: Bool)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    
    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
    func setRootModule(_ module: Presentable?, hideBar: Bool,animated : Bool)
    
    func popToRootModule(animated: Bool)
}

