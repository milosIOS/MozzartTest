//
//  MainModuleFactory.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.
//

import Foundation
protocol MainModuleFactory {
    func makeSplashScreen() -> SplashView
    func makeGameSchedulesScreen() -> GameSchedulesView
    func makeGameScreen() -> GameView
    func makeSelectedGameTabBarScreen() -> SelectedGameTabBarView
    func makeSelectedGameTalonScreen() -> TalonView
    func makeSelectedGameResultsScreen() -> ResultsView
    func makeSelectedGameNumbersDraw() -> DrawNumbersView
}
