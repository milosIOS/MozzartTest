//
//  ViewModelSelectedGameTabBar.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/25/20.
//

import Foundation
import UIKit

class ViewModelSelectedGameTabBar {
    private var talonViewController: TalonViewController!
    private var resultsViewController: ResultsViewController!
    private var numbersDrawViewController: NumbersDrawViewController!

    
    init(_ selectedGame: SheduledGame!) {
        talonViewController = TalonViewController.controllerFromStoryboard(.main)
        talonViewController.selectedGame = selectedGame
        resultsViewController = ResultsViewController.controllerFromStoryboard(.main)
        numbersDrawViewController = NumbersDrawViewController.controllerFromStoryboard(.main)
        numbersDrawViewController.selectedGame = selectedGame
    }
    
    var viewControllers: [UIViewController] {
        return [talonViewController, resultsViewController, numbersDrawViewController]
    }
    
}
