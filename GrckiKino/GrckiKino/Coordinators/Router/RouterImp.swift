//
//  RouterImp.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.
//

import Foundation
import UIKit
final class RouterImp: NSObject, Router {
    private weak var rootController: UINavigationController?
    private var completions: [UIViewController : () -> Void]
    var rootPresentedNavigation : UINavigationController?
    var presentedVC : Presentable?
    
    func presentModalyWithNavigation(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        presentedVC = controller
        rootPresentedNavigation = UINavigationController()
        rootPresentedNavigation?.viewControllers = [module] as! [UIViewController]
        rootPresentedNavigation?.modalPresentationStyle = .fullScreen
        rootController?.present(rootPresentedNavigation!, animated: animated, completion: nil)
    }
    
    func pushFromPresentedVC(_ module: Presentable?, animated: Bool) {
        guard let navigation = rootPresentedNavigation else { return }
        navigation.pushViewController(module as! UIViewController, animated: animated)
    }
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
        completions = [:]
    }
    func toPresent() -> UIViewController? {
        return rootController
    }
    func present(_ module: Presentable?) {
        present(module, animated: true)
    }
    func present(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        rootController?.present(controller, animated: animated, completion: nil)
    }
    
    func dismissModule() {
        rootPresentedNavigation = nil
        dismissModule(animated: true, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        rootPresentedNavigation = nil
        rootController?.dismiss(animated: animated, completion: completion)
    }
    
    func push(_ module: Presentable?)  {
        push(module, animated: true)
    }
    
    func push(_ module: Presentable?, animated: Bool)  {
        push(module, animated: animated, completion: nil)
    }
    
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
        guard let controller = module?.toPresent(),
              controller is UINavigationController == false
        else { assertionFailure("Deprecated push UINavigationController."); return }
        
        if let completion = completion {
            completions[controller] = completion
        }
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func popModule(){
        if rootPresentedNavigation != nil {
            rootPresentedNavigation?.popViewController(animated: true)
        } else {
            popModule(animated: true)
        }
    }
    
    func popModule(animated: Bool)  {
        if let controller = rootController?.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }
    func setRootModule(_ module: Presentable?) {
        setRootModule(module, hideBar: false)
    }
    
    func setRootModule(_ module: Presentable?, hideBar: Bool) {
        guard let controller = module?.toPresent() else { return }
        rootController?.setViewControllers([controller], animated: false)
        rootController?.isNavigationBarHidden = hideBar
    }
    
    func setRootModule(_ module: Presentable?, hideBar: Bool,animated : Bool = false) {
        guard let controller = module?.toPresent() else { return }
        rootController?.setViewControllers([controller], animated: animated)
        rootController?.isNavigationBarHidden = hideBar
    }
    
    func popToRootModule(animated: Bool) {
        if let controllers = rootController?.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                runCompletion(for: controller)
            }
        }
    }
    
    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
}
