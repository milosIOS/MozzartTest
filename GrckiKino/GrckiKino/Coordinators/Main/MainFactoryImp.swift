//
//  MainFactoryImp.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.
//

import Foundation
class MainFactoryImp: MainModuleFactory {
    
    func makeSelectedGameNumbersDraw() -> DrawNumbersView {
        return NumbersDrawViewController.controllerFromStoryboard(.main)
    }
    
    func makeSelectedGameResultsScreen() -> ResultsView {
        return ResultsViewController.controllerFromStoryboard(.main)
    }
    
    func makeSelectedGameTalonScreen() -> TalonView {
        return TalonViewController.controllerFromStoryboard(.main)
    }
    
    func makeSelectedGameTabBarScreen() -> SelectedGameTabBarView {
        return SelectedGameTabBarViewController.controllerFromStoryboard(.main)
    }
    
    func makeGameScreen() -> GameView {
        return GameViewController.controllerFromStoryboard(.main)
    }
    
    func makeGameSchedulesScreen() -> GameSchedulesView {
        return GameSchedulesViewController.controllerFromStoryboard(.main)
    }
    
    func makeSplashScreen() -> SplashView {
        return SplashViewController.controllerFromStoryboard(.main)
    }
    
}
