//
//  MainCoordinator.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.
//
import Foundation
enum MainOutputScreen: Int {
    case showSplash = 1, login, register
}

protocol MainCoordinatorOutput : class {
    var finishFlow: (() -> Void)? { get set }
}

class MainCoordinator : BaseCoordinator, MainCoordinatorOutput {
    var finishFlow: (() -> Void)?

    private var factory : MainFactoryImp
    private var router  : Router
    private var startWithScreen : MainOutputScreen!
    
    init(router: Router,
         factory: MainFactoryImp,
         startWithScreen: MainOutputScreen) {
        self.factory    = factory
        self.router     = router
        self.startWithScreen = startWithScreen
    }
    
    override func start() {
        if let startWith = MainOutputScreen(rawValue: startWithScreen!.rawValue) {
            switch startWith {
            case .showSplash:
                UserDefaultsHandler.shared.isAppOpenedFirstTime ? showSplash() : showGameSchedulesScreen()
            default:
                print("other jump here")
            }
        }
    }
    
    //MARK:- Show splash screen
    private func showSplash(){
        let splashOutput = factory.makeSplashScreen()
        splashOutput.openGameSchedules = { [weak self] in
            self?.showGameSchedulesScreen()
        }
        
        router.setRootModule(splashOutput, hideBar: true)
    }
    
    //MARK:- Open login screen
    private func showGameSchedulesScreen() {
        let gameSchedulesScreen = factory.makeGameSchedulesScreen()
        gameSchedulesScreen.openGameScreen = {[weak self] in
            self?.showGameScreen()
        }
        
        router.setRootModule(gameSchedulesScreen, hideBar: true, animated: true)
    }
    
    //MARK:- Open game screen
    private func showGameScreen() {
        let gameScreen = factory.makeGameScreen()
        gameScreen.onGoBack = { [weak self] in
            self?.router.popModule(animated: true)
        }
        //router.push(gameScreen, animated: true)
        router.push(gameScreen, animated: true)
    }
    
}
