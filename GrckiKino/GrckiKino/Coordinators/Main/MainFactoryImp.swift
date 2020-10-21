//
//  MainFactoryImp.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.
//

import Foundation
class MainFactoryImp: MainModuleFactory {
    
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
